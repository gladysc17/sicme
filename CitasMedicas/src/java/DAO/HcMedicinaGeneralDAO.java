/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import DTO.HcMedicinaGeneralDTO;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Time;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Gladys M
 */
public class HcMedicinaGeneralDAO {

    private Connection con;

    public HcMedicinaGeneralDAO(Connection con) {
        this.con = con;
    }

    /**
     * Metodo que registra una cita en la Base de Datos
     *
     * @param hcmed
     * @return boolean con valor verdadero si hubo registro exitoso, falso si
     * existe error dentro del procedimiento.
     * @throws SQLException Error de ejecución de sql, ocurre si hace falta
     * algun campo de la base de datos por llenar.
     */
    public boolean registrarHCMedicinaGeneral(HcMedicinaGeneralDTO hcmed) throws SQLException {

        String sql = "INSERT INTO hc_medicinageneral (idusuario_hcmed, idcita_hcmed, motivoconsulta_hcmed, enfermedadgeneral_hcmed, revisionporsistemas_hcmed, "
                + " antpatologicos_hcmed, antquirurgicos_hcmed, anttraumaticos_hcmed, anttoxicoalergicos_hcmed, antfarmacologicos_hcmed, antvenereos_hcmed, antfamiliares_hcmed, antginecologicos_hcmed, antotros_hcmed,"
                + " frecardiaca_hcmed, frerespiratoria_hcmed, tensionarterial_hcmed, temperatura_hcmed, peso_hcmed, talla_hcmed,"
                + " efestadogeneral_hcmed, efcabezacuello_hcmed, efcardiopulmonar_hcmed, efabdomen_hcmed, efgenitourinario_hcmed, efextremidades_hcmed, efpielfuneras_hcmed, efsistemanervioso_hcmed, "
                + " diagnostico1_hcmed, tipodiagnostico1_hcmed, diagnostico2_hcmed, tipodiagnostico2_hcmed, diagnostico3_hcmed, tipodiagnostico3_hcmed, tratamiento_hcmed, recomendaciones_hcmed, formulamedica_hcmed )"
                + " VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        PreparedStatement ps = con.prepareStatement(sql);

        ps.setInt(1, hcmed.getIdusuario_hcmed());
        ps.setInt(2, hcmed.getIdcita_hcmed());
        ps.setString(3, hcmed.getMotivoconsulta_hcmed());
        ps.setString(4, hcmed.getEnfermedadgeneral_hcmed());
        ps.setString(5, hcmed.getRevisionporsistemas_hcmed());
        ps.setString(6, hcmed.getAntpatologicos_hcmed());
        ps.setString(7, hcmed.getAntquirurgicos_hcmed());
        ps.setString(8, hcmed.getAnttraumaticos_hcmed());
        ps.setString(9, hcmed.getAnttoxicoAlergicos_hcmed());
        ps.setString(10, hcmed.getAntfarmacologicos_hcmed());
        ps.setString(11, hcmed.getAntvenereos_hcmed());
        ps.setString(12, hcmed.getAntfamiliares_hcmed());
        ps.setString(13, hcmed.getAntginecologicos_hcmed());
        ps.setString(14, hcmed.getAntotros_hcmed());        
        ps.setString(15, hcmed.getEfestadogeneral_hcmed());
        ps.setString(16, hcmed.getEfcabezacuello_hcmed());
        ps.setString(17, hcmed.getEfcardiopulmonar_hcmed());
        ps.setString(18, hcmed.getEfabdomen_hcmed());
        ps.setString(19, hcmed.getEfgenitourinario_hcmed());
        ps.setString(20, hcmed.getEfextremidades_hcmed());
        ps.setString(21, hcmed.getEfpielfuneras_hcmed());
        ps.setString(22, hcmed.getEfsistemanervioso_hcmed());
        ps.setString(23, hcmed.getDiagnostico1_hcmed());
        ps.setString(24, hcmed.getTipodiagnostico1_hcmed());
        ps.setString(25, hcmed.getDiagnostico2_hcmed());
        ps.setString(26, hcmed.getTipodiagnostico2_hcmed());
        ps.setString(27, hcmed.getDiagnostico3_hcmed());
        ps.setString(28, hcmed.getTipodiagnostico3_hcmed());
        ps.setString(29, hcmed.getTratamiento_hcmed());
        ps.setString(30, hcmed.getRecomendaciones_hcmed());
        ps.setString(31, hcmed.getFormulamedica_hcmed());
        ps.setString(32, hcmed.getFrecardiaca_hcmed());
        ps.setString(33, hcmed.getFrerespiratoria_hcmed());
        ps.setString(34, hcmed.getTensionarterial_hcmed());
        ps.setString(35, hcmed.getTemperatura_hcmed());
        ps.setString(36, hcmed.getPeso_hcmed());
        ps.setString(37, hcmed.getTalla_hcmed());

        int resultado = ps.executeUpdate();

        return resultado == 1;
    }

