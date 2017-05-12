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
public class DocenteDTO {

    private int identificacion_doc;
    private String tipodocumentoid_doc;
    private int codigo_doc;
    private String nombre_doc;
    private String correo_doc;
    private String fechanacimiento_doc;
    private String genero_doc;
    private int edad_doc;
    private String estadocivil_doc;
    private String direccion_doc;
    private String telefono_doc;

    
    public DocenteDTO() {
    }

    public DocenteDTO(int identificacion_doc, String tipodocumentoid_doc, int codigo_doc, String nombre_doc, String correo_doc, String fechanacimiento_doc, String genero_doc, int edad_doc, String estadocivil_doc, String direccion_doc, String telefono_doc) {
        this.identificacion_doc = identificacion_doc;
        this.tipodocumentoid_doc = tipodocumentoid_doc;
        this.codigo_doc = codigo_doc;
        this.nombre_doc = nombre_doc;
        this.correo_doc = correo_doc;
        this.fechanacimiento_doc = fechanacimiento_doc;
        this.genero_doc = genero_doc;
        this.edad_doc = edad_doc;
        this.estadocivil_doc = estadocivil_doc;
        this.direccion_doc = direccion_doc;
        this.telefono_doc = telefono_doc;
    }

    public int getIdentificacion_doc() {
        return identificacion_doc;
    }

    public void setIdentificacion_doc(int identificacion_doc) {
        this.identificacion_doc = identificacion_doc;
    }

    public String getTipodocumentoid_doc() {
        return tipodocumentoid_doc;
    }

    public void setTipodocumentoid_doc(String tipodocumentoid_doc) {
        this.tipodocumentoid_doc = tipodocumentoid_doc;
    }

    public int getCodigo_doc() {
        return codigo_doc;
    }

    public void setCodigo_doc(int codigo_doc) {
        this.codigo_doc = codigo_doc;
    }

    public String getNombre_doc() {
        return nombre_doc;
    }

    public void setNombre_doc(String nombre_doc) {
        this.nombre_doc = nombre_doc;
    }

    public String getCorreo_doc() {
        return correo_doc;
    }

    public void setCorreo_doc(String correo_doc) {
        this.correo_doc = correo_doc;
    }

    public String getFechanacimiento_doc() {
        return fechanacimiento_doc;
    }

    public void setFechanacimiento_doc(String fechanacimiento_doc) {
        this.fechanacimiento_doc = fechanacimiento_doc;
    }

    public String getGenero_doc() {
        return genero_doc;
    }

    public void setGenero_doc(String genero_doc) {
        this.genero_doc = genero_doc;
    }

    public int getEdad_doc() {
        return edad_doc;
    }

    public void setEdad_doc(int edad_doc) {
        this.edad_doc = edad_doc;
    }

    public String getEstadocivil_doc() {
        return estadocivil_doc;
    }

    public void setEstadocivil_doc(String estadocivil_doc) {
        this.estadocivil_doc = estadocivil_doc;
    }

    public String getDireccion_doc() {
        return direccion_doc;
    }

    public void setDireccion_doc(String direccion_doc) {
        this.direccion_doc = direccion_doc;
    }

    public String getTelefono_doc() {
        return telefono_doc;
    }

    public void setTelefono_doc(String telefono_doc) {
        this.telefono_doc = telefono_doc;
    }

    @Override
    public String toString() {
        return "DocenteDTO{" + "identificacion_doc=" + identificacion_doc + ", tipodocumentoid_doc=" + tipodocumentoid_doc + ", codigo_doc=" + codigo_doc + ", nombre_doc=" + nombre_doc + ", correo_doc=" + correo_doc + ", fechanacimiento_doc=" + fechanacimiento_doc + ", genero_doc=" + genero_doc + ", edad_doc=" + edad_doc + ", estadocivil_doc=" + estadocivil_doc + ", direccion_doc=" + direccion_doc + ", telefono_doc=" + telefono_doc + '}';
    }

   

}
