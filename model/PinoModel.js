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
        ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
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

        let [result] = await conn.query(sql, values);

        return { ...data, id: result.insertId };

    } catch (error) {
      console.error('Error al registrar el interesado:', error);
      throw new Error('No se pudo registrar el interesado en la base de datos.');
    }
  }
}

export default PinoModel;