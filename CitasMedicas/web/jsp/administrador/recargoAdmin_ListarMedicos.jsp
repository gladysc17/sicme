<%-- 
    Document   : recargoAdmin_ListarMedicos
    Created on : 29/05/2017, 09:38:35 AM
    Author     : LEGADO
--%>

<%@page import="FACADE.FacadeHorario"%>
<%@page import="DTO.HorarioDTO"%>
<%@page import="DTO.HorarioMedicoDTO"%>
<%@page import="java.util.List"%>
<%@page import="FACADE.FacadeHorarioMedico"%>
<%@page import="java.util.ArrayList"%>
<%@page import="FACADE.FacadeMedico"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class="ibox float-e-margins">                         
    <div class="panel panel-default">
        <div class="panel-heading">                                        
            <h4 align="center"> LISTA DE MEDICOS REGISTRADOS EN EL SISTEMA</h4>
        </div>

        <div class="panel-body">
            <div class="table-responsive">
                <table class="table table-responsive table-hover table-bordered dataTable" id="sampleTable" role="grid" aria-describedby="sampleTable_info">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th class="sorting_asc" tabindex="0" aria-controls="sampleTable" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Name: activate to sort column descending" style="width: 158px;">Nombre</th>
                            <th>Codigo</th>
                            <th>Identificacion</th>
                            <th>Servicio</th>
                            <th>Asignar</th>
                            <th>Citas</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            FacadeMedico medicos = new FacadeMedico();

                            ArrayList<String[]> lis = medicos.listadoMedico();

                            for (int i = 0; i < lis.size(); i++) {
                                String[] aux = lis.get(i);
                                String nombre = aux[0];
                                String identf = aux[1];
                                String codigo = aux[2];
                                String servicio = aux[3];
                                int cantidad = i + 1;

                        %>

                        <tr role="row" class="odd">
                            <td><%=cantidad%></td>
                            <td class="sorting_asc" style="height: 5px"><%=nombre%></td>
                            <td><%=codigo%></td>
                            <td><%=identf%></td>
                            <td><%=servicio%></td>
                            <td><input type="submit" class="btn btn-success" value="Asignar Horario" onclick="cargarForm('administrador/recargoAdmin_AsignarHorario.jsp?ident=<%=identf%>')"> </td>
                            <td><input type="submit" class="btn btn-primary" value="Consultar" onclick="cargarForm('administrador/recargoAdmin_ConsultarCitasMedico.jsp?ident=<%=identf%>')"> </td>
                        </tr> 
                        <%
                            }
                        %>  
                    </tbody>                               
                </table>
            </div>                                                   
        </div>
    </div>
    <div class="row panel">
        <div class="panel panel-default">
            <%
                FacadeHorarioMedico fhm = new FacadeHorarioMedico();
                FacadeHorario fh = new FacadeHorario();
                for (int i = 0; i < lis.size(); i++) {
                    String[] aux = lis.get(i);
                    String nombre = aux[0];
                    String identf = aux[1];
                    String codigo = aux[2];
                    String servicio = aux[3];
            %>
            <div class="col-md-6">
            <h4><%=nombre%></h4>
            <div>
                <table style="width: 100%; border: 1px solid #000;">
                    <thead>
                        <tr>
                            <th style="width: 25%"></th>
                            <th style="width: 25%">Hora</th>
                            <th style="width: 25%">Estado</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            List<HorarioMedicoDTO> li = fhm.listarHorasMedico(identf);
                            for (HorarioMedicoDTO x : li) {
                                HorarioDTO ho = new HorarioDTO();
                                ho = fh.listadoMedicosHora(x.getId_horario_horariomedico());
                        %>
                        <tr>
                            <td style="width: 25%"><%=x.getFecha()%></td>
                            <td style="width: 25%"><%=ho.getHora_inicio()%> - <%=ho.getHora_final()%></td>
                            <td style="width: 25%"><%=x.getEstado_horariomedico()%></td>
                        </tr>
                        <%
                            }
                        %>
                    </tbody>
                </table>
            </div>
                    </div>
            <%
                }
            %>
            
        </div>
    </div>
</div>


<script type="text/javascript" src="../js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="../js/dataTables.bootstrap.min.js"></script>
<script type="text/javascript">$('#sampleTable').DataTable();</script>
