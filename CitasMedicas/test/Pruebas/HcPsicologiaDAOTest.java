/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Pruebas;

import DAO.HcPsicologiaDAO;
import DTO.HcPsicologiaDTO;
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
public class HcPsicologiaDAOTest {
    
    ConexionPostgres con = new ConexionPostgres();
    Connection co = con.getconexion();
    
    public HcPsicologiaDAOTest() {
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
     * Test of registrarHcPsicologia method, of class HcPsicologiaDAO.
     */
    @Test
    public void testRegistrarHcPsicologia() throws Exception {
        
        HcPsicologiaDTO hcpsico = new HcPsicologiaDTO(10, "motivo", "histori", "problem", "diag", "proceso", "seguimiento", "no", 26, "", "","", "");
        HcPsicologiaDAO instance = new HcPsicologiaDAO(co);
        boolean expResult = true;
        boolean result = instance.registrarHcPsicologia(hcpsico);
        assertEquals(expResult, result);        
    }
}
