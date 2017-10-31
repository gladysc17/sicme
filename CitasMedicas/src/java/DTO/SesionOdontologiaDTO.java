/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DTO;

/**
 *
 * @author Mauricio U
 */
public class SesionOdontologiaDTO {
    
    private int id;
    private int id_cita;
    private int id_hcodontologia;    
    private String diagnostico;
    private String motivo;
    private String controlPlaca;
    private String odontograma;

    public SesionOdontologiaDTO() {
    }

    public SesionOdontologiaDTO(int id_cita, int id_hcodontologia, String diagnostico, String motivo, String controlPlaca, String odontograma) {
        this.id_cita = id_cita;
        this.id_hcodontologia = id_hcodontologia;
        this.diagnostico = diagnostico;
        this.motivo = motivo;
        this.controlPlaca = controlPlaca;
        this.odontograma = odontograma;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getId_cita() {
        return id_cita;
    }

    public void setId_cita(int id_cita) {
        this.id_cita = id_cita;
    }

    public int getId_hcodontologia() {
        return id_hcodontologia;
    }

    public void setId_hcodontologia(int id_hcodontologia) {
        this.id_hcodontologia = id_hcodontologia;
    }

    public String getDiagnostico() {
        return diagnostico;
    }

    public void setDiagnostico(String diagnostico) {
        this.diagnostico = diagnostico;
    }

    public String getMotivo() {
        return motivo;
    }

    public void setMotivo(String motivo) {
        this.motivo = motivo;
    }

    public String getControlPlaca() {
        return controlPlaca;
    }

    public void setControlPlaca(String controlPlaca) {
        this.controlPlaca = controlPlaca;
    }

    public String getOdontograma() {
        return odontograma;
    }

    public void setOdontograma(String odontograma) {
        this.odontograma = odontograma;
    }

    @Override
    public String toString() {
        return "SesionOdontologiaDTO{" + "id=" + id + ", id_cita=" + id_cita + ", id_hcodontologia=" + id_hcodontologia + ", diagnostico=" + diagnostico + ", motivo=" + motivo + ", controlPlaca=" + controlPlaca + ", odontograma=" + odontograma + '}';
    }
    
}
