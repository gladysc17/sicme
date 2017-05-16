/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package NEGOCIO;

import java.sql.SQLException;

/**
 *
 * @author Gladys M
 */
public class Negocio {

    public boolean validarSesion(String perfil, int codigo, String clave) throws SQLException {
        {

            boolean rta = false;
            NegocioVice negVic = new NegocioVice();
            NegocioAdministrador negAdm = new NegocioAdministrador();
            NegocioMedico negMed = new NegocioMedico();                    

            if (perfil.equals("Vicerrector")) {
                return negVic.validarSesionVice(codigo, clave);
            }

            if (perfil.equals("Admin")) {
                return negAdm.validarSesionAdmin(codigo, clave);
            }   
            
            if (perfil.equals("Medico")) {
                return negMed.validarSesionMedico(codigo, clave);
            }   

            return rta;
        }

    }
    
    public boolean verificarUsuario(String tipo, int id){
        
        boolean rta = false;
        NegocioEstudiante negEst = new NegocioEstudiante();
        NegocioDocente negDoc = new NegocioDocente();
        NegocioUsuario negOtro = new NegocioUsuario();
        NegocioMedico negMed = new NegocioMedico();  
        NegocioProfesional negPro = new NegocioProfesional();
        NegocioServicioGeneral negSer = new NegocioServicioGeneral();
        
//        if(tipo.equals("estudiante")){
//            return negEst.consultarEstudianteIdBoolean(id);
//        }
        if (tipo.equals("docente")){
            return negDoc.consultarDocentePorIdBoolean(id);
        }
        if(tipo.equals("otro")){
            return negOtro.consultarOtroUsuarioIdBoolean(id);
        }
//        if(tipo.equals("medico")){
//            return negMed.consultarMedicoPorIdBoolean(id);
//            
//        }
        if(tipo.equals("profesional")){
            return negPro.consultarProfesionalPorIdBoolean(id);
        }
        if(tipo.equals("serviciogeneral")){
            return negSer.consultarServicioGeneralIdBoolean(id);
        }
        
        
        return rta;
    }
}
