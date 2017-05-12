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
public class ProfesionalDTO {
  
    private int identificacion_prof;
    private String tipodocumentoid_prof;
    private int codigo_prof;
    private String nombre_prof;
    private String correo_prof;
    private String fechanacimiento_prof;
    private String genero_prof;
    private int edad_prof;
    private String estadocivil_prof;
    private String direccion_prof;
    private String telefono_prof;


    public ProfesionalDTO() {
    }

    public ProfesionalDTO(int identificacion_prof, String tipodocumentoid_prof, int codigo_prof, String nombre_prof, String correo_prof, String fechanacimiento_prof, String genero_prof, int edad_prof, String estadocivil_prof, String direccion_prof, String telefono_prof) {
        this.identificacion_prof = identificacion_prof;
        this.tipodocumentoid_prof = tipodocumentoid_prof;
        this.codigo_prof = codigo_prof;
        this.nombre_prof = nombre_prof;
        this.correo_prof = correo_prof;
        this.fechanacimiento_prof = fechanacimiento_prof;
        this.genero_prof = genero_prof;
        this.edad_prof = edad_prof;
        this.estadocivil_prof = estadocivil_prof;
        this.direccion_prof = direccion_prof;
        this.telefono_prof = telefono_prof;
    }

    public int getIdentificacion_prof() {
        return identificacion_prof;
    }

    public void setIdentificacion_prof(int identificacion_prof) {
        this.identificacion_prof = identificacion_prof;
    }

    public String getTipodocumentoid_prof() {
        return tipodocumentoid_prof;
    }

    public void setTipodocumentoid_prof(String tipodocumentoid_prof) {
        this.tipodocumentoid_prof = tipodocumentoid_prof;
    }

    public int getCodigo_prof() {
        return codigo_prof;
    }

    public void setCodigo_prof(int codigo_prof) {
        this.codigo_prof = codigo_prof;
    }

    public String getNombre_prof() {
        return nombre_prof;
    }

    public void setNombre_prof(String nombre_prof) {
        this.nombre_prof = nombre_prof;
    }

    public String getCorreo_prof() {
        return correo_prof;
    }

    public void setCorreo_prof(String correo_prof) {
        this.correo_prof = correo_prof;
    }

    public String getFechanacimiento_prof() {
        return fechanacimiento_prof;
    }

    public void setFechanacimiento_prof(String fechanacimiento_prof) {
        this.fechanacimiento_prof = fechanacimiento_prof;
    }

    public String getGenero_prof() {
        return genero_prof;
    }

    public void setGenero_prof(String genero_prof) {
        this.genero_prof = genero_prof;
    }

    public int getEdad_prof() {
        return edad_prof;
    }

    public void setEdad_prof(int edad_prof) {
        this.edad_prof = edad_prof;
    }

    public String getEstadocivil_prof() {
        return estadocivil_prof;
    }

    public void setEstadocivil_prof(String estadocivil_prof) {
        this.estadocivil_prof = estadocivil_prof;
    }

    public String getDireccion_prof() {
        return direccion_prof;
    }

    public void setDireccion_prof(String direccion_prof) {
        this.direccion_prof = direccion_prof;
    }

    public String getTelefono_prof() {
        return telefono_prof;
    }

    public void setTelefono_prof(String telefono_prof) {
        this.telefono_prof = telefono_prof;
    }

    @Override
    public String toString() {
        return "ProfesionalDTO{" + "tipodocumentoid_prof=" + tipodocumentoid_prof + ", codigo_prof=" + codigo_prof + ", nombre_prof=" + nombre_prof + ", correo_prof=" + correo_prof + ", fechanacimiento_prof=" + fechanacimiento_prof + ", genero_prof=" + genero_prof + ", edad_prof=" + edad_prof + ", estadocivil_prof=" + estadocivil_prof + ", direccion_prof=" + direccion_prof + ", telefono_prof=" + telefono_prof + '}';
    }

    
    
}
