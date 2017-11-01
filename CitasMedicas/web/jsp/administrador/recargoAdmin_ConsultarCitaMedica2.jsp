<%-- 
    Document   : recargoAdmin_ConsultarCitaMedica2
    Created on : 27-mar-2017, 19:48:16
    Author     : Gladys M
--%>

<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="FACADE.FacadeHorarioMedico"%>
<%@page import="FACADE.FacadeUsuario"%>
<%@page import="DTO.UsuarioDTO"%>
<%@page import="jdk.nashorn.internal.runtime.ListAdapter"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DTO.CitaDTO"%>
<%@page import="FACADE.FacadeCita"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>


<div class="ibox float-e-margins">

    <%
        String ide = request.getParameter("identf");

        FacadeUsuario fac = new FacadeUsuario();
        UsuarioDTO u = fac.consultarUsuarioPorId(ide);
        
        FacadeHorarioMedico fhm = new FacadeHorarioMedico();
        String fechaActual = fhm.fechaActual();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        
        if (u != null) {

            FacadeCita cita = new FacadeCita();
            List<CitaDTO> lista = cita.consultarCitasUsuario(ide);

            if (!lista.isEmpty()) {

    %>

    <div class="panel panel-default">
        <div class="panel-heading">
            <p> Lista de citas programadas</p>

        </div>

        <div class="panel-body">
            <div class="table-responsive">
                <table class="table table-responsive table-hover table-bordered dataTable no-footer" id="sampleTable" role="grid" aria-describedby="sampleTable_info">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th class="sorting_asc" tabindex="0" aria-controls="sampleTable" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Name: activate to sort column descending">Nombre</th>
                            <th>Servicio</th>
                            <th>Fecha</th>
                            <th>Hora</th>
                            <th>Estado</th> 
                            <th>Modificar</th> 
                        </tr>
                    </thead>
                    <%                                for (int i = 0; i < lista.size(); i++) {
                            String id = lista.get(i).getId_usuario();
                            String nombre = lista.get(i).getNombre_usuario();
                            String servicio = lista.get(i).getServicio_cita();
                            String fecha = lista.get(i).getFecha_cita();
                            String hora = lista.get(i).getHora_cita();
                            String estado = lista.get(i).getEstado();
                            String id_medico = lista.get(i).getId_medico();
                            int idcita = lista.get(i).getId_cita();
                            int numero = i + 1;
                            String mod = "";
                            Date f1 = sdf.parse(fecha);
                            Date f2 = sdf.parse(fechaActual);
                            if(f1.after(f2)){
                                mod = "disabled";
                            }
                    %>
                    <tbody>                                       
                        <tr  role="row" class="odd">                                    
                            <td><%=numero%></td>
                            <td class="sorting_asc"><%=nombre%></td>
                            <td><%=servicio%></td>
                            <td><%=fecha%></td>
                            <td><%=hora%></td>
                            <td><%=estado%></td>    
                            <%
                                if (estado.equals("pendiente")) {
                            %>
                            <td><input type="submit" class="btn btn-default" <%=mod %> value="Modificar" onclick="cargarForm('administrador/recargoAdmin_ModificarCita.jsp?id=<%=idcita%>')"> </td>
                                <%
                                } else {
                                %>
                            <td></td>
                            <%
                                }

                            %>
                        </tr>                                                            
                    </tbody>    
                    <%                                }

                    %>
                </table>                                                        
            </div> 

        </div>   
        <%                          } else {
        %>
        <h3> No cuenta con citas programadas</h3>
        <%
            }
        } else {
        %>
        <h3> El Usuario No se encuentra en registrado.  <input type="button" class="btn btn-sm btn-success" value="REGISTRAR" onclick="cargarForm('administrador/recargoAdmin_RegistrarUsuario.jsp')"/></h3>
            <%
                }
            %>     

    </div> 
</div>
<script type="text/javascript" src="../js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="../js/dataTables.bootstrap.min.js"></script>
<script type="text/javascript">$('#sampleTable').DataTable();</script>

