/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DTO;

/**
 *
 * @author Gladys M
 */
public class HcMedicinaGeneralDTO {

    private int id_hcmed;
    private int idusuario_hcmed;
    private int idcita_hcmed;
    private String motivoconsulta_hcmed;
    private String enfermedadgeneral_hcmed;
    private String revisionporsistemas_hcmed;    
    private String antpatologicos_hcmed;
    private String antquirurgicos_hcmed;
    private String anttraumaticos_hcmed;
    private String anttoxicoAlergicos_hcmed;
    private String antfarmacologicos_hcmed;
    private String antvenereos_hcmed;
    private String antfamiliares_hcmed;
    private String antginecologicos_hcmed;        
    private String antotros_hcmed;        
    private int frecardiaca_hcmed;
    private int frerespiratoria_hcmed;
    private int tensionarterial_hcmed;
    private int temperatura_hcmed;
    private int peso_hcmed;
    private int talla_hcmed;
    private String efestadogeneral_hcmed;
    private String efcabezacuello_hcmed;
    private String efcardiopulmonar_hcmed;
    private String efabdomen_hcmed;
    private String efgenitourinario_hcmed;
    private String efextremidades_hcmed;
    private String efpielfuneras_hcmed;
    private String efsistemanervioso_hcmed;
    private String diagnostico1_hcmed;
    private String tipodiagnostico1_hcmed;
    private String diagnostico2_hcmed;
    private String tipodiagnostico2_hcmed;
    private String diagnostico3_hcmed;
    private String tipodiagnostico3_hcmed;
    private String tratamiento_hcmed;
    private String recomendaciones_hcmed;
    private String formulamedica_hcmed;
    
    public HcMedicinaGeneralDTO() {
    }

    public HcMedicinaGeneralDTO(int idusuario_hcmed, int idcita_hcmed, String motivoconsulta_hcmed, String enfermedadgeneral_hcmed, String revisionporsistemas_hcmed, String antPatologicos_hcmed, String antquirurgicos_hcmed, String anttraumaticos_hcmed, String anttoxicoAlergicos_hcmed, String antfarmacologicos_hcmed, String antvenereos_hcmed, String antfamiliares_hcmed, String antginecologicos_hcmed, String antotros_hcmed, int frecardiaca_hcmed, int frerespiratoria_hcmed, int tensionarterial_hcmed, int temperatura_hcmed, int peso_hcmed, int talla_hcmed, String efestadogeneral_hcmed, String efcabezacuello_hcmed, String efcardiopulmonar_hcmed, String efabdomen_hcmed, String efgenitourinario_hcmed, String efextremidades_hcmed, String efpielfuneras_hcmed, String efsistemanervioso_hcmed, String diagnostico1_hcmed, String tipodiagnostico1_hcmed, String diagnostico2_hcmed, String tipodiagnostico2_hcmed, String diagnostico3_hcmed, String tipodiagnostico3_hcmed, String tratamiento_hcmed, String recomendaciones_hcmed, String formulamedica_hcmed) {
        this.idusuario_hcmed = idusuario_hcmed;
        this.idcita_hcmed = idcita_hcmed;
        this.motivoconsulta_hcmed = motivoconsulta_hcmed;
        this.enfermedadgeneral_hcmed = enfermedadgeneral_hcmed;
        this.revisionporsistemas_hcmed = revisionporsistemas_hcmed;
        this.antpatologicos_hcmed = antPatologicos_hcmed;
        this.antquirurgicos_hcmed = antquirurgicos_hcmed;
        this.anttraumaticos_hcmed = anttraumaticos_hcmed;
        this.anttoxicoAlergicos_hcmed = anttoxicoAlergicos_hcmed;
        this.antfarmacologicos_hcmed = antfarmacologicos_hcmed;
        this.antvenereos_hcmed = antvenereos_hcmed;
        this.antfamiliares_hcmed = antfamiliares_hcmed;
        this.antginecologicos_hcmed = antginecologicos_hcmed;
        this.antotros_hcmed = antotros_hcmed;
        this.frecardiaca_hcmed = frecardiaca_hcmed;
        this.frerespiratoria_hcmed = frerespiratoria_hcmed;
        this.tensionarterial_hcmed = tensionarterial_hcmed;
        this.temperatura_hcmed = temperatura_hcmed;
        this.peso_hcmed = peso_hcmed;
        this.talla_hcmed = talla_hcmed;
        this.efestadogeneral_hcmed = efestadogeneral_hcmed;
        this.efcabezacuello_hcmed = efcabezacuello_hcmed;
        this.efcardiopulmonar_hcmed = efcardiopulmonar_hcmed;
        this.efabdomen_hcmed = efabdomen_hcmed;
        this.efgenitourinario_hcmed = efgenitourinario_hcmed;
        this.efextremidades_hcmed = efextremidades_hcmed;
        this.efpielfuneras_hcmed = efpielfuneras_hcmed;
        this.efsistemanervioso_hcmed = efsistemanervioso_hcmed;
        this.diagnostico1_hcmed = diagnostico1_hcmed;
        this.tipodiagnostico1_hcmed = tipodiagnostico1_hcmed;
        this.diagnostico2_hcmed = diagnostico2_hcmed;
        this.tipodiagnostico2_hcmed = tipodiagnostico2_hcmed;
        this.diagnostico3_hcmed = diagnostico3_hcmed;
        this.tipodiagnostico3_hcmed = tipodiagnostico3_hcmed;
        this.tratamiento_hcmed = tratamiento_hcmed;
        this.recomendaciones_hcmed = recomendaciones_hcmed;
        this.formulamedica_hcmed = formulamedica_hcmed;
    }

