/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import DTO.Programa_academicoDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Gladys M
 */
public class Programa_academicoDAO {
    
    private Connection con;

    public Programa_academicoDAO(Connection con) {
        this.con = con;
    }

    
     /**
     * Metodo que registra los datos de un programa academico en la Base de datos
     *
     * @param pro, objeto tipo Programa_academicoDTO con nombre y codigo del programa.
     * @return boolean, con valor verdadero si hubo registro exitoso, falso si existe error dentro del procedimiento.
     * @throws SQLException Error de ejecución de sql, ocurre si hace falta algun campo de la base de datos por llenar.
     */
    public boolean registrarPrograma(Programa_academicoDTO pro) throws SQLException {

        String sql = "INSERT INTO programa_academico ( nombre_programa, codigo_programa ) VALUES (? , ?)";

        PreparedStatement ps = con.prepareStatement(sql);

        ps.setString(1, pro.getNombre_programa());
        ps.setString(2, pro.getCodigo_programa());

        int resultado = ps.executeUpdate();

        return resultado == 1;

    }
    
    /**
     * Metodo que consulta todos los datos de un programa academico
     *
     * @param id, identificacion del programa academico
     * @return Programa_academicoDTO, Objeto con los datos del programa academico, si no exite, retorna null.
     * @throws SQLException Error de ejecución de sql, ocurre si hace falta algun campo de la base de datos por llenar.
     */

    public Programa_academicoDTO consultarPrograma(int id) throws SQLException {

        String sql = "SELECT * FROM programa_academico WHERE id = ?";

        PreparedStatement ps = con.prepareStatement(sql);

        ps.setInt(1, id);

        ResultSet rs = ps.executeQuery();

        Programa_academicoDTO pro = null;
        
        if (rs.next()) {
            
            pro = new Programa_academicoDTO();
            
            pro.setId(rs.getInt("id"));
            pro.setNombre_programa(rs.getString("nombre_programa"));
            pro.setCodigo_programa(rs.getString("codigo_programa"));
            
        }
        return pro;

    }
    
     /**
     * Metodo que consulta todos Programas academicos registrados en la Base de Datos 
     *     
     * @return list, Lista de Objetos tipo Programa_academicoDTO con los datos de los programas academicos, si no exiten registros retorna la lista vacia.
     * @throws SQLException Error de ejecución de sql, ocurre si hace falta algun campo de la base de datos por llenar.
     */
    
     public List<Programa_academicoDTO> consultarProgramas() throws SQLException {

        List<Programa_academicoDTO> listaProgramas = new ArrayList<Programa_academicoDTO>();

        String sql = "SELECT * FROM programa_academico ORDER BY nombre_programa";

        PreparedStatement ps = con.prepareStatement(sql);

        ResultSet rs = ps.executeQuery();

        Programa_academicoDTO pro = null;

        while (rs.next()) {
            
            pro = new Programa_academicoDTO();
            
            pro.setId(rs.getInt("id"));
            pro.setNombre_programa(rs.getString("nombre_programa"));
            pro.setCodigo_programa(rs.getString("codigo_programa"));

            listaProgramas.add(pro);
        }

        return listaProgramas;

    }

    
    
}
