<%-- 
    Document   : recargoMedico_ListaRegistrosEvento
    Created on : 17/10/2017, 09:49:03 PM
    Author     : usuario
--%>

<%@page import="DTO.RegistroeventoDTO"%>
<%@page import="java.util.List"%>
<%@page import="FACADE.FacadeEvento"%>
<%@page import="jdk.nashorn.internal.ir.RuntimeNode.Request"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class="panel panel-default">
    <div class="panel-heading">
        <h4 align="center">Lista de personas Registradas en el evento</h4>
    </div>

    <div class="panel-body">
        <div class="table-responsive">
            <table class="table table-responsive table-hover table-bordered dataTable no-footer" id="sampleTable" role="grid" aria-describedby="sampleTable_info">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Codigo</th>
                        <th class="sorting_asc" tabindex="0" aria-controls="sampleTable" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Name: activate to sort column descending">Identificacion</th>
                        <th>Nombre</th>
                        <th>Programa Academico</th>
                        <th>Correo</th>                            
                    </tr>
                </thead>
                <tbody>
                    <%
                        String id = request.getParameter("idEvento");
                        int ide = Integer.parseInt(id);
                        FacadeEvento facEv = new FacadeEvento();

                        List<RegistroeventoDTO> lista = facEv.listarRegistrados(ide);

                        for (int i = 0; i < lista.size(); i++) {
                            String codigo = lista.get(i).getCodigo();
                            String ident = lista.get(i).getIdentificacion();
                            String nombre = lista.get(i).getNombre();
                            String programa = lista.get(i).getPrograma();
                            String correo = lista.get(i).getCorreo();
                            
                            int n = i+1;

                    %>
                    <tr role="row" class="odd">                            
                        <th><%=n%></th>
                        <td><%=codigo%></td>
                        <td><%=ident%></td>
                        <td><%=nombre%></td>
                        <td><%=programa%></td>
                        <td><%=correo%></td>                                                       
                    </tr>

                    <%  }
                    %>

                </tbody>
            </table>
        </div>
        
        <form action="/CitasMedicas/listaRegistradosEv" target="_blank" method="post">
            <input type="hidden" value="<%=id%>" name="idEvento" id="idEvento">                       
            <button type="submit" class="btn btn-success">IMPRIMIR </button>                                               
        </form>
    </div>
</div>
<script type="text/javascript" src="../js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="../js/dataTables.bootstrap.min.js"></script>
<script type="text/javascript">$('#sampleTable').DataTable();</script>




