<%-- 
    Document   : recargoMedico_historiaMedicina
    Created on : 04-abr-2017, 18:52:15
    Author     : Gladys M
--%>

<%@page import="DTO.UsuarioDTO"%>
<%@page import="FACADE.FacadeUsuario"%>
<%@page import="FACADE.FacadeMedico"%>
<%@page import="DTO.MedicoDTO"%>
<%@page import="FACADE.FacadeEstudiante"%>
<%@page import="DTO.EstudianteDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class="ibox float-e-margins">  
    <div class="panel panel-default">
        <table border="2px" width="100%">                                 
            <tr>                                    
                <td rowspan="2" style="width: 20px">
                    <img src="../img/logo_ufps1.png" alt=""  width="100" height="100"/>                            
                </td>
                <td rowspan="2" align="center" height="100">
                    <p>HISTORIA CLINICA</p>                                   
                    <p>DIVISION DE SERVICIOS ASISTENCIALES Y DE SALUD</p>
                    <p>UNIDAD DE SERVICIOS ASISTENCIALES Y DE SALUD</p>
                </td>
                <td>Fecha: 04/04/2017</td>                                    
            </tr>
            <tr>
                <td>Hora: 22:00</td>                                                                         
            </tr>                                
        </table> 
        <ul  class="nav nav-pills">
            <li><a  href="#1a" data-toggle="tab"> <h3>| Datos Basicos | </h3></a>
            </li>
            <li><a href="#2a" data-toggle="tab"> <h3>Anamnesis |</h3></a>
            </li>
            <li><a href="#3a" data-toggle="tab"> <h3>Examen Físico |</h3></a>
            </li>
            <li><a href="#4a" data-toggle="tab"><h3> Tratamiento/Recomendaciones |</h3></a>
            </li>
            <li><a href="#5a" data-toggle="tab"><h3 align="center"> Fórmula Médica  |</h3></a>
            </li>
        </ul>
        <form  action="../controlador/procesarRegistroHistoriaMedicina.jsp" method="post"> 
            <div class="tab-content">
                <div class="tab-pane active" id="1a">
                    <div class="panel-body">  
                        <%

                            String id = request.getParameter("id");
                            int idcita = Integer.parseInt(request.getParameter("idcita"));
                            System.out.println("id " + id + "idcita " + idcita);

                            FacadeUsuario facUsu = new FacadeUsuario();
                            UsuarioDTO u = facUsu.consultarUsuarioPorId(id);

                            String nombre = u.getNombre();
                            String codigo = u.getCodigo();
                            String correo = u.getCorreo();
                            String fechadeNac = u.getFecha_nacimiento();
                            int edad = u.getEdad();
                            String genero = u.getGenero();
                            String estadoCivil = u.getEstado_civil();
                            String direccion = u.getDireccion();
                            String telefono = u.getTelefono();


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

                        <table class="table table-responsive">
                            <tbody>
                                <tr>
                                    <td>Motivo de la Consulta: <br> <textarea rows="2" cols="100" id="motivo" name="motivo" required></textarea></td>                                                                                 
                                </tr>
                                <tr>
                                    <td>Enfermedad General: <br> <textarea rows="2" cols="100" id="enfermedad" name="enfermedad" required></textarea></td>                                                                                 
                                </tr>
                                <tr>
                                    <td>Revision por sistemas: <br> <textarea rows="2" cols="100" id="revision" name="revision" required></textarea></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="tab-pane" id="2a">
                    <div class="panel-body">                                  
                        <table class="table table-responsive">
                            <tbody>                                        
                                <tr>
                                    <td> <h3> Antecedentes Personales </h3>
                                        <table class="table table-responsive">                                                    
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
                                </tr>
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
                                    <td>F. Cardiaca: <input id="frecCardiaca" name="frecCardiaca" type="text"> </td> 
                                    <td>F. Respiratoria: <input id="frecResp" name="frecResp" type="text"> </td>
                                    <td>Tensión Arterial: <input id="tension" name="tension" type="text"> </td> 

                                </tr>
                                <tr>                                            
                                    <td>Temp: <input id="temperatura" name="temperatura" type="text"> </td>
                                    <td>Peso:  <input id="peso" name="peso" type="text"> </td> 
                                    <td>Talla: <input id="talla" name="talla" type="text"> </td>
                                </tr>                                        
                            </tbody>                                    
                        </table> <br>

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
                    <div class="panel-body">
                        <div class="panel">                                        
                            <h4> PLAN DE TRATAMIENTO </h4>
                            <textarea rows="5" cols="100" id="tratamiento" name="tratamiento"></textarea>
                        </div>
                        <div class="panel">                                        
                            <h4>RECOMENDACIONES </h4>                         
                            <textarea rows="5" cols="100" id="recomendaciones" name="recomendaciones"></textarea>
                        </div> 
                    </div>
                </div>
                <div class="tab-pane" id="5a">
                    <div class="panel-body">
                        <textarea rows="10" cols="100" id="formula" name="formula"></textarea>
                    </div>   
                    <div class="clearfix">
                        <div class="col-md-4 panel-body">                                    
                            <input class="btn btn-success btn-block" type="submit" value="GUARDAR" >
                        </div>
                    </div>  
                </div>

            </div>
        </form>
    </div>

</div>                    
<script type="text/javascript" src="../js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="../js/dataTables.bootstrap.min.js"></script>
<script type="text/javascript">$('#sampleTable').DataTable();</script>