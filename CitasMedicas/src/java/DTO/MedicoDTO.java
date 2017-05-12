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
public class MedicoDTO {
    
    private int identificacion_med;
    private String tipodocumentoid_med;
    private int codigo_med;
    private String nombre_med;
    private String correo_med;
    private String fechanacimiento_med;
    private String genero_med;
    private int edad_med;
    private String estadocivil_med;
    private String direccion_med;
    private String telefono_med;
    private String contrasena_med;
    private String servicio_med;

    public MedicoDTO() {
    }

    public MedicoDTO(int identificacion_med, String tipodocumentoid_med, int codigo_med, String nombre_med, String correo_med, String fechanacimiento_med, String genero_med, int edad_med, String estadocivil_med, String direccion_med, String telefono_med, String contrasena_med, String servicio_med) {
        this.identificacion_med = identificacion_med;
        this.tipodocumentoid_med = tipodocumentoid_med;
        this.codigo_med = codigo_med;
        this.nombre_med = nombre_med;
        this.correo_med = correo_med;
        this.fechanacimiento_med = fechanacimiento_med;
        this.genero_med = genero_med;
        this.edad_med = edad_med;
        this.estadocivil_med = estadocivil_med;
        this.direccion_med = direccion_med;
        this.telefono_med = telefono_med;
        this.contrasena_med = contrasena_med;
        this.servicio_med = servicio_med;
    }

      

    public int getIdentificacion_med() {
        return identificacion_med;
    }

    public void setIdentificacion_med(int identificacion_med) {
        this.identificacion_med = identificacion_med;
    }

    public int getCodigo_med() {
        return codigo_med;
    }

    public void setCodigo_med(int codigo_med) {
        this.codigo_med = codigo_med;
    }

    public String getNombre_med() {
        return nombre_med;
    }

    public void setNombre_med(String nombre_med) {
        this.nombre_med = nombre_med;
    }

    public String getCorreo_med() {
        return correo_med;
    }

    public void setCorreo_med(String correo_med) {
        this.correo_med = correo_med;
    }

    public String getTelefono_med() {
        return telefono_med;
    }

    public void setTelefono_med(String telefono_med) {
        this.telefono_med = telefono_med;
    }

    public String getServicio_med() {
        return servicio_med;
    }

    public void setServicio_med(String servicio_med) {
        this.servicio_med = servicio_med;
    }

    public String getContrasena_med() {
        return contrasena_med;
    }

    public void setContrasena_med(String contrasena_med) {
        this.contrasena_med = contrasena_med;
    }

    public String getTipodocumentoid_med() {
        return tipodocumentoid_med;
    }

    public void setTipodocumentoid_med(String tipodocumentoid_med) {
        this.tipodocumentoid_med = tipodocumentoid_med;
    }

    public String getFechanacimiento_med() {
        return fechanacimiento_med;
    }

    public void setFechanacimiento_med(String fechanacimiento_med) {
        this.fechanacimiento_med = fechanacimiento_med;
    }

    public String getGenero_med() {
        return genero_med;
    }

    public void setGenero_med(String genero_med) {
        this.genero_med = genero_med;
    }

    public int getEdad_med() {
        return edad_med;
    }

    public void setEdad_med(int edad_med) {
        this.edad_med = edad_med;
    }

    public String getEstadocivil_med() {
        return estadocivil_med;
    }

    public void setEstadocivil_med(String estadocivil_med) {
        this.estadocivil_med = estadocivil_med;
    }

    public String getDireccion_med() {
        return direccion_med;
    }

    public void setDireccion_med(String direccion_med) {
        this.direccion_med = direccion_med;
    }
    
    
@Override
    public String toString() {
        return "MedicoDTO{" + "identificacion_med=" + identificacion_med + ", codigo_med=" + codigo_med + ", nombre_med=" + nombre_med + ", correo_med=" + correo_med + ", telefono_med=" + telefono_med + ", servicio_med=" + servicio_med + '}';
    }
    
    
}
