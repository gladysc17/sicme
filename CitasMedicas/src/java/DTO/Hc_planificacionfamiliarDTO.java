/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DTO;

/**
 *
 * @author LEGADO
 */
public class Hc_planificacionfamiliarDTO {
    
    private int idhcplanfam;
    private String tipo_vinculacion;
    private String aseguradora;
    private String nombre_responsable;
    private String parentesco;
    private String direccion_responsable;
    private String telefono_responsable;
    private String motivo;
    private String enfermedad_actual;
    private String menarca;
    private String ciclos;
    private String menopausia;
    private String estados;
    private String fecha_ultima_menst;
    private String fecha_ultimo_parto;
    private String ccv;
    private String resultado_ccv;
    private String planificacion;
    private String metodo;
    private int id_cita;
    private String revision_sistemas;
    private String antecedentes;
    private int idusuario_hcmed;

    public Hc_planificacionfamiliarDTO(String tipo_vinculacion, String aseguradora, String nombre_responsable, String parentesco, String direccion_responsable, String telefono_responsable, String motivo, String enfermedad_actual, String menarca, String ciclos, String menopausia, String estados, String fecha_ultima_menst, String fecha_ultimo_parto, String ccv, String resultado_ccv, String planificacion, String metodo, int id_cita, String revision_sistemas, String antecedentes, int idusuario_hcmed) {
        this.tipo_vinculacion = tipo_vinculacion;
        this.aseguradora = aseguradora;
        this.nombre_responsable = nombre_responsable;
        this.parentesco = parentesco;
        this.direccion_responsable = direccion_responsable;
        this.telefono_responsable = telefono_responsable;
        this.motivo = motivo;
        this.enfermedad_actual = enfermedad_actual;
        this.menarca = menarca;
        this.ciclos = ciclos;
        this.menopausia = menopausia;
        this.estados = estados;
        this.fecha_ultima_menst = fecha_ultima_menst;
        this.fecha_ultimo_parto = fecha_ultimo_parto;
        this.ccv = ccv;
        this.resultado_ccv = resultado_ccv;
        this.planificacion = planificacion;
        this.metodo = metodo;
        this.id_cita = id_cita;
        this.revision_sistemas = revision_sistemas;
        this.antecedentes = antecedentes;
        this.idusuario_hcmed = idusuario_hcmed;
    }

    public Hc_planificacionfamiliarDTO(int idhcplanfam, String tipo_vinculacion, String aseguradora, String nombre_responsable, String parentesco, String direccion_responsable, String telefono_responsable, String motivo, String enfermedad_actual, String menarca, String ciclos, String menopausia, String estados, String fecha_ultima_menst, String fecha_ultimo_parto, String ccv, String resultado_ccv, String planificacion, String metodo, int id_cita, String revision_sistemas, String antecedentes, int idusuario_hcmed) {
        this.idhcplanfam = idhcplanfam;
        this.tipo_vinculacion = tipo_vinculacion;
        this.aseguradora = aseguradora;
        this.nombre_responsable = nombre_responsable;
        this.parentesco = parentesco;
        this.direccion_responsable = direccion_responsable;
        this.telefono_responsable = telefono_responsable;
        this.motivo = motivo;
        this.enfermedad_actual = enfermedad_actual;
        this.menarca = menarca;
        this.ciclos = ciclos;
        this.menopausia = menopausia;
        this.estados = estados;
        this.fecha_ultima_menst = fecha_ultima_menst;
        this.fecha_ultimo_parto = fecha_ultimo_parto;
        this.ccv = ccv;
        this.resultado_ccv = resultado_ccv;
        this.planificacion = planificacion;
        this.metodo = metodo;
        this.id_cita = id_cita;
        this.revision_sistemas = revision_sistemas;
        this.antecedentes = antecedentes;
        this.idusuario_hcmed = idusuario_hcmed;
    }

    public int getIdhcplanfam() {
        return idhcplanfam;
    }

