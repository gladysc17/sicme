<%-- 
    Document   : recargoAdmin_ConsultarHistoriaClinica2
    Created on : 30-abr-2017, 22:06:57
    Author     : Gladys M
--%>

<%@page import="DTO.SesionDTO"%>
<%@page import="FACADE.FacadeSesion"%>
<%@page import="DTO.Hc_planificacionfamiliarDTO"%>
<%@page import="FACADE.FacadeHcPlanificacionFamiliar"%>
<%@page import="DTO.HcOdontologiaDTO"%>
<%@page import="FACADE.FacadeHcOdontologia"%>
<%@page import="DTO.UsuarioDTO"%>
<%@page import="FACADE.FacadeUsuario"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.sun.javafx.scene.control.skin.VirtualFlow.ArrayLinkedList"%>
<%@page import="DTO.HcPsicologiaDTO"%>
<%@page import="FACADE.FacadeHcPsicologia"%>
<%@page import="java.util.List"%>
<%@page import="DTO.CitaDTO"%>
<%@page import="FACADE.FacadeCita"%>
<%@page import="DTO.HcMedicinaGeneralDTO"%>
<%@page import="FACADE.FacadeHcMedicinaGeneral"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class="ibox float-e-margins">            
    <div class="panel panel-default">
        <div class="panel-heading">
            <h2 align="center">  Lista de Historia Clinica </h2>
        </div>                        
        <div class="panel-body">
            <%
                int id = Integer.parseInt(request.getParameter("identf"));
                String ide = request.getParameter("identf");
                String servicio = request.getParameter("servicio");
                FacadeUsuario faca = new FacadeUsuario();

                UsuarioDTO u = faca.consultarUsuarioPorId(ide);

                if (u == null) {

            %>

            <h2>Usuario No encontrado </h2>

            <form  action="/CitasMedicas/historia" method="post" target="_blank">

                <%        } else if (servicio.equals("1")) {

                    FacadeHcMedicinaGeneral fac = new FacadeHcMedicinaGeneral();
                    List<HcMedicinaGeneralDTO> hc = fac.consultarHCMedicinaGeneral(id);
                    if (hc.isEmpty()) {

                %>
                <h2> No cuenta con Historia clinica para este servicio </h2>

                <%  } else { %>

                <div class="table-responsive">
                    <table class="table table-responsive table-hover table-bordered dataTable no-footer" id="sampleTable" role="grid" aria-describedby="sampleTable_info">
                        <thead>
                            <tr>
                                <th class="sorting_asc" tabindex="0" aria-controls="sampleTable" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Name: activate to sort column descending">Nombre</th>
                                <th>Servicio</th>
                                <th>Fecha</th>
                                <th>Hora</th>
                                <th>Ver Historia Clinca</th> 
                            </tr>
                        </thead> 

                        <tbody>      
                            <%
                                for (int i = 0; i < hc.size(); i++) {

                                    FacadeCita fc = new FacadeCita();
                                    int idcita = hc.get(i).getIdcita_hcmed();
                                    CitaDTO ci = fc.consultarCitasId(idcita);

                                    String nombre = ci.getNombre_usuario();
                                    String fecha = ci.getFecha_cita();
                                    String hora = ci.getHora_cita();

                            %>

                            <tr  role="row" class="odd">                                     
                                <td class="sorting_asc"><%=nombre%></td>
                                <td><%=servicio%></td>
                                <td><%=fecha%></td>
                                <td><%=hora%></td>  
                                <td> <button type="submit" name="idcita" id="idcita" value="<%=idcita%>" target="_blank"> Ver</button>  </td> 
                            </tr> 
                            <%
                                    }
                                }

                            %>

                        </tbody>    
                    </table>                                                        
                </div> 
                <%        } else if (servicio.equals("2")) {
                    FacadeHcOdontologia fac = new FacadeHcOdontologia();
                    List<HcOdontologiaDTO> hc = fac.consultarHcOdontologia(id);
                    if (hc.isEmpty()) {

                %>
                <h2> No cuenta con Historia clinica para este servicio </h2>

                <%  } else { %>

                <div class="table-responsive">
                    <table class="table table-responsive table-hover table-bordered dataTable no-footer" id="sampleTable" role="grid" aria-describedby="sampleTable_info">
                        <thead>
                            <tr>
                                <th class="sorting_asc" tabindex="0" aria-controls="sampleTable" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Name: activate to sort column descending">Nombre</th>
                                <th>Servicio</th>
                                <th>Fecha</th>
                                <th>Hora</th>
                                <th>Ver Historia Clinca</th> 
                            </tr>
                        </thead> 

                        <tbody>      
                            <%
                                for (int i = 0; i < hc.size(); i++) {

                                    FacadeCita fc = new FacadeCita();
                                    int idcita = hc.get(i).getId_cita();
                                    CitaDTO ci = fc.consultarCitasId(idcita);

                                    String nombre = ci.getNombre_usuario();
                                    String fecha = ci.getFecha_cita();
                                    String hora = ci.getHora_cita();

                                    System.out.println("idcitaderecargo: " + idcita);
                            %>

                            <tr  role="row" class="odd">                                     
                                <td class="sorting_asc"><%=nombre%></td>
                                <td><%=servicio%></td>
                                <td><%=fecha%></td>
                                <td><%=hora%></td>  
                                <td> <button type="submit" name="idcita" id="idcita" value="<%=idcita%>" target="_blank"> Ver</button>  </td> 
                            </tr> 
                            <%
                                    }
                                }

                            %>

                        </tbody>    
                    </table>                                                        
                </div> 
                <%        } else if (servicio.equals("3")) {

                    FacadeHcPlanificacionFamiliar fac = new FacadeHcPlanificacionFamiliar();
                    List<Hc_planificacionfamiliarDTO> hc = fac.consultarHcPlanificacion(id);
                    if (hc.isEmpty()) {

                %>
                <h2> No cuenta con Historia clinica para este servicio </h2>

                <%  } else { %>

                <div class="table-responsive">
                    <table class="table table-responsive table-hover table-bordered dataTable no-footer" id="sampleTable" role="grid" aria-describedby="sampleTable_info">
                        <thead>
                            <tr>
                                <th class="sorting_asc" tabindex="0" aria-controls="sampleTable" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Name: activate to sort column descending">Nombre</th>
                                <th>Servicio</th>
                                <th>Fecha</th>
                                <th>Hora</th>
                                <th>Ver Historia Clinca</th>                                 
                            </tr>
                        </thead> 

                        <tbody>      
                            <%
                                for (int i = 0; i < hc.size(); i++) {

                                    FacadeCita fc = new FacadeCita();
                                    int idcita = hc.get(i).getId_cita();
                                    CitaDTO ci = fc.consultarCitasId(idcita);

                                    String nombre = ci.getNombre_usuario();
                                    String fecha = ci.getFecha_cita();
                                    String hora = ci.getHora_cita();
                            %>

                            <tr  role="row" class="odd">                                     
                                <td class="sorting_asc"><%=nombre%></td>
                                <td><%=servicio%></td>
                                <td><%=fecha%></td>
                                <td><%=hora%></td>  
                                <td> <button type="submit" name="idcita" id="idcita" value="<%=idcita%>" target="_blank"> Ver</button>  </td> 
                            </tr> 
                            <%
                                    }
                                }

                            %>

                        </tbody>    
                    </table>                                                        
                </div> 
                <%        } else if (servicio.equals("4")) {

                    FacadeHcPsicologia fac = new FacadeHcPsicologia();
                    List<HcPsicologiaDTO> hc = fac.consultarHCPsicologia(id);
                    if (hc.isEmpty()) {

                %>
                <h2> No cuenta con Historia clinica para este servicio </h2>

                <%  } else { %>

                <div class="table-responsive">
                    <table class="table table-responsive table-hover table-bordered dataTable no-footer" id="sampleTable" role="grid" aria-describedby="sampleTable_info">
                        <thead>
                            <tr>
                                <th class="sorting_asc" tabindex="0" aria-controls="sampleTable" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Name: activate to sort column descending">Nombre</th>
                                <th>Servicio</th>
                                <th>Fecha</th>
                                <th>Hora</th>
                                <th>Ver Historia Clinca</th> 
                                <th>Ver Sesion</th> 
                            </tr>
                        </thead> 

                        <tbody>      
                            <%
                                for (int i = 0; i < hc.size(); i++) {

                                    FacadeCita fc = new FacadeCita();
                                    int idcita = hc.get(i).getIdcita_hcpsico();
                                    CitaDTO ci = fc.consultarCitasId(idcita);

                                    String nombre = ci.getNombre_usuario();
                                    String fecha = ci.getFecha_cita();
                                    String hora = ci.getHora_cita();


                            %>

                            <tr  role="row" class="odd">                                     
                                <td class="sorting_asc"><%=nombre%></td>
                                <td><%=servicio%></td>
                                <td><%=fecha%></td>
                                <td><%=hora%></td>  
                                <td> <button type="submit" name="idcita" id="idcita" value="<%=idcita%>" target="_blank"> Ver</button>  </td> 
                                <td> 
                                <%

                                    int hisP = hc.get(i).getId_hcpsicologia();
                                    FacadeSesion facSe = new FacadeSesion();
                                    List<SesionDTO> listaSes = facSe.consultarSesionesPorHcPsicologia(hisP);
                                    for (int j = 0; j < listaSes.size(); j++) {
                                        int idSesion = listaSes.get(j).getId();
                                        int num = listaSes.get(j).getNumSesion();                                        
                                        System.out.println("num " +num);
                                %>
                                 <a href="/CitasMedicas/sesionPsicologia?idsesion=<%=idSesion%>" target="_blank"> Ver N°:<%=num%></a>  --
                                 
                             
                            <%  }
                            %>
                                </td>
                            </tr>
                                 <%
                                        }
                                    }
                                }
                            %>
                            
                        </tbody>    
                    </table>                                                        
                </div> 
            </form>
        </div> 
    </div>
</div>
