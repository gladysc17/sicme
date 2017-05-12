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
public class OtroUsuarioDTO {
    
    private int identificacion_otro;
    private String tipodocumentoid_otro;
    private int codigo_otro;
    private String nombre_otro;
    private String correo_otro;
    private String fechanacimiento_otro;
    private String genero_otro;
    private int edad_otro;
    private String estadocivil_otro;
    private String direccion_otro;
    private String telefono_otro;     
    private String rol_otro;

    public OtroUsuarioDTO() {
    }

    public OtroUsuarioDTO(int identificacion_otro, String tipodocumentoid_otro, int codigo_otro, String nombre_otro, String correo_otro, String fechanacimiento_otro, String genero_otro, int edad_otro, String estadocivil_otro, String direccion_otro, String telefono_otro, String rol_otro) {
        this.identificacion_otro = identificacion_otro;
        this.tipodocumentoid_otro = tipodocumentoid_otro;
        this.codigo_otro = codigo_otro;
        this.nombre_otro = nombre_otro;
        this.correo_otro = correo_otro;
        this.fechanacimiento_otro = fechanacimiento_otro;
        this.genero_otro = genero_otro;
        this.edad_otro = edad_otro;
        this.estadocivil_otro = estadocivil_otro;
        this.direccion_otro = direccion_otro;
        this.telefono_otro = telefono_otro;        
        this.rol_otro = rol_otro;
    }

    public int getIdentificacion_otro() {
        return identificacion_otro;
    }

    public void setIdentificacion_otro(int identificacion_otro) {
        this.identificacion_otro = identificacion_otro;
    }

    public int getCodigo_otro() {
        return codigo_otro;
    }

    public void setCodigo_otro(int codigo_otro) {
        this.codigo_otro = codigo_otro;
    }

    public String getNombre_otro() {
        return nombre_otro;
    }

    public void setNombre_otro(String nombre_otro) {
        this.nombre_otro = nombre_otro;
    }

    public String getCorreo_otro() {
        return correo_otro;
    }

    public void setCorreo_otro(String correo_otro) {
        this.correo_otro = correo_otro;
    }

    public String getTelefono_otro() {
        return telefono_otro;
    }

    public void setTelefono_otro(String telefono_otro) {
        this.telefono_otro = telefono_otro;
    }

    public String getRol_otro() {
        return rol_otro;
    }

    public void setRol_otro(String rol_otro) {
        this.rol_otro = rol_otro;
    }

    public String getTipodocumentoid_otro() {
        return tipodocumentoid_otro;
    }

    public void setTipodocumentoid_otro(String tipodocumentoid_otro) {
        this.tipodocumentoid_otro = tipodocumentoid_otro;
    }

    public String getFechanacimiento_otro() {
        return fechanacimiento_otro;
    }

    public void setFechanacimiento_otro(String fechanacimiento_otro) {
        this.fechanacimiento_otro = fechanacimiento_otro;
    }

    public String getGenero_otro() {
        return genero_otro;
    }

    public void setGenero_otro(String genero_otro) {
        this.genero_otro = genero_otro;
    }

    public int getEdad_otro() {
        return edad_otro;
    }

    public void setEdad_otro(int edad_otro) {
        this.edad_otro = edad_otro;
    }

    public String getEstadocivil_otro() {
        return estadocivil_otro;
    }

    public void setEstadocivil_otro(String estadocivil_otro) {
        this.estadocivil_otro = estadocivil_otro;
    }

    public String getDireccion_otro() {
        return direccion_otro;
    }

    public void setDireccion_otro(String direccion_otro) {
        this.direccion_otro = direccion_otro;
    }    
    

    @Override
    public String toString() {
        return "OtroUsuarioDTO{" + "identificacion_otro=" + identificacion_otro + ", codigo_otro=" + codigo_otro + ", nombre_otro=" + nombre_otro + ", correo_otro=" + correo_otro + ", telefono_otro=" + telefono_otro + '}';
    }
    
    
}