    public void setIdhcplanfam(int idhcplanfam) {
        this.idhcplanfam = idhcplanfam;
    }

    public String getTipo_vinculacion() {
        return tipo_vinculacion;
    }

    public void setTipo_vinculacion(String tipo_vinculacion) {
        this.tipo_vinculacion = tipo_vinculacion;
    }

    public String getAseguradora() {
        return aseguradora;
    }

    public void setAseguradora(String aseguradora) {
        this.aseguradora = aseguradora;
    }

    public String getNombre_responsable() {
        return nombre_responsable;
    }

    public void setNombre_responsable(String nombre_responsable) {
        this.nombre_responsable = nombre_responsable;
    }

    public String getParentesco() {
        return parentesco;
    }

    public void setParentesco(String parentesco) {
        this.parentesco = parentesco;
    }

    public String getDireccion_responsable() {
        return direccion_responsable;
    }

    public void setDireccion_responsable(String direccion_responsable) {
        this.direccion_responsable = direccion_responsable;
    }

    public String getTelefono_responsable() {
        return telefono_responsable;
    }

    public void setTelefono_responsable(String telefono_responsable) {
        this.telefono_responsable = telefono_responsable;
    }

    public String getMotivo() {
        return motivo;
    }

    public void setMotivo(String motivo) {
        this.motivo = motivo;
    }

    public String getEnfermedad_actual() {
        return enfermedad_actual;
    }

    public void setEnfermedad_actual(String enfermedad_actual) {
        this.enfermedad_actual = enfermedad_actual;
    }

    public String getMenarca() {
        return menarca;
    }

    public void setMenarca(String menarca) {
        this.menarca = menarca;
    }

    public String getCiclos() {
        return ciclos;
    }

    public void setCiclos(String ciclos) {
        this.ciclos = ciclos;
    }

    public String getMenopausia() {
        return menopausia;
    }

    public void setMenopausia(String menopausia) {
        this.menopausia = menopausia;
    }

    public String getEstados() {
        return estados;
    }

    public void setEstados(String estados) {
        this.estados = estados;
    }

    public String getFecha_ultima_menst() {
        return fecha_ultima_menst;
    }

    public void setFecha_ultima_menst(String fecha_ultima_menst) {
        this.fecha_ultima_menst = fecha_ultima_menst;
    }

    public String getFecha_ultimo_parto() {
        return fecha_ultimo_parto;
    }

    public void setFecha_ultimo_parto(String fecha_ultimo_parto) {
        this.fecha_ultimo_parto = fecha_ultimo_parto;
    }

    public String getCcv() {
        return ccv;
    }

    public void setCcv(String ccv) {
        this.ccv = ccv;
    }

    public String getResultado_ccv() {
        return resultado_ccv;
    }

    public void setResultado_ccv(String resultado_ccv) {
        this.resultado_ccv = resultado_ccv;
    }

    public String getPlanificacion() {
        return planificacion;
    }

    public void setPlanificacion(String planificacion) {
        this.planificacion = planificacion;
    }

    public String getMetodo() {
        return metodo;
    }

    public void setMetodo(String metodo) {
        this.metodo = metodo;
    }

    public int getId_cita() {
        return id_cita;
    }

    public void setId_cita(int id_cita) {
        this.id_cita = id_cita;
    }

    public String getRevision_sistemas() {
        return revision_sistemas;
    }

    public void setRevision_sistemas(String revision_sistemas) {
        this.revision_sistemas = revision_sistemas;
    }

    public String getAntecedentes() {
        return antecedentes;
    }

    public void setAntecedentes(String antecedentes) {
        this.antecedentes = antecedentes;
    }

    public int getIdusuario_hcmed() {
        return idusuario_hcmed;
    }

    public void setIdusuario_hcmed(int idusuario_hcmed) {
        this.idusuario_hcmed = idusuario_hcmed;
    }
    
    
    
    

    
}
