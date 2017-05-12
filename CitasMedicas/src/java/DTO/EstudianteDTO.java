/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DTO;

/**
 *
 * @author Gladys M
 *
 * La clase EstudianteDTO contiene los atributos que ...........................
 */
public class EstudianteDTO {

    private int identificacion_est;
   private String tipodocumentoid_est;
    private int codigo_est;
    private String nombre_est;
    private String correo_est;
    private String fechanacimiento_est;
    private String genero_est;
    private int edad_est;
    private String estadocivil_est;
    private String direccion_est;
    private String telefono_est;
    private String programa_est;

    public EstudianteDTO() {
    }

    public EstudianteDTO(int identificacion_est, String tipodocumentoid_est, int codigo_est, String nombre_est, String correo_est, String fechanacimiento_est, String genero_est, int edad_est, String estadocivil_est, String direccion_est, String telefono_est, String programa_est) {
        this.identificacion_est = identificacion_est;
        this.tipodocumentoid_est = tipodocumentoid_est;
        this.codigo_est = codigo_est;
        this.nombre_est = nombre_est;
        this.correo_est = correo_est;
        this.fechanacimiento_est = fechanacimiento_est;
        this.genero_est = genero_est;
        this.edad_est = edad_est;
        this.estadocivil_est = estadocivil_est;
        this.direccion_est = direccion_est;
        this.telefono_est = telefono_est;
        this.programa_est = programa_est;
    }

    public int getIdentificacion_est() {
        return identificacion_est;
    }

    public void setIdentificacion_est(int identificacion_est) {
        this.identificacion_est = identificacion_est;
    }

    public String getTipodocumentoid_est() {
        return tipodocumentoid_est;
    }

    public void setTipodocumentoid_est(String tipodocumentoid_est) {
        this.tipodocumentoid_est = tipodocumentoid_est;
    }

    public int getCodigo_est() {
        return codigo_est;
    }

    public void setCodigo_est(int codigo_est) {
        this.codigo_est = codigo_est;
    }

    public String getNombre_est() {
        return nombre_est;
    }

    public void setNombre_est(String nombre_est) {
        this.nombre_est = nombre_est;
    }

    public String getCorreo_est() {
        return correo_est;
    }

    public void setCorreo_est(String correo_est) {
        this.correo_est = correo_est;
    }

    public String getFechanacimiento_est() {
        return fechanacimiento_est;
    }

    public void setFechanacimiento_est(String fechanacimiento_est) {
        this.fechanacimiento_est = fechanacimiento_est;
    }

    public String getGenero_est() {
        return genero_est;
    }

    public void setGenero_est(String genero_est) {
        this.genero_est = genero_est;
    }

    public int getEdad_est() {
        return edad_est;
    }

    public void setEdad_est(int edad_est) {
        this.edad_est = edad_est;
    }

    public String getEstadocivil_est() {
        return estadocivil_est;
    }

    public void setEstadocivil_est(String estadocivil_est) {
        this.estadocivil_est = estadocivil_est;
    }

    public String getDireccion_est() {
        return direccion_est;
    }

    public void setDireccion_est(String direccion_est) {
        this.direccion_est = direccion_est;
    }

    public String getTelefono_est() {
        return telefono_est;
    }

    public void setTelefono_est(String telefono_est) {
        this.telefono_est = telefono_est;
    }

    public String getPrograma_est() {
        return programa_est;
    }

    public void setPrograma_est(String programa_est) {
        this.programa_est = programa_est;
    }

    @Override
    public String toString() {
        return "EstudianteDTO{" + "identificacion_est=" + identificacion_est + ", tipodocumentoid_est=" + tipodocumentoid_est + ", codigo_est=" + codigo_est + ", nombre_est=" + nombre_est + ", correo_est=" + correo_est + ", fechanacimiento_est=" + fechanacimiento_est + ", genero_est=" + genero_est + ", edad_est=" + edad_est + ", estadocivil_est=" + estadocivil_est + ", direccion_est=" + direccion_est + ", telefono_est=" + telefono_est + ", programa_est=" + programa_est + '}';
    }
       
}
