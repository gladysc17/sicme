<%-- 
    Document   : recargoAdmin_ConsultarHistoriaClinica2
    Created on : 30-abr-2017, 22:06:57
    Author     : Gladys M
--%>

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

                <%        } else if (servicio.equals("medicinageneral")) {

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
                <%        } else if (servicio.equals("psicologia")) {

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
                            <%        } else if (servicio.equals("odontologia")) {

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
                            <%        } else if (servicio.equals("planificacion")) {

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
                                }
                            %>

                        </tbody>    
                    </table>                                                        
                </div> 
            </form>
        </div> 
    </div>
</div>
