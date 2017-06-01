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
public class HcPsicologiaDTO {
    
  private int id_hcpsicologia;
  private int idusuario_hcpsico;
  private String motivoconsulta_hcpsico;
  private String genograma_hcpsico;
  private String historiafamiliar_hcpsico;
  private String problematicaactual_hcpsico;
  private String diagnostico_hcpsico;
  private String procesopsicoterapeutico_hcpsico;
  private String seguimiento_hcpsico;
  private String sesion_hcpsico;
  private int idcita_hcpsico;

    public HcPsicologiaDTO() {
    }

    public HcPsicologiaDTO( int idusuario_hcpsico, String motivoconsulta_hcpsico, String genograma_hcpsico, String historiafamiliar_hcpsico, String problematicaactual_hcpsico, String diagnostico_hcpsico, String procesopsicoterapeutico_hcpsico, String seguimiento_hcpsico, String sesion_hcpsico, int idcita_hcpsico) {
        this.idusuario_hcpsico = idusuario_hcpsico;
        this.motivoconsulta_hcpsico = motivoconsulta_hcpsico;
        this.genograma_hcpsico = genograma_hcpsico;
        this.historiafamiliar_hcpsico = historiafamiliar_hcpsico;
        this.problematicaactual_hcpsico = problematicaactual_hcpsico;
        this.diagnostico_hcpsico = diagnostico_hcpsico;
        this.procesopsicoterapeutico_hcpsico = procesopsicoterapeutico_hcpsico;
        this.seguimiento_hcpsico = seguimiento_hcpsico;
        this.sesion_hcpsico = sesion_hcpsico;
        this.idcita_hcpsico = idcita_hcpsico;
    }

   

    
    

    public int getId_hcpsicologia() {
        return id_hcpsicologia;
    }

    public void setId_hcpsicologia(int id_hcpsicologia) {
        this.id_hcpsicologia = id_hcpsicologia;
    }

    public int getIdusuario_hcpsico() {
        return idusuario_hcpsico;
    }

    public void setIdusuario_hcpsico(int idusuario_hcpsico) {
        this.idusuario_hcpsico = idusuario_hcpsico;
    }

    public String getMotivoconsulta_hcpsico() {
        return motivoconsulta_hcpsico;
    }

    public void setMotivoconsulta_hcpsico(String motivoconsulta_hcpsico) {
        this.motivoconsulta_hcpsico = motivoconsulta_hcpsico;
    }

    public String getGenograma_hcpsico() {
        return genograma_hcpsico;
    }

    public void setGenograma_hcpsico(String genograma_hcpsico) {
        this.genograma_hcpsico = genograma_hcpsico;
    }

    public String getHistoriafamiliar_hcpsico() {
        return historiafamiliar_hcpsico;
    }

    public void setHistoriafamiliar_hcpsico(String historiafamiliar_hcpsico) {
        this.historiafamiliar_hcpsico = historiafamiliar_hcpsico;
    }

    public String getProblematicaactual_hcpsico() {
        return problematicaactual_hcpsico;
    }

    public void setProblematicaactual_hcpsico(String problematicaactual_hcpsico) {
        this.problematicaactual_hcpsico = problematicaactual_hcpsico;
    }

    public String getDiagnostico_hcpsico() {
        return diagnostico_hcpsico;
    }

    public void setDiagnostico_hcpsico(String diagnostico_hcpsico) {
        this.diagnostico_hcpsico = diagnostico_hcpsico;
    }

    public String getProcesopsicoterapeutico_hcpsico() {
        return procesopsicoterapeutico_hcpsico;
    }

    public void setProcesopsicoterapeutico_hcpsico(String procesopsicoterapeutico_hcpsico) {
        this.procesopsicoterapeutico_hcpsico = procesopsicoterapeutico_hcpsico;
    }

    public String getSeguimiento_hcpsico() {
        return seguimiento_hcpsico;
    }

    public void setSeguimiento_hcpsico(String seguimiento_hcpsico) {
        this.seguimiento_hcpsico = seguimiento_hcpsico;
    }

    public int getIdcita_hcpsico() {
        return idcita_hcpsico;
    }

    public void setIdcita_hcpsico(int idcita_hcpsico) {
        this.idcita_hcpsico = idcita_hcpsico;
    }

    public String getSesion_hcpsico() {
        return sesion_hcpsico;
    }

    public void setSesion_hcpsico(String sesion_hcpsico) {
        this.sesion_hcpsico = sesion_hcpsico;
    }
    
    

    @Override
    public String toString() {
        return "HcPsicologiaDTO{" + "id_hcpsicologia=" + id_hcpsicologia + ", idusuario_hcpsico=" + idusuario_hcpsico + ", motivoconsulta_hcpsico=" + motivoconsulta_hcpsico + ", genograma_hcpsico=" + genograma_hcpsico + ", historiafamiliar_hcpsico=" + historiafamiliar_hcpsico + ", problematicaactual_hcpsico=" + problematicaactual_hcpsico + ", diagnostico_hcpsico=" + diagnostico_hcpsico + ", procesopsicoterapeutico_hcpsico=" + procesopsicoterapeutico_hcpsico + ", seguimiento_hcpsico=" + seguimiento_hcpsico + '}';
    }
  
  
    
}
