/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package NEGOCIO;

import DAO.UsuarioDAO;
import DTO.MedicoDTO;
import DTO.UsuarioDTO;
import FACADE.FacadeMedico;
import java.sql.Connection;
import java.sql.Date;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import util.ConexionPostgres;
import util.ServicioEmail;

/**
 *
 * @author Gladys M
 */
public class NegocioUsuario {

    public boolean verficarUsuario(String identificacion, String clave) {
        boolean rta = false;

        ConexionPostgres con = new ConexionPostgres();
        Connection co = con.getconexion();

        UsuarioDAO u = new UsuarioDAO(co);

        try {
            UsuarioDTO usu = u.consultarUsuarioPorId(identificacion); 
            
            if(usu ==null){
                return false;
            }
            else{
            
            return usu.getContrasena().equals(clave);
            
            }
           
        } catch (SQLException ex) {
            Logger.getLogger(NegocioUsuario.class.getName()).log(Level.SEVERE, null, ex);

        }finally {
            if (co != null) {
                try {
                    co.close();
                } catch (SQLException ex) {
                    Logger.getLogger(NegocioUsuario.class.getName()).log(Level.SEVERE, null, ex);

                }
            }            
        }

            return rta;
        
    }

    public boolean registrarUsuario(UsuarioDTO usuario) {

        boolean resultado = false;

        ConexionPostgres con = new ConexionPostgres();
        Connection co = con.getconexion();

        UsuarioDAO otr = new UsuarioDAO(co);

        try {
            UsuarioDTO otroU = otr.consultarUsuarioPorIdCodigo(usuario.getIdentificacion(), usuario.getCodigo());
            if (otroU == null) {
                return resultado = otr.registrarUsuario(usuario);
            } else {
                return false;
            }
        } catch (SQLException ex) {
            Logger.getLogger(NegocioUsuario.class.getName()).log(Level.SEVERE, null, ex);

        } finally {
            if (co != null) {
                try {
                    co.close();
                } catch (SQLException ex) {
                    Logger.getLogger(NegocioUsuario.class.getName()).log(Level.SEVERE, null, ex);

                }
            }
        }
        return resultado;

    }

    public UsuarioDTO consultarUsuarioId(String id) {

        ConexionPostgres con = new ConexionPostgres();
        Connection co = con.getconexion();
        UsuarioDAO ou = new UsuarioDAO(co);

        try {
            return ou.consultarUsuarioPorId(id);
        } catch (SQLException ex) {
            Logger.getLogger(NegocioUsuario.class.getName()).log(Level.SEVERE, null, ex);
        } finally {

            if (co != null) {
                try {
                    co.close();
                } catch (SQLException ex) {
                    Logger.getLogger(NegocioUsuario.class.getName()).log(Level.SEVERE, null, ex);
                    return null;
                }
            }
        }
        return null;
    }

