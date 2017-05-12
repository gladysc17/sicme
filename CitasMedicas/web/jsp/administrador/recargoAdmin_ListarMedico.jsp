<%-- 
    Document   : recargoAdmin_ListarMedico
    Created on : 23-mar-2017, 19:58:55
    Author     : Gladys M
--%>

<%@page import="DTO.MedicoDTO"%>
<%@page import="java.util.List"%>
<%@page import="FACADE.FacadeMedico"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="col-md-1"></div>
        <div class="col-md-10 col-sm-12">                           
            <div class="panel panel-default">
                <div class="panel-heading">                                        
                    <h4 align="center"> LISTA DE MEDICOS REGISTRADOS EN EL SISTEMA</h4>
                </div>

                <div class="panel-body">
                    <div class="table-responsive">
                        <table class="table table-responsive table-hover table-bordered dataTable no-footer" id="sampleTable" role="grid" aria-describedby="sampleTable_info">
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th class="sorting_asc" tabindex="0" aria-controls="sampleTable" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Name: activate to sort column descending" style="width: 158px;">Nombre</th>
                                    <th>Identificación</th>
                                    <th>Codigo</th>
                                    <th>Servicio</th>
                                    <th>Modificar</th>
                                    <th>Asignar horario</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    FacadeMedico facMed = new FacadeMedico();

                                    List<MedicoDTO> med = facMed.consultarMedicos();
                                    
                                    for (int i = 0; i < med.size(); i++) {

                                        String nombre = med.get(i).getNombre_med();
                                        int identf = med.get(i).getIdentificacion_med();
                                        String servicio = med.get(i).getServicio_med();
                                        int codigo = med.get(i).getCodigo_med();
                                        int cantidad = i+1;

                                %>
                            
                                <tr role="row" class="odd">
                                    <td><%=cantidad%></td>                                    
                                    <td><%=nombre%></td>
                                    <td><%=identf%></td>
                                    <td><%=codigo%></td>
                                    <td> <%=servicio %></td> 
                            
                                    <td><input type="submit" class="btn btn-default" value="Datos" onclick="cargarForm('administrador/recargoAdmin_ModificarMedico.jsp?ident=<%=identf%>')"> </td>
                                    <td><input type="submit" class="btn btn-default" value="Asignar" onclick="cargarForm('administrador/recargoAdmin_AsignarHorario.jsp?medico='+<%=identf%>)"/></td>
                                    
                                </tr> 
                                <%
                                    }
                                %>  
                            </tbody>                               
                        </table>
                    </div>                                                   
                </div>
            </div>
        </div>
        
    </body>
</html>
