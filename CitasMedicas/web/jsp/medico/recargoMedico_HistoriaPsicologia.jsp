<%-- 
    Document   : recargoMedico_HistoriaPsicologia
    Created on : 05-abr-2017, 19:23:33
    Author     : Gladys M
--%>

<%@page import="DTO.OtroUsuarioDTO"%>
<%@page import="FACADE.FacadeOtrosUsuarios"%>
<%@page import="DTO.DocenteDTO"%>
<%@page import="FACADE.FacadeDocente"%>
<%@page import="DTO.ServicioGeneralDTO"%>
<%@page import="FACADE.FacadeServicioGeneral"%>
<%@page import="DTO.MedicoDTO"%>
<%@page import="FACADE.FacadeMedico"%>
<%@page import="FACADE.FacadeHorarioMedico"%>
<%@page import="DTO.ProfesionalDTO"%>
<%@page import="FACADE.FacadeProfesional"%>
<%@page import="DTO.EstudianteDTO"%>
<%@page import="FACADE.FacadeEstudiante"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="col-md-1"> </div>
        <div class="col-md-10">


            <div class="row">
                <div class="col-md-12">
                    <div class="card">

                        <table border="2px" width="100%">                                 
                            <tr>                                    
                                <td rowspan="2">
                                    <img src="../img/logo_ufps1.png" alt=""  width="100" height="100"/> <BR>
                                    UFPS
                                </td>
                                <td rowspan="2" align="center" height="100"><p>HISTORIA PSICOLOGICA</p>                                   
                                    <p>DIVISION DE SERVICIOS ASISTENCIALES Y DE SALUD</p>
                                    <p>UNIDAD DE SERVICIOS ASISTENCIALES Y DE SALUD</p>
                                </td>
                                <td>Fecha: 04/04/2017</td>                                    
                            </tr>
                            <tr>
                                <td>Hora: 22:00</td>                                                                         
                            </tr>                                
                        </table> <br>

                        <div class="panel panel-default">

                            <div>	
                                <ul  class="nav nav-pills panel panel-heading">
                                    <li><a  href="#1a" data-toggle="tab"> <h3> Datos Basicos| </h3></a>
                                    </li>
                                    <li><a href="#2a" data-toggle="tab"> <h3>Tipologia Familiar |</h3></a>
                                    </li>
                                    <li><a href="#3a" data-toggle="tab"> <h3>Anamnesis|</h3></a>
                                    </li>
                                    <li><a href="#4a" data-toggle="tab"><h3> Proceso/Seguimiento</h3></a>
                                    </li>
                                </ul>
                                <form  action="../controlador/procesarRegistroHistoriaPsicologia.jsp" method="post"> 
                                    <div class="tab-content">

                                        <div class="tab-pane active" id="1a">
                                            <div class="panel-body">  
                                                <%

                                                    int idusuario_hcmed = Integer.parseInt(request.getParameter("id"));
                                                    int idcita = Integer.parseInt(request.getParameter("idcita"));
                                                    String tipo = request.getParameter("tipo");

                                                    if (tipo.equals("estudiante")) {
                                                        FacadeEstudiante facEst = new FacadeEstudiante();
                                                        EstudianteDTO est = facEst.consultarEstudianteporId(idusuario_hcmed);

                                                        String nombre = est.getNombre_est();
                                                        int id = est.getIdentificacion_est();
                                                        int codigo = est.getCodigo_est();
                                                        String correo = est.getCorreo_est();
                                                        String fechadeNac = est.getCorreo_est();
                                                        int edad = est.getCodigo_est();
                                                        String genero = est.getNombre_est();
                                                        String estadoCivil = est.getCorreo_est();
                                                        String direccion = est.getCorreo_est();
                                                        String telefono = est.getTelefono_est();

                                                %>
                                                <input type="hidden" id="ide" name="ide" value="<%=id%>">
                                                <input type="hidden" id="idecita" name="idecita" value="<%=idcita%>">
                                                <table class="table table-responsive">
                                                    <thead>
                                                        <tr>
                                                            <th colspan="3">Nombres y Apellidos: <%=nombre%></th>                                                
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr>
                                                            <td>Identificación: <%=id%></td> 
                                                            <td>Codigo: <%=codigo%> </td>
                                                            <td>Correo: <%=correo%></td> 
                                                        </tr>
                                                        <tr>
                                                            <td>Fecha de Nacimiento: <%=fechadeNac%></td>
                                                            <td>Edad: <%=edad%> </td>
                                                            <td>Género: <%=genero%></td>

                                                        </tr>
                                                        <tr>                                                
                                                            <td>Estado Civil: <%=estadoCivil%></td>
                                                            <td>Direccion: <%=direccion%></td>
                                                            <td>Telefono: <%=telefono%></td>                                                                                                
                                                        </tr>

                                                    </tbody>
                                                </table>
                                                <%
                                                } else if (tipo.equals("profesional")) {
                                                    FacadeProfesional facpro = new FacadeProfesional();
                                                    ProfesionalDTO pro = facpro.consultarProfesionalPorId(idusuario_hcmed);

                                                    String nombre = pro.getNombre_prof();
                                                    int id = pro.getIdentificacion_prof();
                                                    int codigo = pro.getCodigo_prof();
                                                    String correo = pro.getCorreo_prof();
                                                    String fechadeNac = pro.getCorreo_prof();
                                                    int edad = pro.getCodigo_prof();
                                                    String genero = pro.getNombre_prof();
                                                    String estadoCivil = pro.getCorreo_prof();
                                                    String direccion = pro.getCorreo_prof();
                                                    String telefono = pro.getTelefono_prof();

                                                %>
                                                <input type="hidden" id="ide" name="ide" value="<%=id%>">
                                                <input type="hidden" id="idecita" name="idecita" value="<%=idcita%>">
                                                <table class="table table-responsive">
                                                    <thead>
                                                        <tr>
                                                            <th colspan="3">Nombres y Apellidos: <%=nombre%></th>                                                
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr>
                                                            <td>Identificación: <%=id%></td> 
                                                            <td>Codigo: <%=codigo%> </td>
                                                            <td>Correo: <%=correo%></td> 
                                                        </tr>
                                                        <tr>
                                                            <td>Fecha de Nacimiento: <%=fechadeNac%></td>
                                                            <td>Edad: <%=edad%> </td>
                                                            <td>Género: <%=genero%></td>

                                                        </tr>
                                                        <tr>                                                
                                                            <td>Estado Civil: <%=estadoCivil%></td>
                                                            <td>Direccion: <%=direccion%></td>
                                                            <td>Telefono: <%=telefono%></td>                                                                                                
                                                        </tr>

                                                    </tbody>
                                                </table>
                                                <%
                                                } else if (tipo.equals("medico")) {
                                                    FacadeMedico facmed = new FacadeMedico();
                                                    MedicoDTO med = facmed.consultarMedicoPorId(idusuario_hcmed);

                                                    String nombre = med.getNombre_med();
                                                    int id = med.getIdentificacion_med();
                                                    int codigo = med.getCodigo_med();
                                                    String correo = med.getCorreo_med();
                                                    String fechadeNac = med.getFechanacimiento_med();
                                                    int edad = med.getEdad_med();
                                                    String genero = med.getGenero_med();
                                                    String estadoCivil = med.getEstadocivil_med();
                                                    String direccion = med.getDireccion_med();
                                                    String telefono = med.getTelefono_med();

                                                %>
                                                <input type="hidden" id="ide" name="ide" value="<%=id%>">
                                                <input type="hidden" id="idecita" name="idecita" value="<%=idcita%>">
                                                <table class="table table-responsive">
                                                    <thead>
                                                        <tr>
                                                            <th colspan="3">Nombres y Apellidos: <%=nombre%></th>                                                
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr>
                                                            <td>Identificación: <%=id%></td> 
                                                            <td>Codigo: <%=codigo%> </td>
                                                            <td>Correo: <%=correo%></td> 
                                                        </tr>
                                                        <tr>
                                                            <td>Fecha de Nacimiento: <%=fechadeNac%></td>
                                                            <td>Edad: <%=edad%> </td>
                                                            <td>Género: <%=genero%></td>

                                                        </tr>
                                                        <tr>                                                
                                                            <td>Estado Civil: <%=estadoCivil%></td>
                                                            <td>Direccion: <%=direccion%></td>
                                                            <td>Telefono: <%=telefono%></td>                                                                                                
                                                        </tr>

                                                    </tbody>
                                                </table>
                                                <%
                                                } else if (tipo.equals("serviciogeneral")) {
                                                    FacadeServicioGeneral facser = new FacadeServicioGeneral();
                                                    ServicioGeneralDTO ser = facser.consultarServicioGeneralPorId(idusuario_hcmed);

                                                    String nombre = ser.getNombre_sg();
                                                    int id = ser.getIdentificacion_sg();
                                                    int codigo = ser.getCodigo_sg();
                                                    String correo = ser.getCorreo_sg();
                                                    String fechadeNac = ser.getFechanacimiento_sg();
                                                    int edad = ser.getEdad_sg();
                                                    String genero = ser.getGenero_sg();
                                                    String estadoCivil = ser.getEstadocivil_sg();
                                                    String direccion = ser.getDireccion_sg();
                                                    String telefono = ser.getTelefono_sg();

                                                %>
                                                <input type="hidden" id="ide" name="ide" value="<%=id%>">
                                                <input type="hidden" id="idecita" name="idecita" value="<%=idcita%>">
                                                <table class="table table-responsive">
                                                    <thead>
                                                        <tr>
                                                            <th colspan="3">Nombres y Apellidos: <%=nombre%></th>                                                
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr>
                                                            <td>Identificación: <%=id%></td> 
                                                            <td>Codigo: <%=codigo%> </td>
                                                            <td>Correo: <%=correo%></td> 
                                                        </tr>
                                                        <tr>
                                                            <td>Fecha de Nacimiento: <%=fechadeNac%></td>
                                                            <td>Edad: <%=edad%> </td>
                                                            <td>Género: <%=genero%></td>

                                                        </tr>
                                                        <tr>                                                
                                                            <td>Estado Civil: <%=estadoCivil%></td>
                                                            <td>Direccion: <%=direccion%></td>
                                                            <td>Telefono: <%=telefono%></td>                                                                                                
                                                        </tr>

                                                    </tbody>
                                                </table>
                                                <%
                                                } else if (tipo.equals("docente")) {
                                                    FacadeDocente facdoc = new FacadeDocente();
                                                    DocenteDTO doc = facdoc.consultarDocenteporId(idusuario_hcmed);

                                                    String nombre = doc.getNombre_doc();
                                                    int id = doc.getIdentificacion_doc();
                                                    int codigo = doc.getCodigo_doc();
                                                    String correo = doc.getCorreo_doc();
                                                    String fechadeNac = doc.getFechanacimiento_doc();
                                                    int edad = doc.getEdad_doc();
                                                    String genero = doc.getGenero_doc();
                                                    String estadoCivil = doc.getEstadocivil_doc();
                                                    String direccion = doc.getDireccion_doc();
                                                    String telefono = doc.getTelefono_doc();

                                                %>
                                                <input type="hidden" id="ide" name="ide" value="<%=id%>">
                                                <input type="hidden" id="idecita" name="idecita" value="<%=idcita%>">
                                                <table class="table table-responsive">
                                                    <thead>
                                                        <tr>
                                                            <th colspan="3">Nombres y Apellidos: <%=nombre%></th>                                                
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr>
                                                            <td>Identificación: <%=id%></td> 
                                                            <td>Codigo: <%=codigo%> </td>
                                                            <td>Correo: <%=correo%></td> 
                                                        </tr>
                                                        <tr>
                                                            <td>Fecha de Nacimiento: <%=fechadeNac%></td>
                                                            <td>Edad: <%=edad%> </td>
                                                            <td>Género: <%=genero%></td>

                                                        </tr>
                                                        <tr>                                                
                                                            <td>Estado Civil: <%=estadoCivil%></td>
                                                            <td>Direccion: <%=direccion%></td>
                                                            <td>Telefono: <%=telefono%></td>                                                                                                
                                                        </tr>

                                                    </tbody>
                                                </table>
                                                <%
                                                } else if (tipo.equals("otrousuario")) {
                                                    FacadeOtrosUsuarios facotro = new FacadeOtrosUsuarios();
                                                    OtroUsuarioDTO otro = facotro.consultarOtroUsuarioPorId(idusuario_hcmed);

                                                    String nombre = otro.getNombre_otro();
                                                    int id = otro.getIdentificacion_otro();
                                                    int codigo = otro.getCodigo_otro();
                                                    String correo = otro.getCorreo_otro();
                                                    String fechadeNac = otro.getFechanacimiento_otro();
                                                    int edad = otro.getEdad_otro();
                                                    String genero = otro.getGenero_otro();
                                                    String estadoCivil = otro.getEstadocivil_otro();
                                                    String direccion = otro.getDireccion_otro();
                                                    String telefono = otro.getTelefono_otro();

                                                %>
                                                <input type="hidden" id="ide" name="ide" value="<%=id%>">
                                                <input type="hidden" id="idecita" name="idecita" value="<%=idcita%>">
                                                <table class="table table-responsive">
                                                    <thead>
                                                        <tr>
                                                            <th colspan="3">Nombres y Apellidos: <%=nombre%></th>                                                
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr>
                                                            <td>Identificación: <%=id%></td> 
                                                            <td>Codigo: <%=codigo%> </td>
                                                            <td>Correo: <%=correo%></td> 
                                                        </tr>
                                                        <tr>
                                                            <td>Fecha de Nacimiento: <%=fechadeNac%></td>
                                                            <td>Edad: <%=edad%> </td>
                                                            <td>Género: <%=genero%></td>

                                                        </tr>
                                                        <tr>                                                
                                                            <td>Estado Civil: <%=estadoCivil%></td>
                                                            <td>Direccion: <%=direccion%></td>
                                                            <td>Telefono: <%=telefono%></td>                                                                                                
                                                        </tr>

                                                    </tbody>
                                                </table>
                                                <%
                                                    }


                                                %>

                                            </div>

                                            <div>
                                                <h3> MOTIVO DE LA CONSULTA: </h3>

                                                <div>

                                                    <div class="table-responsive">          
                                                        <table class="table">
                                                           
                                                            <tbody>
                                                                <tr>
                                                                    <td><h5> Academico   <label><input type="checkbox" name="academico"></label> </h5></td>
                                                                    <td><h5>Emocional  <label><input type="checkbox" name="emocional"></label> </h5></td>
                                                                    <td><h5>Afectivo   <label><input type="checkbox" name="afectivo"></label></h5></td>
                                                                    <td><h5>Social  <label><input type="checkbox" name="social"></label></h5></td>
                                                                                                                                     
                                                                </tr>
                                                                <tr>
                                                                     <td><h5>Duelo  <label><input type="checkbox" value="duelo" name="motivo"></label></h5></td>  
                                                                    <td><h5>Depresión  <label><input type="checkbox" value="depresion" name="motivo"></label></h5></td>
                                                                    <td><h5>Ansiedad  <label><input type="checkbox" value="ansiedad" name="motivo"></label></h5></td>
                                                                    <td><h5>O. Vocacional  <label><input type="checkbox" value="o_vocacional" name="motivo"></label></h5></td>
                                                                   
                                                                </tr>
                                                                <tr>
                                                                    <td><h5>O. Sexual  <label><input type="checkbox"  value="o_sexual" name="motivo"></label></h5></td>
                                                                    <td><h5>Relaciones Interpersonales  <label><input type="checkbox" value="relaciones_inter" name="motivo"></label></h5></td>
                                                                    <td><h5>Relacion de Pareja  <label><input type="checkbox" value="relacion_pareja" name="motivo"></label></h5></td>
                                                                                                                                       
                                                                </tr>
                                                                <tr>
                                                                    <td><h5>Consumo de SPA  <label><input type="checkbox" value="consumo_spa" name="motivo"></label></h5></td>
                                                                    <td><h5>Problemas Aprendizaje  <label><input type="checkbox" value="problemas_aprendiaje" name="motivo"></label></h5></td>
                                                                    <td><h5>Otro  <label><input type="checkbox" value="otro" name="motivo"></label></h5></td> 
                                                                </tr>
                                                                
                                                            </tbody>
                                                        </table>


                                                    </div>


                                                </div>
                                            </div>
                                        </div>
                                            <div class="tab-pane" id="2a">
                                                <div class="panel-body">                                  
                                                    <div class="panel-heading">                                        
                                                        <h4> Tipologia Familiar </h4>
                                                    </div>
                                                    <div class="panel-body">
                                                        <textarea rows="5" cols="100" id="genograma" name="genograma"></textarea>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="tab-pane" id="3a">
                                                <div class="panel-body">                                  
                                                    <div class="panel-heading">                                        
                                                        <h4> HISTORIA FAMILIAR </h4>
                                                    </div>
                                                    <div class="panel-body">
                                                        <textarea rows="5" cols="100" id="historiaf" name="historiaf"></textarea>
                                                    </div>
                                                    <div class="panel-heading">                                        
                                                        <h4>PROBLEMÁTICA ACTUAL </h4>
                                                    </div>
                                                    <div class="panel-body">
                                                        <textarea rows="5" cols="100" id="problematica" name="problematica"></textarea>
                                                    </div>
                                                    <div class="panel-heading">                                        
                                                        <h4>DIAGNOSTICO </h4>
                                                    </div>
                                                    <div class="panel-body">
                                                        <textarea rows="5" cols="100" id="diagnostico" name="diagnostico"></textarea>
                                                    </div>


                                                </div>
                                            </div>
                                            <div class="tab-pane" id="4a">
                                                <div class="panel-heading">                                        
                                                    <h4> PROCESO PSICOTERAPEUTICO  </h4>
                                                </div>
                                                <div class="panel-body">
                                                    <textarea rows="5" cols="100" id="proceso" name="proceso"></textarea>
                                                </div>
                                                <div class="panel-heading">                                        
                                                    <h4>SEGUIMIENTO </h4>
                                                </div>
                                                <div class="panel-body">
                                                    <textarea rows="5" cols="100" id="seguimiento" name="seguimiento"></textarea>
                                                </div>
                                                <div class="clearfix">
                                                    <div class="col-md-4">
                                                        <label class="control-label"> </label>
                                                        <input class="btn btn-success btn-block" type="submit" value="GUARDAR">
                                                    </div>
                                                </div>                                    
                                            </div>

                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>                                                
                    </div>                    
                </div>
            </div>





        </div>
        <div class="col-md-1"> </div>
    </body>
</html>
