<%-- 
    Document   : recargoVice_InformeUsuarios2
    Created on : 05-jun-2017, 20:19:43
    Author     : Gladys M
--%>

<%@page import="java.util.List"%>
<%@page import="DTO.UsuarioDTO"%>
<%@page import="FACADE.FacadeUsuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<div class="panel-body">
    <div class="table-responsive">
        <table class="table table-responsive table-hover table-bordered dataTable" id="sampleTable" role="grid" aria-describedby="sampleTable_info">
            <thead>
                <tr>
                    <th>#</th>
                    <th class="sorting_asc" tabindex="0" aria-controls="sampleTable" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Name: activate to sort column descending" style="width: 158px;">Nombre</th>
                    <th>Identificación</th>
                    <th>Codigo</th>
                    <th>Rol</th>
                    <th>Datos</th>                    
                </tr>
            </thead>
            <tbody>
                <%
                    String tipous = request.getParameter("consulta");
                    String fechaIC = request.getParameter("fechaIC");
                    String fechaIC2 = request.getParameter("fechaIC2");
                    
                    FacadeUsuario facOtro = new FacadeUsuario();

                    List<UsuarioDTO> otro = facOtro.listarUsuarioPorTipo(tipous, fechaIC, fechaIC2);

                    for (int i = 0; i < otro.size(); i++) {

                        String nombre = otro.get(i).getNombre();
                        String identf = otro.get(i).getIdentificacion();
                        String codigo = otro.get(i).getCodigo();
                        String tipo2 = otro.get(i).getTipo_usuario();

                        int cantidad = i + 1;

                %>

                <tr role="row" class="odd">
                    <td><%=cantidad%></td>
                    <td class="sorting_asc" style="height: 5px"><%=nombre%></td>
                    <td><%=identf%></td>
                    <td><%=codigo%></td>
                    <td><%=tipo2%></td>
                    <td> Informe</td>                    
                </tr> 
                <%
                    }
                    
                %>
            </tbody>                               
        </table>
    </div>                                                   
</div>


<script src="../js/dataTables.bootstrap.min.js" type="text/javascript"></script>
<script src="../js/jquery.dataTables.min.js" type="text/javascript"></script>
<script type="text/javascript">$('#sampleTable').DataTable();</script>