<%-- 
    Document   : recargoAdmin_ListarOtrosUsuarios
    Created on : 23-mar-2017, 20:16:10
    Author     : Gladys M
--%>

<%@page import="java.util.List"%>
<%@page import="DTO.OtroUsuarioDTO"%>
<%@page import="FACADE.FacadeOtrosUsuarios"%>
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
                    <h4 align="center"> LISTA DE OTROS USUARIOS REGISTRADOS EN EL SISTEMA</h4>
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
                                    <th>Rol</th>
                                    <th>Datos</th>
                                    <th>Modificar</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    FacadeOtrosUsuarios facOtro = new FacadeOtrosUsuarios();

                                    List<OtroUsuarioDTO> otro = facOtro.consultarOtros();
                                    
                                    for (int i = 0; i < otro.size(); i++) {

                                        String nombre = otro.get(i).getNombre();
                                        int identf = otro.get(i).getIdentificacion();                                        
                                        int codigo = otro.get(i).getCodigo();
                                        String rol = otro.get(i).getRol();
                                        
                                        int cantidad = i+1;

                                %>
                            
                                <tr role="row" class="odd">
                                    <td><%=cantidad%></td>
                                    <td class="sorting_asc" style="height: 5px"><%=nombre%></td>
                                    <td><%=identf%></td>
                                    <td><%=codigo%></td>
                                    <td><%=rol%></td>
                                    <td> Informe</td> 
                                    <td><input type="submit" class="btn btn-default" value="Datos" onclick="cargarForm('administrador/recargoAdmin_ModificarOtroUsuario.jsp?ident=<%=identf%>')"> </td>
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
