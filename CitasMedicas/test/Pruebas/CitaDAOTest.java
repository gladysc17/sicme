/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Pruebas;

import DAO.CitaDAO;
import DTO.CitaDTO;
import NEGOCIO.NegocioCita;
import groovyjarjarantlr.Token;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Time;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashSet;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;
import util.ConexionPostgres;
import static org.junit.Assert.assertArrayEquals;

/**
 *
 * @author usuario
 */
public class CitaDAOTest {

    ConexionPostgres con = new ConexionPostgres();
    Connection co = con.getconexion();

    public CitaDAOTest() {
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
     * Test of consultarCitasUsuarioError method, of class CitaDAO.
     */
    @Test
    public void testConsultarCitasUsuarioError() throws Exception {                
        String id_usuario = "3";
        CitaDAO instance = new CitaDAO(co);        
        ArrayList<CitaDTO> expResult =  new ArrayList<CitaDTO>();        
        
        ArrayList<CitaDTO> result = instance.consultarCitasUsuario(id_usuario);        
        
        System.out.println(" resultado: "+result);
        System.out.println("  esperado: "+expResult);   
        
        assertEquals(expResult, result);
        
    }
}