/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Pruebas;

import DAO.UsuarioDAO;
import DTO.UsuarioDTO;
import NEGOCIO.NegocioUsuario;
import java.sql.Connection;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Assert;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;
import util.ConexionPostgres;

/**
 *
 * @author usuario
 */
public class UsuarioDAOTest {
    ConexionPostgres con = new ConexionPostgres();
    Connection co = con.getconexion();
    
    public UsuarioDAOTest() {
    }
    
    @BeforeClass
    public static void setUpClass() {
    }
    
    @AfterClass
    public static void tearDownClass() {
    }
    
    @Before
    public void setUp() {
    }
    
    @After
    public void tearDown() {
    }
    
    /**
     * Test of registrarUsuario method, of class UsuarioDAO.
     */
    @Test
    public void testRegistrarUsuario() throws Exception {
        
        UsuarioDTO otro = new UsuarioDTO("07", "c.c", "5051", "nomUsuario", "correo@gmail.com", "1990-08-12", 27, "F", "soltera", "av 8", "678", "medico", "2017-08-12", "medico");
        UsuarioDAO instance = new UsuarioDAO(co);
        boolean expResult = true;
        boolean result = instance.registrarUsuario(otro);
        assertEquals(expResult, result);
        
        if (expResult != result){
            fail("No se realizó el registro");
        }
        
    }

/**
     * Test of consultarUsuarioPorId method, of class UsuarioDAO.
     */
    @Test
    public void testConsultarUsuarioPorId() throws Exception {
        
        String id = "890";
        
        NegocioUsuario instance = new NegocioUsuario();
        
        
        UsuarioDTO expResult =  new UsuarioDTO("890", "C.C", "891", "Omar", "omar@hotmail.com", "1990-08-09", 27, "M", "Soltero", "Calle", "89090", "estudiante", "2017-05-06", "estudiante");
        
        UsuarioDTO result = instance.consultarUsuarioId(id);
        
        System.out.println(""+result.toString());
        System.out.println(""+expResult.toString());                
        
    }
    

/**
     * Test of registrarUsuarioError method, of class UsuarioDAO.
     */
    @Test
    public void testRegistrarUsuarioError() throws Exception {
        
        UsuarioDTO otro = new UsuarioDTO(null, "c.c", "5051", "nomUsuario", "correo@gmail.com", "1990-08-12", 27, "F", "soltera", "av 8", "678", "medico", "2017-08-12", "medico");
        NegocioUsuario instance = new NegocioUsuario();
        
        boolean expResult = false;
        boolean result = instance.registrarUsuario(otro);
        
        assertEquals(expResult, result);
        
        if (expResult != result){
            fail("No se realizó el registro");
        }        
    }

 /**
     * Test of consultarUsuarioError method, of class UsuarioDAO.
     */
    @Test
    public void testConsultarUsuarioError() throws Exception {
        
        String id = "941";
        
        UsuarioDAO instance = new UsuarioDAO(co);        
        
        UsuarioDTO expResult =  null;
        
        UsuarioDTO result = instance.consultarUsuarioPorId(id);
        
        System.out.println(""+result);
        System.out.println(""+expResult);            
        
        assertEquals(expResult, result);        
    }

    
    
}
