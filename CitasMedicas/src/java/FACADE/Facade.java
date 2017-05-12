/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package FACADE;

import NEGOCIO.Negocio;
import java.sql.SQLException;

/**
 *
 * @author Gladys M
 */
public class Facade {

    public boolean validarSesion(String perfil, int codigo, String clave) throws SQLException {
        return new Negocio().validarSesion(perfil, codigo, clave);

    }
    public boolean verificarUsuario(String tipo, int id){
        return new Negocio().verificarUsuario(tipo, id);
    }
}
