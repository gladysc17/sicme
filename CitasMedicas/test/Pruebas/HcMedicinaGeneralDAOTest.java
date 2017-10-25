/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Pruebas;

import DAO.HcMedicinaGeneralDAO;
import DTO.HcMedicinaGeneralDTO;
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
public class HcMedicinaGeneralDAOTest {

    ConexionPostgres con = new ConexionPostgres();
    Connection co = con.getconexion();

    public HcMedicinaGeneralDAOTest() {
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
     * Test of registrarHCMedicinaGeneralError method, of class HcMedicinaGeneralDAO.
     */
    @Test
    public void testRegistrarHCMedicinaGeneralError() throws Exception {

        HcMedicinaGeneralDTO hcmed = new HcMedicinaGeneralDTO(234, 3906, "motivo", "enfe_generL", "re_sistemas", "ant1",
                "ant1", "ant1", "ant1", "ant1", "ant1", "ant1", "ant1", "ant1", "43", "34", "54", "45", "54", "5", "exf", "exf", "exf",
                "exf", "exf", "exf", "exf", "ef", "diag", "tipo", "diag", "tipo", "diag", "tipo", "trata", "reco", "fom");
        HcMedicinaGeneralDAO instance = new HcMedicinaGeneralDAO(co);

        boolean expResult = false;
        boolean result = instance.registrarHCMedicinaGeneral(hcmed);
        
        assertEquals(expResult, result);             
    }
}
