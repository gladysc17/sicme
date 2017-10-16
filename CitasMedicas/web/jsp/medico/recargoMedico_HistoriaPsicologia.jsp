<%-- 
    Document   : recargoMedico_HistoriaPsicologia
    Created on : 05-abr-2017, 19:23:33
    Author     : Gladys M
--%>

<%@page import="DTO.CitaDTO"%>
<%@page import="FACADE.FacadeCita"%>
<%@page import="java.util.List"%>
<%@page import="FACADE.FacadeSesion"%>
<%@page import="DTO.SesionDTO"%>
<%@page import="DTO.HcPsicologiaDTO"%>
<%@page import="FACADE.FacadeHcPsicologia"%>
<%@page import="DTO.UsuarioDTO"%>
<%@page import="FACADE.FacadeUsuario"%>
<%@page import="DTO.MedicoDTO"%>
<%@page import="FACADE.FacadeMedico"%>
<%@page import="FACADE.FacadeHorarioMedico"%>
<%@page import="DTO.EstudianteDTO"%>
<%@page import="FACADE.FacadeEstudiante"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">        
    </head>
    <body>
        <%            
            FacadeHcPsicologia facadeHcPsicologia = new FacadeHcPsicologia();
            FacadeCita facadeCita = new FacadeCita();
            FacadeSesion facadeSesion = new FacadeSesion();
           
            String id = request.getParameter("id");
            int idcita = Integer.parseInt(request.getParameter("idcita"));
            
            CitaDTO citaDTO = facadeCita.consultarCitasId(idcita);
                                        
            System.out.println("id -> "+id);
            System.out.println("idCitaaaaa -> "+idcita);

            HcPsicologiaDTO hcPsicologia = facadeHcPsicologia.consultarHCPsicologiaAbierta(id);
            List<SesionDTO> sesiones = null;
            int numSesionActual = 1;
            String motivos[] = null;   
            String urlAction = "../controlador/procesarRegistroHistoriaPsicologia.jsp";
            if(hcPsicologia != null){
                urlAction = "../controlador/procesarRegistroSesionHCS.jsp";
                sesiones = facadeSesion.consultarSesionesPorHcPsicologia(hcPsicologia.getId_hcpsicologia());
                if(!sesiones.isEmpty()){
                    System.out.println("tamaño -> "+sesiones.size());
                    numSesionActual = sesiones.size() + 1;
                }
                motivos = hcPsicologia.getMotivoconsulta_hcpsico().split(",");
            }else{
                System.out.println("es null!!!");
            }
                   System.out.println("URL ACTION --> "+urlAction);                     
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
        <div class="col-md-1"> </div>
        <div class="col-md-10">            

            <div class="row animated fadeInRight">
                <div class="col-md-12">

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
                    </table> 

                    <div class="panel">


                        <ul  class="nav nav-pills panel-heading">
                            <li><a  href="#1a" data-toggle="tab"> <h3> Datos Basicos| </h3></a>
                            </li>
                            <li><a href="#2a" data-toggle="tab"> <h3>Tipologia Familiar |</h3></a>
                            </li>
                            <li><a href="#3a" data-toggle="tab"> <h3>Anamnesis|</h3></a>
                            </li>
                            <li><a href="#4a" data-toggle="tab"><h3> Proceso/Seguimiento</h3></a>
                            </li>
                            <% if(hcPsicologia != null){ 
                                    if(!sesiones.isEmpty()){                                                                                   
                            %>
                                    <li><a href="#5a" data-toggle="tab"><h3> | Sesiones Anteriores</h3></a>
                                    </li>    
                            <%          
                                    }%>
                            
                            <li><a href="#6a" data-toggle="tab"><h3> | Sesión Actual</h3></a>
                            </li>
                            <%      
                                }
                            %>
                        </ul>
                        <form  action=<%=urlAction%> method="post"> 
                            <div class="tab-content">
                                <div class="tab-pane active" id="1a">
                                   
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

                                    <div class="panel-body">
                                        <h3> MOTIVO DE LA CONSULTA: </h3>                                                                                                      
                                        <div class="table-responsive">  
                                            <table class="table">
                                                <tbody>
                                            <%
                                                if(hcPsicologia == null){
                                            %>
                                            
                                                    <tr>
                                                        <td><h3> Academico   <label><input type="checkbox" name="academico"></label> </h3></td>
                                                        <td><h3>Emocional  <label><input type="checkbox" name="emocional"></label> </h3></td>
                                                        <td><h3>Afectivo   <label><input type="checkbox" name="afectivo"></label></h3></td>
                                                        <td><h3>Social  <label><input type="checkbox" name="social"></label></h3></td>
                                                        <td><h3>Duelo  <label><input type="checkbox" value="duelo" name="motivo"></label></h3></td> 

                                                    </tr>
                                                    <tr>

                                                        <td><h3>Depresión  <label><input type="checkbox" value="depresion" name="motivo"></label></h3></td>
                                                        <td><h3>Ansiedad  <label><input type="checkbox" value="ansiedad" name="motivo"></label></h3></td>
                                                        <td><h3>O. Vocacional  <label><input type="checkbox" value="o_vocacional" name="motivo"></label></h3></td>
                                                        <td><h3>O. Sexual  <label><input type="checkbox"  value="o_sexual" name="motivo"></label></h3></td>
                                                        <td><h3>Relaciones Interpersonales  <label><input type="checkbox" value="relaciones_inter" name="motivo"></label></h3></td>                                                                    
                                                    </tr>
                                                    <tr>                                                                    
                                                        <td><h3>Relacion de Pareja  <label><input type="checkbox" value="relacion_pareja" name="motivo"></label></h3></td>
                                                        <td><h3>Consumo de SPA  <label><input type="checkbox" value="consumo_spa" name="motivo"></label></h3></td>
                                                        <td><h3>Problemas Aprendizaje  <label><input type="checkbox" value="problemas_aprendiaje" name="motivo"></label></h3></td>
                                                        <td><h3>Otro  <label><input type="checkbox" value="otro" name="motivo"></label></h3></td> 
                                                    </tr>                                                              

                                                
                                            <%
                                                }else{
                                                    for(int i=0; i < motivos.length; i++){
                                            %>
                                                    
                                                        <li><%=motivos[i]%></li>
                                                    
                                            <%
                                                    }
                                                }
                                            %>
                                            </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                                <div class="tab-pane" id="2a">
                                    <div class="panel-body">                                  
                                        <h4> Tipologia Familiar </h4>
                                        <%
                                            if(hcPsicologia == null){
                                        %>
                                        <textarea rows="5" cols="100" id="genograma" name="genograma"></textarea>
                                        <%
                                            }else{
                                        %>
                                        <%=hcPsicologia.getHistoriafamiliar_hcpsico()%>
                                        <%
                                            }
                                        %>
                                    </div>
                                </div>
                                <div class="tab-pane" id="3a">
                                    <div class="panel-body">                                  

                                        <h4> HISTORIA FAMILIAR </h4>

                                        <%
                                            if(hcPsicologia == null){
                                        %>
                                        <textarea rows="5" cols="100" id="historiaf" name="historiaf"></textarea>
                                        <%
                                            }else{
                                        %>
                                        <%=hcPsicologia.getHistoriafamiliar_hcpsico()%><br><br>
                                        <%
                                            }
                                        %>


                                        <h4>PROBLEMÁTICA ACTUAL </h4>

                                        <%
                                            if(hcPsicologia == null){
                                        %>
                                        <textarea rows="5" cols="100" id="problematica" name="problematica"></textarea>
                                        <%
                                            }else{
                                        %>
                                        <%=hcPsicologia.getProblematicaactual_hcpsico()%><br><br>
                                        <%
                                            }
                                        %>

                                        <h4>DIAGNOSTICO </h4>

                                        <%
                                            if(hcPsicologia == null){
                                        %>
                                        <textarea rows="5" cols="100" id="diagnostico" name="diagnostico"></textarea>
                                        <%
                                            }else{
                                        %>
                                        <%=hcPsicologia.getDiagnostico_hcpsico()%><br><br>
                                        <%
                                            }
                                        %>



                                    </div>
                                </div>
                                <div class="tab-pane" id="4a">
                                    <div class="panel-body">   
                                        <h4> PROCESO PSICOTERAPEUTICO  </h4>

                                        <%
                                            if(hcPsicologia == null){
                                        %>
                                        <textarea rows="5" cols="100" id="proceso" name="proceso"></textarea>
                                        <%
                                            }else{
                                        %>
                                        <%=hcPsicologia.getProcesopsicoterapeutico_hcpsico()%><br><br>
                                        <%
                                            }
                                        %>

                                        <h4>SEGUIMIENTO </h4>

                                        <%
                                            if(hcPsicologia == null){
                                        %>
                                        <textarea rows="5" cols="100" id="seguimiento" name="seguimiento"></textarea>
                                        <%
                                            }else{
                                        %>
                                        <%=hcPsicologia.getSeguimiento_hcpsico()%><br><br>
                                        <%
                                            }
                                        %>

                                        <% if(hcPsicologia == null){ %>
                                        <h3>Sesión adicional : 
                                            <select name="sesion" id="sesion" required>
                                                <option value="si"> SI </option>
                                                <option value="no"> NO </option>
                                            </select>
                                        </h3> 
                                        <div class="clearfix">
                                            <div class="col-md-4">
                                                <label class="control-label"> </label>
                                                <input class="btn btn-success btn-block" type="submit" value="GUARDAR">
                                            </div>
                                        </div>
                                        <% } %>
                                    </div>

                                </div>
                                    
                            <% if(hcPsicologia != null){ 
                                    if(!sesiones.isEmpty()){%>
                                    <div class="tab-pane" id="5a">
                                        <div class="panel-body">
                                <%
                                        for(SesionDTO sesion : sesiones){                                           
                            %>    
                                    
                                        <h4> SESIÓN N°: <%=sesion.getNumSesion()%>  </h4>
                                        <h4> DIAGNÓSTICO  </h4>
                                        
                                        <%=sesion.getDiagnostico()%> <br><br>      
                                        
                            <%
                                }%>
                                </div>

                                </div>
                                <%}}
                            
                            %>            

                                <div class="tab-pane" id="6a">
                                    <div class="panel-body">   
                                        <h4> SESIÓN N°: <%=numSesionActual%>  </h4><br>
                                        <h4> DIAGNÓSTICO  </h4>
                                        
                                        <textarea rows="5" cols="100" id="diagnosticoSesion" name="diagnosticoSesion"></textarea>                                      

                                        <%if(numSesionActual < 5){%>
                                            <h3>Sesión adicional : 
                                                <select name="sesionAdicionalSesion" id="sesionAdicionalSesion" required>
                                                    <option value="si"> SI </option>
                                                    <option value="no"> NO </option>
                                                </select>
                                            </h3> 
                                        <%}else{%>
                                            <input type="hidden" name="sesionAdicionalSesion" value="no"/>
                                        <%}%>
                                        
                                        <input type="hidden" name="horaSesion" value="<%=citaDTO.getHora_cita()%>"/>
                                        <input type="hidden" name="fechaSesion" value="<%=citaDTO.getFecha_cita()%>"/>
                                        <input type="hidden" name="idCitaSesion" value="<%=citaDTO.getId_cita()%>"/>
                                        <%if(hcPsicologia != null){%>
                                        <input type="hidden" name="idHcPsicologiaSesion" value="<%=hcPsicologia.getId_hcpsicologia()%>"/>
                                        <%}%>
                                        <input type="hidden" name="numSesion" value="<%=numSesionActual%>"/>                                      
                                        <input type="hidden" name="idUsuarioSesion" value="<%=citaDTO.getId_usuario()%>"/>
                                        
                                        <div class="clearfix">
                                            <div class="col-md-4">                                                
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

        <div class="col-md-1"> </div>
    </body>
</html>