    public List<HcMedicinaGeneralDTO> consultarHcMedicinaGeneral(int id_usuario) throws SQLException {

        List<HcMedicinaGeneralDTO> listaHisC = new ArrayList<HcMedicinaGeneralDTO>();
        
        String sql = "SELECT * FROM hc_medicinageneral WHERE idusuario_hcmed = ?";

        PreparedStatement ps = con.prepareStatement(sql);

        ps.setInt(1, id_usuario);

        ResultSet rs = ps.executeQuery();
                
        HcMedicinaGeneralDTO hcmed = null;

        while (rs.next()) {
            hcmed = new HcMedicinaGeneralDTO();

            hcmed.setIdusuario_hcmed(rs.getInt("idusuario_hcmed"));
            hcmed.setIdcita_hcmed(rs.getInt("idcita_hcmed"));
            hcmed.setMotivoconsulta_hcmed(rs.getString("motivoconsulta_hcmed"));            
            hcmed.setEnfermedadgeneral_hcmed(rs.getString("enfermedadgeneral_hcmed"));
            hcmed.setRevisionporsistemas_hcmed(rs.getString("revisionporsistemas_hcmed"));
            hcmed.setAntpatologicos_hcmed(rs.getString("antpatologicos_hcmed"));
            hcmed.setAntquirurgicos_hcmed(rs.getString("antquirurgicos_hcmed"));
            hcmed.setAnttraumaticos_hcmed(rs.getString("anttraumaticos_hcmed"));
            hcmed.setAnttoxicoAlergicos_hcmed(rs.getString("anttoxicoAlergicos_hcmed"));
            hcmed.setAntfarmacologicos_hcmed(rs.getString("antfarmacologicos_hcmed"));
            hcmed.setAntvenereos_hcmed(rs.getString("antvenereos_hcmed"));
            hcmed.setAntfamiliares_hcmed(rs.getString("antfamiliares_hcmed"));
            hcmed.setAntginecologicos_hcmed(rs.getString("antginecologicos_hcmed"));
            hcmed.setAntotros_hcmed(rs.getString("antotros_hcmed"));                                    
            hcmed.setEfestadogeneral_hcmed(rs.getString("efestadogeneral_hcmed"));
            hcmed.setEfcabezacuello_hcmed(rs.getString("efcabezacuello_hcmed"));
            hcmed.setEfcardiopulmonar_hcmed(rs.getString("efcardiopulmonar_hcmed"));
            hcmed.setEfabdomen_hcmed(rs.getString("efabdomen_hcmed"));
            hcmed.setEfgenitourinario_hcmed(rs.getString("efgenitourinario_hcmed"));
            hcmed.setEfextremidades_hcmed(rs.getString("efextremidades_hcmed"));
            hcmed.setEfpielfuneras_hcmed(rs.getString("efpielfuneras_hcmed"));
            hcmed.setEfsistemanervioso_hcmed(rs.getString("efsistemanervioso_hcmed"));
            hcmed.setDiagnostico1_hcmed(rs.getString("diagnostico1_hcmed"));
            hcmed.setTipodiagnostico1_hcmed(rs.getString("tipodiagnostico1_hcmed"));
            hcmed.setDiagnostico2_hcmed(rs.getString("diagnostico2_hcmed"));
            hcmed.setTipodiagnostico2_hcmed(rs.getString("tipodiagnostico2_hcmed"));
            hcmed.setDiagnostico3_hcmed(rs.getString("diagnostico3_hcmed"));
            hcmed.setTipodiagnostico3_hcmed(rs.getString("tipodiagnostico3_hcmed"));
            hcmed.setTratamiento_hcmed(rs.getString("tratamiento_hcmed"));
            hcmed.setRecomendaciones_hcmed(rs.getString("recomendaciones_hcmed"));                                                                                                                
            hcmed.setFormulamedica_hcmed(rs.getString("formulamedica_hcmed")); 
            hcmed.setFrecardiaca_hcmed(rs.getString("frecardiaca_hcmed"));
            hcmed.setFrerespiratoria_hcmed(rs.getString("frerespiratoria_hcmed"));
            hcmed.setTensionarterial_hcmed(rs.getString("tensionarterial_hcmed"));
            hcmed.setTemperatura_hcmed(rs.getString("temperatura_hcmed"));
            hcmed.setPeso_hcmed(rs.getString("peso_hcmed"));
            hcmed.setTalla_hcmed(rs.getString("talla_hcmed"));
            
            listaHisC.add(hcmed);
        }

        return listaHisC;

    }
    
