<%-- 
    Document   : recargoAdmin_AdministrarProgramas
    Created on : 18/10/2017, 10:55:10 AM
    Author     : LEGADO
--%>

<%@page import="DTO.Programa_academicoDTO"%>
<%@page import="java.util.List"%>
<%@page import="FACADE.FacadePrograma_academico"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="ibox float-e-margins">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 align="center">Programas académicos de la UFPS</h3>
                </div>
                <div class="panel-body">
                    <div class="table-responsive">
                        <table class="table table-responsive table-hover table-bordered dataTable" id="sampleTable" role="grid" aria-describedby="sampleTable_info">
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Nombre Programa Academico</th>
                                    <th>Código Programa Academico</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    FacadePrograma_academico fpa = new FacadePrograma_academico();
                                    List<Programa_academicoDTO> lis = fpa.consultarPrograma_academico();
                                    int i = 1;
                                    for (Programa_academicoDTO x : lis) {
                                %>
                                <tr>
                                    <td><%=i%></td>
                                    <td><%=x.getNombre_programa()%></td>
                                    <td><%=x.getCodigo_programa()%></td>
                                </tr>
                                <%
                                        i++;
                                    }
                                %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3>Agregar un nuevo programa académico</h3>
                </div>
                <div class="panel-body">
                    <form action="../controlador/procesarCrearPrograma.jsp" method="post">
                        <label>Nombre del programa académico: </label>
                        <input type="text" name="nombre_programa" id="nombre_programa" class="form-inline" required />
                        <label>Código del programa académico: </label>
                        <input type="text" name="codigo_programa" id="codigo_programa" class="form-inline" required />
                        <input type="submit" class="btn btn-success" value="Añadir" />
                    </form>
                </div>
            </div>
        </div>
        <script type="text/javascript" src="../js/jquery.dataTables.min.js"></script>
        <script type="text/javascript" src="../js/dataTables.bootstrap.min.js"></script>
        <script type="text/javascript">$('#sampleTable').DataTable();</script>

    </body>
</html>
