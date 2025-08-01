import conn from "../config/database.js";

class PinoModel {
  async registrarEncuesta(data){
    const {
      nombre_completo,
      cedula,
      telefono,
      direccion,
      situacion_vivienda,
      importancia_casa,
      personas_convivientes,
      ocupacion,
      tipo_contrato,
      proceso_compra,
      ingresos_personales,
      otra_ingreso_personal,
      ingresos_familiares,
      otra_ingreso_familia,
      recursos_propios,
      deudas,
      sisben,
      clasificacion_sisben,
      caja_compensacion,
      nombre_caja,
      categoria_caja,
      proyecto_los_pinos,
      asesoria,
      dia_cita,
      hora_cita
    } = data;

    try {
      const sql = `
        INSERT INTO interesados_vivienda (
          nombre_completo,
          cedula,
          telefono,
          direccion,
          situacion_vivienda,
          importancia_casa,
          personas_convivientes,
          ocupacion,
          tipo_contrato,
          proceso_compra,
          ingresos_personales,
          otra_ingreso_personal,
          ingresos_familiares,
          otra_ingreso_familia,
          recursos_propios,
          deudas,
          sisben,
          clasificacion_sisben,
          caja_compensacion,
          nombre_caja,
          categoria_caja,
          proyecto_los_pinos,
          asesoria,
          dia_cita,
          hora_cita
        ) VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14, $15, $16, $17, $18, $19, $20, $21, $22, $23, $24, $25)
        RETURNING id;
      `;

      const values = [
        nombre_completo,
        cedula,
        telefono,
        direccion,
        situacion_vivienda,
        importancia_casa,
        personas_convivientes,
        ocupacion,
        tipo_contrato,
        proceso_compra,
        ingresos_personales,
        otra_ingreso_personal,
        ingresos_familiares,
        otra_ingreso_familia,
        recursos_propios,
        deudas,
        sisben,
        clasificacion_sisben,
        caja_compensacion,
        nombre_caja,
        categoria_caja,
        proyecto_los_pinos,
        asesoria,
        dia_cita,
        hora_cita
      ];

        const result = await conn.query(sql, values);

        return { ...data, id: result.rows[0].id };

    } catch (error) {
      console.error('Error al registrar el interesado:', error);
      throw new Error('No se pudo registrar el interesado en la base de datos.');
    }
  }

  async registrarBeneficiario(data) {
    // Desestructuramos los datos del formulario, ahora con los nuevos campos.
    const {
      nombre,
      cedula,
      celular,
      correo,
      subsidio
    } = data;
  
    try {
      const sql = `
        INSERT INTO beneficiarios (
          nombre,
          cedula,
          celular,
          correo,
          subsidio
        ) VALUES ($1, $2, $3, $4, $5)
        RETURNING id;
      `;

      const values = [
        nombre,
        cedula,
        celular,
        correo,
        subsidio
      ];

      const result = await conn.query(sql, values);
  
      return { ...data, id: result.rows[0].id };
  
    } catch (error) {
      console.error('Error al registrar el beneficiario:', error);
      if (error.code === '23505') {
        throw new Error('El número de cédula ya existe en la base de datos.');
      }
      throw new Error('No se pudo registrar el beneficiario en la base de datos.');
    }
  }
}

export default PinoModel;
