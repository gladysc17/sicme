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
  
    private int identificacion;
    private String tipodocumentoid;
    private int codigo;
    private String nombre;
    private String correo;
    private String fechanacimiento;
    private String genero;
    private int edad;
    private String estadocivil;
    private String direccion;
    private String telefono;


    public ProfesionalDTO() {
    }

    public ProfesionalDTO(int identificacion, String tipodocumentoid, int codigo, String nombre, String correo, String fechanacimiento, String genero, int edad, String estadocivil, String direccion, String telefono) {
        this.identificacion = identificacion;
        this.tipodocumentoid = tipodocumentoid;
        this.codigo = codigo;
        this.nombre = nombre;
        this.correo = correo;
        this.fechanacimiento = fechanacimiento;
        this.genero = genero;
        this.edad = edad;
        this.estadocivil = estadocivil;
        this.direccion = direccion;
        this.telefono = telefono;
    }

    public int getIdentificacion() {
        return identificacion;
    }

    public void setIdentificacion(int identificacion) {
        this.identificacion = identificacion;
    }

    public String getTipodocumentoid() {
        return tipodocumentoid;
    }

    public void setTipodocumentoid(String tipodocumentoid) {
        this.tipodocumentoid = tipodocumentoid;
    }

    public int getCodigo() {
        return codigo;
    }

    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getFechanacimiento() {
        return fechanacimiento;
    }

    public void setFechanacimiento(String fechanacimiento) {
        this.fechanacimiento = fechanacimiento;
    }

    public String getGenero() {
        return genero;
    }

    public void setGenero(String genero) {
        this.genero = genero;
    }

    public int getEdad() {
        return edad;
    }

    public void setEdad(int edad) {
        this.edad = edad;
    }

    public String getEstadocivil() {
        return estadocivil;
    }

    public void setEstadocivil(String estadocivil) {
        this.estadocivil = estadocivil;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

   

    
    
}