    public HcMedicinaGeneralDTO consultarHcMedicinaGeneralCita(int id_usuario, int id_cita) throws SQLException {       
        
        String sql = "SELECT * FROM hc_medicinageneral WHERE idusuario_hcmed = ? AND idcita_hcmed = ?";

        PreparedStatement ps = con.prepareStatement(sql);

        ps.setInt(1, id_usuario);
        ps.setInt(2, id_cita);

        ResultSet rs = ps.executeQuery();
        HcMedicinaGeneralDTO hcmed = null;

        if (rs.next()) {
            hcmed = new HcMedicinaGeneralDTO();

            hcmed.setIdusuario_hcmed(rs.getInt("idusuario_hcmed"));
            hcmed.setIdcita_hcmed(rs.getInt("idcita_hcmed"));
            hcmed.setMotivoconsulta_hcmed(rs.getString("motivoconsulta_hcmed"));            
            hcmed.setEnfermedadgeneral_hcmed(rs.getString("enfermedadgeneral_hcmed"));
            hcmed.setRevisionporsistemas_hcmed(rs.getString("revisionporsistemas_hcmed"));
            hcmed.setAntpatologicos_hcmed(rs.getString("antpatologicos_hcmed"));
            hcmed.setAntquirurgicos_hcmed(rs.getString("antquirurgicos_hcmed"));
            hcmed.setAnttraumaticos_hcmed(rs.getString("anttraumaticos_hcmed"));
            hcmed.setAnttoxicoAlergicos_hcmed(rs.getString("anttoxicoAlergicos_hcmed"));
            hcmed.setAntfarmacologicos_hcmed(rs.getString("antfarmacologicos_hcmed"));
            hcmed.setAntvenereos_hcmed(rs.getString("antvenereos_hcmed"));
            hcmed.setAntfamiliares_hcmed(rs.getString("antfamiliares_hcmed"));
            hcmed.setAntginecologicos_hcmed(rs.getString("antginecologicos_hcmed"));
            hcmed.setAntotros_hcmed(rs.getString("antotros_hcmed"));                       
            hcmed.setEfestadogeneral_hcmed(rs.getString("efestadogeneral_hcmed"));
            hcmed.setEfcabezacuello_hcmed(rs.getString("efcabezacuello_hcmed"));
            hcmed.setEfcardiopulmonar_hcmed(rs.getString("efcardiopulmonar_hcmed"));
            hcmed.setEfabdomen_hcmed(rs.getString("efabdomen_hcmed"));
            hcmed.setEfgenitourinario_hcmed(rs.getString("efgenitourinario_hcmed"));
            hcmed.setEfextremidades_hcmed(rs.getString("efextremidades_hcmed"));
            hcmed.setEfpielfuneras_hcmed(rs.getString("efpielfuneras_hcmed"));
            hcmed.setEfsistemanervioso_hcmed(rs.getString("efsistemanervioso_hcmed"));
            hcmed.setDiagnostico1_hcmed(rs.getString("diagnostico1_hcmed"));
            hcmed.setTipodiagnostico1_hcmed(rs.getString("tipodiagnostico1_hcmed"));
            hcmed.setDiagnostico2_hcmed(rs.getString("diagnostico2_hcmed"));
            hcmed.setTipodiagnostico2_hcmed(rs.getString("tipodiagnostico2_hcmed"));
            hcmed.setDiagnostico3_hcmed(rs.getString("diagnostico3_hcmed"));
            hcmed.setTipodiagnostico3_hcmed(rs.getString("tipodiagnostico3_hcmed"));
            hcmed.setTratamiento_hcmed(rs.getString("tratamiento_hcmed"));
            hcmed.setRecomendaciones_hcmed(rs.getString("recomendaciones_hcmed"));
            hcmed.setFormulamedica_hcmed(rs.getString("formulamedica_hcmed"));  
            hcmed.setFrecardiaca_hcmed(rs.getString("frecardiaca_hcmed"));
            hcmed.setFrerespiratoria_hcmed(rs.getString("frerespiratoria_hcmed"));
            hcmed.setTensionarterial_hcmed(rs.getString("tensionarterial_hcmed"));
            hcmed.setTemperatura_hcmed(rs.getString("temperatura_hcmed"));
            hcmed.setPeso_hcmed(rs.getString("peso_hcmed"));
            hcmed.setTalla_hcmed(rs.getString("talla_hcmed"));                        
        }

        return hcmed;

    }

}
