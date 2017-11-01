/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import DTO.MedicoDTO;
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
public class MedicoDAO {

    private Connection con;

    public MedicoDAO(Connection con) {
        this.con = con;
    }

    /**
     * metodo que permite registrar al profesional de la salud con información adicional
     * @param med Objeto de tipo MedicoDTO con la informacion suministrada.
     * @return Valor booleano que confirma la operacion.
     * @throws SQLException Error de ejecución de sql, ocurre si hace falta
     * algun campo de la base de datos por llenar.
     */
    public boolean registrarMedico(MedicoDTO med) throws SQLException {

        String sql = "INSERT INTO medico (identificacion, servicio)"
                + " VALUES (?, ?)";

        PreparedStatement ps = con.prepareStatement(sql);

        ps.setString(1, med.getIdentificacion());
        ps.setInt(2, med.getServicio());       
        
        int resultado = ps.executeUpdate();

        return resultado == 1;

    }

    /**
     * metodo que permite obtener el medico de acuerdo a su identificador.
     * @param id Identificador en la base de datos
     * @return Objeto MedicoDTO con la informacion registrada en la base de datos
     * @throws SQLException Error de ejecución de sql, ocurre si hace falta
     * algun campo de la base de datos por llenar.
     */
    public MedicoDTO consultarMedicoPorId(String id) throws SQLException {

        String sql = "SELECT * FROM medico WHERE identificacion = ?";

        PreparedStatement ps = con.prepareStatement(sql);

        ps.setString(1, id);

        ResultSet rs = ps.executeQuery();

        MedicoDTO med = null;

        if (rs.next()) {
            med = new MedicoDTO();
            med.setIdentificacion(rs.getString("identificacion"));
            med.setServicio(rs.getInt("servicio"));

        }
        return med;
    }

    /**
     * metodo que obtiene un listado de los profesionales de la salud ordenado por el nombre
     * @return Listado de los profesionales de la salud registrados hasta el momento
     * @throws SQLException Error de ejecución de sql, ocurre si hace falta
     * algun campo de la base de datos por llenar.
     */
    public List<MedicoDTO> consultarMedico() throws SQLException {

        List<MedicoDTO> listaMed = new ArrayList<MedicoDTO>();

        String sql = "SELECT * FROM medico ORDER BY nombre";

        PreparedStatement ps = con.prepareStatement(sql);

        ResultSet rs = ps.executeQuery();

        MedicoDTO med = null;

        while (rs.next()) {
            med = new MedicoDTO();

            med.setIdentificacion(rs.getString("identificacion"));
            med.setServicio(rs.getInt("servicio"));

            listaMed.add(med);
        }

        return listaMed;

    }

    /**
     * metodo que permite consultar los profesionales, bien sea por su identificación o su codigo.
     * @param id Identificador del profesional de la salud en la base de datos
     * @param codigo Identificador del profesional de la salud en la base de datos
     * @return Objeto MedicoDTO con la información registrada
     * @throws SQLException Error de ejecución de sql, ocurre si hace falta
     * algun campo de la base de datos por llenar.
     */
    public MedicoDTO consultarMedicoPorIdCodigo(int id, int codigo) throws SQLException {

        String sql = "SELECT * FROM medico WHERE identificacion = ? OR codigo = ? ";

        PreparedStatement ps = con.prepareStatement(sql);

        ps.setInt(1, id);
        ps.setInt(2, codigo);

        ResultSet rs = ps.executeQuery();

        MedicoDTO med = null;

        if (rs.next()) {
            med = new MedicoDTO();

            med.setIdentificacion(rs.getString("identificacion"));
            med.setServicio(rs.getInt("servicio"));
        }

        return med;

    }

    /**
     * Metodo que permite consultar a los profesionales de la salud por su servicio.
     * @param servicio Identificador del servicio en la base de datos
     * @return Listado de los profesionales de la salud de acuerdo al servicio solicitado
     * @throws SQLException Error de ejecución de sql, ocurre si hace falta
     * algun campo de la base de datos por llenar.
     */
    public ArrayList<MedicoDTO> consultarMedicoPorServicio(int servicio) throws SQLException {

        ArrayList<MedicoDTO> medicos = new ArrayList<MedicoDTO>();

        String sql = "SELECT * FROM medico WHERE servicio = ?";

        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, servicio);

        ResultSet rs = ps.executeQuery();

        MedicoDTO med = null;

        while (rs.next()) {

            med = new MedicoDTO();

            med.setIdentificacion(rs.getString("identificacion"));
            med.setServicio(rs.getInt("servicio"));

            medicos.add(med);
        }
        return medicos;
    }

    /**
     * metodo que obtiene todos los profesionales de la salud con relación al servicio.
     * @return Listado de los profesionales de la salud con a información registrada
     * @throws SQLException Error de ejecución de sql, ocurre si hace falta
     * algun campo de la base de datos por llenar.
     */
    public ArrayList<String[]> listadoMedico() throws SQLException {

        String sql = "select u.nombre, u.identificacion, u.codigo, m.servicio from usuario u inner join medico m ON u.identificacion = m.identificacion";

        PreparedStatement ps = con.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        ArrayList<String[]> lista = new ArrayList<>();

        while (rs.next()) {
            String[] lis = new String[4];
            lis[0] = rs.getString("nombre");
            lis[1] = rs.getString("identificacion");
            lis[2] = rs.getString("codigo");
            lis[3] = rs.getString("servicio");
            lista.add(lis);
        }
        return lista;
    }

    /**
     * metodo que obtiene los datos de los servicios
     * @return Listado que obtiene el nombre de los servicios registrados.
     * @throws SQLException Error de ejecución de sql, ocurre si hace falta
     * algun campo de la base de datos por llenar.
     */
    public List<String> consultaServicios() throws SQLException {
        List<String> ls = new ArrayList<>();
        String sql = "select * from servicio";

        PreparedStatement ps = con.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();

        String dato = "";
        while (rs.next()) {
            dato = rs.getString(1);
            ls.add(dato);
        }
        return ls;
    }
}
