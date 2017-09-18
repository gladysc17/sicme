/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package FACADE;

import NEGOCIO.NegocioImagen;
import DTO.ImagenDTO;
import java.sql.SQLException;
import java.util.List;

/**
 *
 * @author LEGADO
 */
public class FacadeImagen {
    
    public boolean registrarImagen(ImagenDTO ima) throws SQLException {
        return new NegocioImagen().registrarImagen(ima);
    }
    
    public List<ImagenDTO> listarImagenes()throws SQLException {
        return new NegocioImagen().listarImagenes();
    }
    
    public boolean actualizarEstadoBanner(String estado, int id) throws SQLException {
        return new NegocioImagen().actualizarEstadoBanner(estado, id);
    }
    
    public boolean eliminarImagen(int id) throws SQLException {
        return new NegocioImagen().eliminarImagen(id);
    }
    
    public List<ImagenDTO> obtenerImagenes() throws SQLException {
        return new NegocioImagen().obtenerImagenesActivas();
    }
}
