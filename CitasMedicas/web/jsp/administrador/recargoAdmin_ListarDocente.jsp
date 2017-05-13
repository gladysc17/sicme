<%-- 
    Document   : recargoAdmin_ListarDocente
    Created on : 23-mar-2017, 20:51:48
    Author     : Gladys M
--%>

<%@page import="DTO.DocenteDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page import="FACADE.FacadeDocente"%>
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
                    <h4 align="center"> LISTA DE DOCENTES REGISTRADOS EN EL SISTEMA</h4>
                </div>

                <div class="panel-body">
                    <div class="table-responsive">
                        <table class="table table-responsive table-hover table-bordered dataTable no-footer" id="sampleTable" role="grid" aria-describedby="sampleTable_info">
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th class="sorting_asc" tabindex="0" aria-controls="sampleTable" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Name: activate to sort column descending">Nombre</th>
                                    <th>Identificación</th>
                                    <th>Codigo</th>                                    
                                    <th>Telefono</th>
                                    <th>Modificar</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    FacadeDocente facDoc = new FacadeDocente();

                                    List<DocenteDTO> doc = facDoc.consultarDocentes();
                                    
                                    for (int i = 0; i < doc.size(); i++) {

                                        String nombre = doc.get(i).getNombre();
                                        int identf = doc.get(i).getIdentificacion();                                        
                                        int codigo = doc.get(i).getCodigo();
                                        String telefono = doc.get(i).getTelefono();
                                        
                                        int cantidad = i+1;

                                %>
                            
                                <tr role="row" class="odd">
                                    <td><%=cantidad%></td>
                                    <td class="sorting_asc"><%=nombre%></td>
                                    <td><%=identf%></td>
                                    <td><%=codigo%></td>                                    
                                    <td> <%=telefono%></td> 
                                    <td><input type="submit" class="btn btn-default" value="Modificar" onclick="cargarForm('administrador/recargoAdmin_ModificarDocente.jsp?ident=<%=identf%>')"> </td>
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
        <div class="col-md-1"></div>
        <script src="../js/jquery-2.1.4.min.js"></script>
        <script src="../js/essential-plugins.js"></script>
        <script src="../js/bootstrap.min.js"></script>
        <script src="../js/pace.min.js"></script>
        <script src="../js/main.js"></script>
        <script type="text/javascript" src="../js/jquery.dataTables.min.js"></script>
        <script type="text/javascript" src="../js/dataTables.bootstrap.min.js"></script>
        <script type="text/javascript">$('#sampleTable').DataTable();</script>
    </body>
</html>