    public int getId_hcmed() {
        return id_hcmed;
    }

    public void setId_hcmed(int id_hcmed) {
        this.id_hcmed = id_hcmed;
    }

    public int getIdusuario_hcmed() {
        return idusuario_hcmed;
    }

    public void setIdusuario_hcmed(int idusuario_hcmed) {
        this.idusuario_hcmed = idusuario_hcmed;
    }

    public int getIdcita_hcmed() {
        return idcita_hcmed;
    }

    public void setIdcita_hcmed(int idcita_hcmed) {
        this.idcita_hcmed = idcita_hcmed;
    }

    public String getMotivoconsulta_hcmed() {
        return motivoconsulta_hcmed;
    }

    public void setMotivoconsulta_hcmed(String motivoconsulta_hcmed) {
        this.motivoconsulta_hcmed = motivoconsulta_hcmed;
    }

    public String getEnfermedadgeneral_hcmed() {
        return enfermedadgeneral_hcmed;
    }

    public void setEnfermedadgeneral_hcmed(String enfermedadgeneral_hcmed) {
        this.enfermedadgeneral_hcmed = enfermedadgeneral_hcmed;
    }

    public String getRevisionporsistemas_hcmed() {
        return revisionporsistemas_hcmed;
    }

    public void setRevisionporsistemas_hcmed(String revisionporsistemas_hcmed) {
        this.revisionporsistemas_hcmed = revisionporsistemas_hcmed;
    }

    public String getAntpatologicos_hcmed() {
        return antpatologicos_hcmed;
    }

    public void setAntpatologicos_hcmed(String antPatologicos_hcmed) {
        this.antpatologicos_hcmed = antPatologicos_hcmed;
    }

    public String getAntquirurgicos_hcmed() {
        return antquirurgicos_hcmed;
    }

    public void setAntquirurgicos_hcmed(String antquirurgicos_hcmed) {
        this.antquirurgicos_hcmed = antquirurgicos_hcmed;
    }

    public String getAnttraumaticos_hcmed() {
        return anttraumaticos_hcmed;
    }

    public void setAnttraumaticos_hcmed(String anttraumaticos_hcmed) {
        this.anttraumaticos_hcmed = anttraumaticos_hcmed;
    }

    public String getAnttoxicoAlergicos_hcmed() {
        return anttoxicoAlergicos_hcmed;
    }

    public void setAnttoxicoAlergicos_hcmed(String anttoxicoAlergicos_hcmed) {
        this.anttoxicoAlergicos_hcmed = anttoxicoAlergicos_hcmed;
    }

    public String getAntfarmacologicos_hcmed() {
        return antfarmacologicos_hcmed;
    }

    public void setAntfarmacologicos_hcmed(String antfarmacologicos_hcmed) {
        this.antfarmacologicos_hcmed = antfarmacologicos_hcmed;
    }

    public String getAntvenereos_hcmed() {
        return antvenereos_hcmed;
    }

    public void setAntvenereos_hcmed(String antvenereos_hcmed) {
        this.antvenereos_hcmed = antvenereos_hcmed;
    }

    public String getAntfamiliares_hcmed() {
        return antfamiliares_hcmed;
    }

    public void setAntfamiliares_hcmed(String antfamiliares_hcmed) {
        this.antfamiliares_hcmed = antfamiliares_hcmed;
    }

    public String getAntginecologicos_hcmed() {
        return antginecologicos_hcmed;
    }

    public void setAntginecologicos_hcmed(String antginecologicos_hcmed) {
        this.antginecologicos_hcmed = antginecologicos_hcmed;
    }

    public String getAntotros_hcmed() {
        return antotros_hcmed;
    }

    public void setAntotros_hcmed(String antotros_hcmed) {
        this.antotros_hcmed = antotros_hcmed;
    }

    public int getFrecardiaca_hcmed() {
        return frecardiaca_hcmed;
    }

    public void setFrecardiaca_hcmed(int frecardiaca_hcmed) {
        this.frecardiaca_hcmed = frecardiaca_hcmed;
    }

    public int getFrerespiratoria_hcmed() {
        return frerespiratoria_hcmed;
    }

    public void setFrerespiratoria_hcmed(int frerespiratoria_hcmed) {
        this.frerespiratoria_hcmed = frerespiratoria_hcmed;
    }

    public int getTensionarterial_hcmed() {
        return tensionarterial_hcmed;
    }

    public void setTensionarterial_hcmed(int tensionarterial_hcmed) {
        this.tensionarterial_hcmed = tensionarterial_hcmed;
    }

