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
public class ServicioGeneralDTO {
    
    private int identificacion_sg;
    private String tipodocumentoid_sg;
    private int codigo_sg;
    private String nombre_sg;
    private String correo_sg;
    private String fechanacimiento_sg;
    private String genero_sg;
    private int edad_sg;
    private String estadocivil_sg;
    private String direccion_sg;
    private String telefono_sg;

    public ServicioGeneralDTO() {
    }

    public ServicioGeneralDTO(int identificacion_sg, String tipodocumentoid_sg, int codigo_sg, String nombre_sg, String correo_sg, String fechanacimiento_sg, String genero_sg, int edad_sg, String estadocivil_sg, String direccion_sg, String telefono_sg) {
        this.identificacion_sg = identificacion_sg;
        this.tipodocumentoid_sg = tipodocumentoid_sg;
        this.codigo_sg = codigo_sg;
        this.nombre_sg = nombre_sg;
        this.correo_sg = correo_sg;
        this.fechanacimiento_sg = fechanacimiento_sg;
        this.genero_sg = genero_sg;
        this.edad_sg = edad_sg;
        this.estadocivil_sg = estadocivil_sg;
        this.direccion_sg = direccion_sg;
        this.telefono_sg = telefono_sg;
    }

    public int getIdentificacion_sg() {
        return identificacion_sg;
    }

    public void setIdentificacion_sg(int identificacion_sg) {
        this.identificacion_sg = identificacion_sg;
    }

    public String getTipodocumentoid_sg() {
        return tipodocumentoid_sg;
    }

    public void setTipodocumentoid_sg(String tipodocumentoid_sg) {
        this.tipodocumentoid_sg = tipodocumentoid_sg;
    }

    public int getCodigo_sg() {
        return codigo_sg;
    }

    public void setCodigo_sg(int codigo_sg) {
        this.codigo_sg = codigo_sg;
    }

    public String getNombre_sg() {
        return nombre_sg;
    }

    public void setNombre_sg(String nombre_sg) {
        this.nombre_sg = nombre_sg;
    }

    public String getCorreo_sg() {
        return correo_sg;
    }

    public void setCorreo_sg(String correo_sg) {
        this.correo_sg = correo_sg;
    }

    public String getFechanacimiento_sg() {
        return fechanacimiento_sg;
    }

    public void setFechanacimiento_sg(String fechanacimiento_sg) {
        this.fechanacimiento_sg = fechanacimiento_sg;
    }

    public String getGenero_sg() {
        return genero_sg;
    }

    public void setGenero_sg(String genero_sg) {
        this.genero_sg = genero_sg;
    }

    public int getEdad_sg() {
        return edad_sg;
    }

    public void setEdad_sg(int edad_sg) {
        this.edad_sg = edad_sg;
    }

    public String getEstadocivil_sg() {
        return estadocivil_sg;
    }

    public void setEstadocivil_sg(String estadocivil_sg) {
        this.estadocivil_sg = estadocivil_sg;
    }

    public String getDireccion_sg() {
        return direccion_sg;
    }

    public void setDireccion_sg(String direccion_sg) {
        this.direccion_sg = direccion_sg;
    }

    public String getTelefono_sg() {
        return telefono_sg;
    }

    public void setTelefono_sg(String telefono_sg) {
        this.telefono_sg = telefono_sg;
    }

    @Override
    public String toString() {
        return "ServicioGeneralDTO{" + "identificacion_sg=" + identificacion_sg + ", tipodocumentoid_sg=" + tipodocumentoid_sg + ", codigo_sg=" + codigo_sg + ", nombre_sg=" + nombre_sg + ", correo_sg=" + correo_sg + ", fechanacimiento_sg=" + fechanacimiento_sg + ", genero_sg=" + genero_sg + ", edad_sg=" + edad_sg + ", estadocivil_sg=" + estadocivil_sg + ", direccion_sg=" + direccion_sg + ", telefono_sg=" + telefono_sg + '}';
    }

    
    
    
}
