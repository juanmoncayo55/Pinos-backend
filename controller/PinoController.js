import PinoModel from "../model/PinoModel.js";
const pm = new PinoModel();

class Pino {
  async registrarEncuesta(req, res){
    try {
      let result = await pm.registrarEncuesta(req.body);
      // Si todo sale bien, enviamos una respuesta de éxito con status 201 (Created)
      res.status(201).json({ message: 'Interesado registrado exitosamente', data: result });
    } catch (error) {
      console.error('Error al registrar el interesado:', error); // Log para depuración en el servidor
  
      // Verificar si es un error de MySQL y si es por clave duplicada
      if (error.code === 'ER_DUP_ENTRY') { // MySQL error code for duplicate entry (1062)
        // Si el mensaje SQL sugiere duplicidad en 'cedula' (o el campo que tenga UNIQUE)
        if (error.sqlMessage && error.sqlMessage.includes('cedula')) {
            return res.status(409).json({ // 409 Conflict
                message: 'Error de registro: El número de cédula ya está registrado.',
                code: 'DUPLICATE_CEDULA'
            });
        }
        // Para otros errores de duplicidad (si tuvieras más campos UNIQUE)
        return res.status(409).json({
            message: 'Error de registro: Ya existe un registro con datos duplicados.',
            code: 'DUPLICATE_ENTRY'
        });
      }
  
      // Para otros errores de base de datos (por ejemplo, 'Column cannot be null', 'Table not found', etc.)
      if (error.code && error.errno) {
          return res.status(500).json({ // 500 Internal Server Error
              message: `Error en la base de datos: ${error.sqlMessage || 'Consulta fallida.'}`,
              code: 'DB_ERROR'
          });
      }
  
      // Para errores inesperados (ej. problemas en el modelo que no son de DB)
      res.status(500).json({
          message: 'Error interno del servidor al procesar la solicitud.',
          code: 'INTERNAL_SERVER_ERROR'
      });
    }
  }
}

export default Pino;