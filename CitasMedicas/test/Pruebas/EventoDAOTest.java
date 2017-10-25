/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Pruebas;

import DAO.EventoDAO;
import DTO.EventoDTO;
import NEGOCIO.NegocioEvento;
import java.sql.Connection;
import java.util.List;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;
import util.ConexionPostgres;

/**
 *
 * @author usuario
 */
public class EventoDAOTest {
    
    
    ConexionPostgres con = new ConexionPostgres();
    Connection co = con.getconexion();
    
    public EventoDAOTest() {
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
     * Test of consultaEventoError method, of class EventoDAO.
     */
    @Test
    public void testConsultaEventoError() throws Exception {
        
        int id = 20;
        EventoDAO instance = new EventoDAO(co);
        EventoDTO expResult = null;
        
        EventoDTO result = instance.consultaPorId(id);
        
        System.out.println(""+expResult);
        System.out.println(""+result);
        
        assertEquals(expResult, result);
    }   
    
}
