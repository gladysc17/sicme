<%-- 
    Document   : recargoMedico_historiaMedicina
    Created on : 04-abr-2017, 18:52:15
    Author     : Gladys M
--%>

<%@page import="FACADE.FacadeProfesional"%>
<%@page import="DTO.ProfesionalDTO"%>
<%@page import="FACADE.FacadeMedico"%>
<%@page import="DTO.MedicoDTO"%>
<%@page import="FACADE.FacadeServicioGeneral"%>
<%@page import="DTO.ServicioGeneralDTO"%>
<%@page import="DTO.OtroUsuarioDTO"%>
<%@page import="FACADE.FacadeOtrosUsuarios"%>
<%@page import="DTO.DocenteDTO"%>
<%@page import="FACADE.FacadeDocente"%>
<%@page import="FACADE.FacadeEstudiante"%>
<%@page import="DTO.EstudianteDTO"%>
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
                                <td rowspan="2" align="center" height="100"><p>HISTORIA CLINICA</p>                                   
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
                                    <li><a href="#2a" data-toggle="tab"> <h3>Anamnesis|</h3></a>
                                    </li>
                                    <li><a href="#3a" data-toggle="tab"> <h3>Examen Físico|</h3></a>
                                    </li>
                                    <li><a href="#4a" data-toggle="tab"><h3> Tratamiento/Recomendaciones</h3></a>
                                    </li>
                                    <li><a href="#5a" data-toggle="tab"><h3 align="center"> Fórmula Médica</h3></a>
                                    </li>
                                </ul>
                                <form  action="../controlador/procesarRegistroHistoriaMedicina.jsp" method="post"> 
                                    <div class="tab-content">

                                        <div class="tab-pane active" id="1a">
                                            <div class="panel-body">  
                                                <%
                                                
                                                int idusuario_hcmed = Integer.parseInt(request.getParameter("id"));                                                
                                                int idcita = Integer.parseInt(request.getParameter("idcita"));  
                                                String tipo = request.getParameter("tipo");
                                                
                                                if(tipo.equals("estudiante")){
                                                    FacadeEstudiante facEst = new FacadeEstudiante();                                                            
                                                    EstudianteDTO est = facEst.consultarEstudianteporId(idusuario_hcmed);
                                                    
                                                    int id = est.getIdentificacion();
                                                    String nombre = est.getNombre();
                                                    int codigo  = est.getCodigo();
                                                    String correo  = est.getCorreo();
                                                    String fechadeNac = est.getFechanacimiento();
                                                    int edad = est.getEdad();
                                                    String genero = est.getGenero();
                                                    String estadoCivil  = est.getEstadocivil();
                                                    String direccion = est.getDireccion();
                                                    String telefono  = est.getTelefono();
                                                    
                                                                                                        
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
                                                        
                                                        String nombre = pro.getNombre();
                                                        int id = pro.getIdentificacion();
                                                        int codigo = pro.getCodigo();
                                                        String correo = pro.getCorreo();
                                                        String fechadeNac = pro.getCorreo();
                                                        int edad = pro.getCodigo();
                                                        String genero = pro.getNombre();
                                                        String estadoCivil = pro.getCorreo();
                                                        String direccion = pro.getCorreo();
                                                        String telefono = pro.getTelefono();

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
                                                    }  else if (tipo.equals("medico")) {
                                                        FacadeMedico facmed = new FacadeMedico();
                                                        MedicoDTO med = facmed.consultarMedicoPorId(idusuario_hcmed);
                                                        
                                                        String nombre = med.getNombre();
                                                        int id = med.getIdentificacion();
                                                        int codigo = med.getCodigo();
                                                        String correo = med.getCorreo();
                                                        String fechadeNac = med.getFechanacimiento();
                                                        int edad = med.getEdad();
                                                        String genero = med.getGenero();
                                                        String estadoCivil = med.getEstadocivil();
                                                        String direccion = med.getDireccion();
                                                        String telefono = med.getTelefono();

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
                                                        
                                                        String nombre = ser.getNombre();
                                                        int id = ser.getIdentificacion();
                                                        int codigo = ser.getCodigo();
                                                        String correo = ser.getCorreo();
                                                        String fechadeNac = ser.getFechanacimiento();
                                                        int edad = ser.getEdad();
                                                        String genero = ser.getGenero();
                                                        String estadoCivil = ser.getEstadocivil();
                                                        String direccion = ser.getDireccion();
                                                        String telefono = ser.getTelefono();

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
                                                    }  else if (tipo.equals("docente")) {
                                                        FacadeDocente facdoc = new FacadeDocente();
                                                        DocenteDTO doc = facdoc.consultarDocenteporId(idusuario_hcmed);
                                                        
                                                        String nombre = doc.getNombre();
                                                        int id = doc.getIdentificacion();
                                                        int codigo = doc.getCodigo();
                                                        String correo = doc.getCorreo();
                                                        String fechadeNac = doc.getFechanacimiento();
                                                        int edad = doc.getEdad();
                                                        String genero = doc.getGenero();
                                                        String estadoCivil = doc.getEstadocivil();
                                                        String direccion = doc.getDireccion();
                                                        String telefono = doc.getTelefono();

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
                                                        
                                                        String nombre = otro.getNombre();
                                                        int id = otro.getIdentificacion();
                                                        int codigo = otro.getCodigo();
                                                        String correo = otro.getCorreo();
                                                        String fechadeNac = otro.getFechanacimiento();
                                                        int edad = otro.getEdad();
                                                        String genero = otro.getGenero();
                                                        String estadoCivil = otro.getEstadocivil();
                                                        String direccion = otro.getDireccion();
                                                        String telefono = otro.getTelefono();

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
                                        </div>
                                        <div class="tab-pane" id="2a">
                                            <div class="panel-body">                                  
                                                <table class="table table-responsive">
                                                    <tbody>
                                                        <tr>
                                                            <td>Motivo de la Consulta: <br> <textarea rows="2" cols="100" id="motivo" name="motivo"></textarea></td>                                                                                 
                                                        </tr>
                                                        <tr>
                                                            <td>Enfermedad General: <br> <textarea rows="2" cols="100" id="enfermedad" name="enfermedad"></textarea></td>                                                                                 
                                                        </tr>
                                                        <tr>
                                                            <td>Revision por sistemas: <br> <textarea rows="2" cols="100" id="revision" name="revision"></textarea></td>
                                                        </tr>
                                                        <tr>
                                                            <td> <h3> Antecedentes Personales </h3>
                                                                <table class="table">                                                    
                                                                    <tbody>
                                                                        <tr>
                                                                            <td>Patológicos: <textarea rows="3" cols="50" id="patologicos" name="patologicos"></textarea> </td>                                                                                                                                                                              
                                                                            <td>Quirúrgicos: <textarea rows="3" cols="50" id="quirurgicos" name="quirurgicos"> </textarea></td>                                                                                                           
                                                                        </tr> 
                                                                        <tr>
                                                                            <td>Traumáticos: <textarea rows="3" cols="50" id="traumaticos" name="traumaticos"></textarea> </td>
                                                                            <td>Toxico Alérgicos: <textarea rows="3" cols="50" id="toxico" name="toxico"></textarea> </td>                                                           
                                                                        </tr>
                                                                        <tr>
                                                                            <td>Farmacológicos:<textarea rows="3" cols="50" id="farmacologicos" name="farmacologicos"></textarea> </td>
                                                                            <td>Venéreos: <textarea rows="3" cols="50" id="venereos" name="venereos"></textarea> </td>                                                        
                                                                        </tr>
                                                                        <tr>
                                                                            <td>Otro: <textarea rows="3" cols="50" id="otro" name="otro"> </textarea></td> 
                                                                            <td>Ginecològicos: <textarea rows="3" cols="50" id="ginecologicos" name="ginecologicos"></textarea> </td>                                                           
                                                                        </tr>
                                                                    </tbody>
                                                                </table>
                                                            </td>   
                                                            <td>
                                                        <tr>                                                           
                                                            <td> <h3> Antecedentes Familiares: </h3><br> <textarea rows="5" cols="100" id="familiares" name="familiares"></textarea></td>
                                                        </tr>                                                                                                                                                                              

                                                    </tbody>
                                                </table>


                                            </div>
                                        </div>
                                        <div class="tab-pane" id="3a">
                                            <div class="panel-body">                                  
                                                <table class="table table-responsive">
                                                    <tbody>
                                                        <tr>
                                                            <td>F. Cardiaca: <input id="frecCardiaca" name="frecCardiaca"> </td> 
                                                            <td>F. Respiratoria: <input id="frecResp" name="frecResp" type="number"> </td>
                                                            <td>Tensión Arterial: <input id="tension" name="tension"> </td> 

                                                        </tr>
                                                        <tr>                                            
                                                            <td>Temp: <input id="temperatura" name="temperatura"> </td>
                                                            <td>Peso:  <input id="peso" name="peso"> </td> 
                                                            <td>Talla: <input id="talla" name="talla"> </td>
                                                        </tr>                                        
                                                    </tbody>                                    
                                                </table> <br><br>

                                                <table class="table table-responsive">
                                                    <tbody>
                                                        <tr>
                                                            <td>Estado General: <input id="eg" name="eg"> </td> 
                                                            <td>Cabeza/Cuello: <input id="cabcuello" name="cabcuello"> </td>                                                                                         
                                                        </tr>
                                                        <tr>                                            
                                                            <td>Cardio/Pulmonar: <input id="cardiop" name="cardiop"> </td>
                                                            <td>Abdomen: <input id="abdomen" name="abdomen"> </td>                                             
                                                        </tr>
                                                        <tr>                                            
                                                            <td>Genitourinario: <input id="genito" name="genito"> </td>
                                                            <td>Extermidades:  <input id="extre" name="extre"> </td>                                             
                                                        </tr>
                                                        <tr>                                            
                                                            <td>Piel/Faneras: <input id="piel" name="piel"> </td>
                                                            <td>Sistema Nervioso:  <input id="sistemanerv" name="sistemanerv"> </td>                                             
                                                        </tr>
                                                    </tbody>                                    
                                                </table> <br><br>

                                                <table class="table table-responsive">
                                                    <tbody>
                                                        <tr>
                                                            <td>Diagnóstico: 1. <input id="diag1" name="diag1"> </td> 
                                                            <td>Tipo de Diagnóstico: <input id="tdiag1" name="tdiag1">  </td>                                                                                         
                                                        </tr>
                                                        <tr>                                            
                                                            <td>Diagnóstico: 2. <input id="diag2" name="diag2" > </td>
                                                            <td>Tipo de Diagnóstico: <input id="tdiag2" name="tdiag2"> </td>                                             
                                                        </tr>
                                                        <tr>                                            
                                                            <td>Diagnóstico: 3. <input id="diag3" name="diag3"> </td>
                                                            <td>Tipo de Diagnóstico: <input id="tdiag3" name="tdiag3"> </td>                                             
                                                        </tr>
                                                    </tbody>                                    
                                                </table>


                                            </div>
                                        </div>
                                        <div class="tab-pane" id="4a">
                                            <div class="panel-heading">                                        
                                                <h4 align="center"> PLAN DE TRATAMIENTO </h4>
                                            </div>
                                            <div class="panel-body">
                                                <textarea rows="5" cols="100" id="tratamiento" name="tratamiento"></textarea>
                                            </div>
                                            <div class="panel-heading">                                        
                                                <h4 align="center">RECOMENDACIONES </h4>
                                            </div>
                                            <div class="panel-body">
                                                <textarea rows="5" cols="100" id="recomendaciones" name="recomendaciones"></textarea>
                                            </div>                                                                                                                          
                                        </div>
                                        <div class="tab-pane" id="5a">
                                            <div class="panel-body">
                                                <textarea rows="10" cols="100" id="formula" name="formula"></textarea>
                                            </div>   
                                                <div class="clearfix">
                                                <div class="col-md-4">
                                                    <label class="control-label"> </label>
                                                    <input class="btn btn-success btn-block" type="submit" value="GUARDAR">
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
