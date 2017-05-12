<%-- 
    Document   : recargoAdmin_ListadoEvento
    Created on : 22/03/2017, 08:55:52 PM
    Author     : LEGADO
--%>

<%@page import="DTO.EventoDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="FACADE.FacadeEvento"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        
        <h1 align="center">Listado de eventos </h1>
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-body">
                        <table class="table table-responsive table-hover table-bordered dataTable no-footer" id="sampleTable" role="grid" aria-describedby="sampleTable_info">
                            <thead>
                                <tr>
                                    <th>Nombre</th>
                                    <th>Fecha</th>
                                    <th>Hora</th>
                                    <th>Lugar</th>
                                    <th>Descripción</th>
                                    <th>Dirigido por</th>
                                    <th>Accion</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                FacadeEvento fe = new FacadeEvento();
                                int ident=12345;
                                List<EventoDTO> ls = fe.listadoEventosAdm(ident);
                                
                                for(EventoDTO ev: ls){
                                %>
                                <tr role="row" class="odd">
                                    <td> <%=ev.getNombreEvento()%> </td>
                                    <td> <%=ev.getFechaEvento()%> </td>
                                    <td> <%=ev.getHoraEvento() %> </td>
                                    <td> <%=ev.getLugarEvento() %> </td>
                                    <td> <%=ev.getDescrEvento() %> </td>
                                    <td> <%=ev.getDirector() %> </td>
                                    <td> <input type="button" value="Modificar" class="btn btn-info" /> </td>
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