    public boolean consultarOtroUsuarioIdBoolean(String id) {

        boolean rta = false;
        ConexionPostgres con = new ConexionPostgres();
        Connection co = con.getconexion();
        UsuarioDAO ou = new UsuarioDAO(co);

        try {
            UsuarioDTO otro = ou.consultarUsuarioPorId(id);
            return otro != null;

        } catch (SQLException ex) {
            Logger.getLogger(NegocioUsuario.class.getName()).log(Level.SEVERE, null, ex);
        } finally {

            if (co != null) {
                try {
                    co.close();
                } catch (SQLException ex) {
                    Logger.getLogger(NegocioUsuario.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return rta;
    }

    public UsuarioDTO consultarUsuarioIdCodigo(String id, String codigo) {

        ConexionPostgres con = new ConexionPostgres();
        Connection co = con.getconexion();
        UsuarioDAO ou = new UsuarioDAO(co);

        try {
            return ou.consultarUsuarioPorIdCodigo(id, codigo);
        } catch (SQLException ex) {
            Logger.getLogger(NegocioUsuario.class.getName()).log(Level.SEVERE, null, ex);
        } finally {

            if (co != null) {
                try {
                    co.close();
                } catch (SQLException ex) {
                    Logger.getLogger(NegocioUsuario.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return null;
    }

    public List<UsuarioDTO> listarOtrosUsuarios() throws SQLException {

        ConexionPostgres con = new ConexionPostgres();
        Connection co = con.getconexion();

        List<UsuarioDTO> otros = new ArrayList<UsuarioDTO>();
        UsuarioDAO otro = new UsuarioDAO(co);

        try {
            otros = otro.consultarUsuarios();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            co.close();
        }
        return (otros);
    }

    public boolean modificarUsuario(String identificacion, String correo, Date fechanacimiento, String genero, String estadocivil, String direccion, String telefono, int edad, String contrasena) throws SQLException {

        boolean rta = false;
        ConexionPostgres con = new ConexionPostgres();
        Connection co = con.getconexion();

        UsuarioDAO est = new UsuarioDAO(co);

        try {

            rta = est.modificarUsuario(identificacion, correo, fechanacimiento, genero, estadocivil, direccion, telefono, edad, contrasena);

        } catch (SQLException ex) {
            Logger.getLogger(NegocioUsuario.class.getName()).log(Level.SEVERE, null, ex);

        } finally {

            if (co != null) {
                try {
                    co.close();
                } catch (SQLException ex) {
                    Logger.getLogger(NegocioUsuario.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }

        return rta;
    }

    public boolean modificarAdmin(String identificacion, String contrasena) throws SQLException {

        boolean rta = false;
        ConexionPostgres con = new ConexionPostgres();
        Connection co = con.getconexion();

        UsuarioDAO est = new UsuarioDAO(co);

        try {

            rta = est.modificarAdmin(identificacion, contrasena);

        } catch (SQLException ex) {
            Logger.getLogger(NegocioUsuario.class.getName()).log(Level.SEVERE, null, ex);

        } finally {

            if (co != null) {
                try {
                    co.close();
                } catch (SQLException ex) {
                    Logger.getLogger(NegocioUsuario.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }

        return rta;
    }

    public boolean modificarVice(String identificacion, String contrasena) throws SQLException {

        boolean rta = false;
        ConexionPostgres con = new ConexionPostgres();
        Connection co = con.getconexion();

        UsuarioDAO est = new UsuarioDAO(co);

        try {

            rta = est.modificarVice(identificacion, contrasena);

        } catch (SQLException ex) {
            Logger.getLogger(NegocioUsuario.class.getName()).log(Level.SEVERE, null, ex);

        } finally {

            if (co != null) {
                try {
                    co.close();
                } catch (SQLException ex) {
                    Logger.getLogger(NegocioUsuario.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }

        return rta;
    }

    public boolean modificarMedico(String identificacion, String contrasena) throws SQLException {

        boolean rta = false;
        ConexionPostgres con = new ConexionPostgres();
        Connection co = con.getconexion();

        UsuarioDAO est = new UsuarioDAO(co);

        try {

            rta = est.modificarMedico(identificacion, contrasena);

        } catch (SQLException ex) {
            Logger.getLogger(NegocioUsuario.class.getName()).log(Level.SEVERE, null, ex);

        } finally {

            if (co != null) {
                try {
                    co.close();
                } catch (SQLException ex) {
                    Logger.getLogger(NegocioUsuario.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }

        return rta;
    }

    public int calcularEdad(Date fecha) {

        int edad = 0;
        ConexionPostgres con = new ConexionPostgres();
        Connection co = con.getconexion();
        UsuarioDAO ou = new UsuarioDAO(co);

        try {
            edad = ou.calcularedad(fecha);
        } catch (SQLException ex) {
            Logger.getLogger(NegocioUsuario.class.getName()).log(Level.SEVERE, null, ex);
        } finally {

            if (co != null) {
                try {
                    co.close();
                } catch (SQLException ex) {
                    Logger.getLogger(NegocioUsuario.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return edad;
    }

    public boolean recuperarContrasena(String id) throws SQLException {

        ConexionPostgres con = new ConexionPostgres();
        Connection co = con.getconexion();
        UsuarioDAO u = new UsuarioDAO(co);
        UsuarioDTO usuario = u.consultarUsuarioPorId(id);
        String contrasena = usuario.getContrasena();

        ServicioEmail servicioEmail = new ServicioEmail("sicgme@gmail.com", "oovnjylswrgytpty");

        String correo = usuario.getCorreo();
        String asunto = "SIGME - RECUPERAR CONTRASEÑA";
        String clave = "SU CONTRASEÑA PARA ACCEDER ES: " + contrasena +  "\n" +
                "RECUERDE CAMBIARLA UNA VEZ INGRESE AL SISTEMA";

        String cont = servicioEmail.getClaveEmailUsuarioEmisor();
        System.out.println("contraseña-->" + cont);
        System.out.println("correo-->" + correo);

        boolean enviar = servicioEmail.enviarEmail(correo, asunto, clave);

        return enviar;

    }

    public ArrayList<UsuarioDTO> consultarMedicoPorServicio(String tipo_usuario, String servicio) throws SQLException {

        ConexionPostgres con = new ConexionPostgres();
        Connection co = con.getconexion();

        UsuarioDAO med = new UsuarioDAO(co);
        ArrayList<UsuarioDTO> medicos = new ArrayList<UsuarioDTO>();

        try {
            medicos = med.consultarMedicosPorServicio(tipo_usuario, servicio);

        } catch (SQLException ex) {
            Logger.getLogger(NegocioUsuario.class.getName()).log(Level.SEVERE, null, ex);

        } finally {

            if (co != null) {
                try {
                    co.close();
                } catch (SQLException ex) {
                    Logger.getLogger(NegocioUsuario.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return medicos;

    }

    public List<UsuarioDTO> listarUsuarioPorTipo(String tipo, String fecha1, String fecha2) throws SQLException {

        ConexionPostgres con = new ConexionPostgres();
        Connection co = con.getconexion();

        List<UsuarioDTO> otros = new ArrayList<UsuarioDTO>();
        UsuarioDAO otro = new UsuarioDAO(co);

        try {
            otros = otro.consultarUsuarioPorTipo(tipo, fecha1, fecha2);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            co.close();
        }
        return (otros);
    }

    public List<UsuarioDTO> consultarUsuariosPorFecha(String fecha1, String fecha2) throws SQLException {

        ConexionPostgres con = new ConexionPostgres();
        Connection co = con.getconexion();

        List<UsuarioDTO> otros = new ArrayList<UsuarioDTO>();
        UsuarioDAO otro = new UsuarioDAO(co);

        try {
            otros = otro.consultarUsuariosPorFecha(fecha1, fecha2);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            co.close();
        }
        return (otros);
    }
}