    public int getTemperatura_hcmed() {
        return temperatura_hcmed;
    }

    public void setTemperatura_hcmed(int temperatura_hcmed) {
        this.temperatura_hcmed = temperatura_hcmed;
    }

    public int getPeso_hcmed() {
        return peso_hcmed;
    }

    public void setPeso_hcmed(int peso_hcmed) {
        this.peso_hcmed = peso_hcmed;
    }

    public int getTalla_hcmed() {
        return talla_hcmed;
    }

    public void setTalla_hcmed(int talla_hcmed) {
        this.talla_hcmed = talla_hcmed;
    }

    public String getEfestadogeneral_hcmed() {
        return efestadogeneral_hcmed;
    }

    public void setEfestadogeneral_hcmed(String efestadogeneral_hcmed) {
        this.efestadogeneral_hcmed = efestadogeneral_hcmed;
    }

    public String getEfcabezacuello_hcmed() {
        return efcabezacuello_hcmed;
    }

    public void setEfcabezacuello_hcmed(String efcabezacuello_hcmed) {
        this.efcabezacuello_hcmed = efcabezacuello_hcmed;
    }

    public String getEfcardiopulmonar_hcmed() {
        return efcardiopulmonar_hcmed;
    }

    public void setEfcardiopulmonar_hcmed(String efcardiopulmonar_hcmed) {
        this.efcardiopulmonar_hcmed = efcardiopulmonar_hcmed;
    }

    public String getEfabdomen_hcmed() {
        return efabdomen_hcmed;
    }

    public void setEfabdomen_hcmed(String efabdomen_hcmed) {
        this.efabdomen_hcmed = efabdomen_hcmed;
    }

    public String getEfgenitourinario_hcmed() {
        return efgenitourinario_hcmed;
    }

    public void setEfgenitourinario_hcmed(String efgenitourinario_hcmed) {
        this.efgenitourinario_hcmed = efgenitourinario_hcmed;
    }

    public String getEfextremidades_hcmed() {
        return efextremidades_hcmed;
    }

    public void setEfextremidades_hcmed(String efextremidades_hcmed) {
        this.efextremidades_hcmed = efextremidades_hcmed;
    }

    public String getEfpielfuneras_hcmed() {
        return efpielfuneras_hcmed;
    }

    public void setEfpielfuneras_hcmed(String efpielfuneras_hcmed) {
        this.efpielfuneras_hcmed = efpielfuneras_hcmed;
    }

    public String getEfsistemanervioso_hcmed() {
        return efsistemanervioso_hcmed;
    }

    public void setEfsistemanervioso_hcmed(String efsistemanervioso_hcmed) {
        this.efsistemanervioso_hcmed = efsistemanervioso_hcmed;
    }

    public String getDiagnostico1_hcmed() {
        return diagnostico1_hcmed;
    }

    public void setDiagnostico1_hcmed(String diagnostico1_hcmed) {
        this.diagnostico1_hcmed = diagnostico1_hcmed;
    }

    public String getTipodiagnostico1_hcmed() {
        return tipodiagnostico1_hcmed;
    }

    public void setTipodiagnostico1_hcmed(String tipodiagnostico1_hcmed) {
        this.tipodiagnostico1_hcmed = tipodiagnostico1_hcmed;
    }

    public String getDiagnostico2_hcmed() {
        return diagnostico2_hcmed;
    }

    public void setDiagnostico2_hcmed(String diagnostico2_hcmed) {
        this.diagnostico2_hcmed = diagnostico2_hcmed;
    }

    public String getTipodiagnostico2_hcmed() {
        return tipodiagnostico2_hcmed;
    }

    public void setTipodiagnostico2_hcmed(String tipodiagnostico2_hcmed) {
        this.tipodiagnostico2_hcmed = tipodiagnostico2_hcmed;
    }

    public String getDiagnostico3_hcmed() {
        return diagnostico3_hcmed;
    }

    public void setDiagnostico3_hcmed(String diagnostico3_hcmed) {
        this.diagnostico3_hcmed = diagnostico3_hcmed;
    }

    public String getTipodiagnostico3_hcmed() {
        return tipodiagnostico3_hcmed;
    }

    public void setTipodiagnostico3_hcmed(String tipodiagnostico3_hcmed) {
        this.tipodiagnostico3_hcmed = tipodiagnostico3_hcmed;
    }

    public String getTratamiento_hcmed() {
        return tratamiento_hcmed;
    }

    public void setTratamiento_hcmed(String tratamiento_hcmed) {
        this.tratamiento_hcmed = tratamiento_hcmed;
    }

    public String getRecomendaciones_hcmed() {
        return recomendaciones_hcmed;
    }

    public void setRecomendaciones_hcmed(String recomendaciones_hcmed) {
        this.recomendaciones_hcmed = recomendaciones_hcmed;
    }

    public String getFormulamedica_hcmed() {
        return formulamedica_hcmed;
    }

    public void setFormulamedica_hcmed(String formulamedica_hcmed) {
        this.formulamedica_hcmed = formulamedica_hcmed;
    }
    
    
    
      
}