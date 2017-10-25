/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Pruebas;

import DAO.HcPlanificacionfamiliarDAO;
import DTO.Hc_planificacionfamiliarDTO;
import java.sql.Connection;
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
public class HcPlanificacionfamiliarDAOTest {
    
    ConexionPostgres con = new ConexionPostgres();
    Connection co = con.getconexion();
    
    public HcPlanificacionfamiliarDAOTest() {
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
     * Test of registrarHCplanifamiliar method, of class HcPlanificacionfamiliarDAO.
     */
    @Test
    public void testRegistrarHCplanifamiliar() throws Exception {
        
        Hc_planificacionfamiliarDTO planif = new Hc_planificacionfamiliarDTO(34, "tipovin", "aseg", "respon", "panren", "dir_res", "tel_res", 
                "motivo", "enferm", "menarca", "ciclos", "menop", "estad", "2017-07-08", "2017-08-09", "2017-09-09", "res", "plan", "me", 189, "rev_sos", "ant", 20);
        HcPlanificacionfamiliarDAO instance = new HcPlanificacionfamiliarDAO(co);
        
        boolean expResult = true;
        boolean result = instance.registrarHCplanifamiliar(planif);
        
        assertEquals(expResult, result);                
    }    
}
