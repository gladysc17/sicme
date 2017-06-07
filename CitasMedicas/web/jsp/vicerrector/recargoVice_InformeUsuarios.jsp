<%-- 
    Document   : recargoVice_InformeUsuarios
    Created on : 30-mar-2017, 20:54:40
    Author     : Gladys M
--%>

<%@page import="FACADE.FacadeCita"%>
<%@page import="DTO.UsuarioDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page import="FACADE.FacadeUsuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class="ibox float-e-margins">
    <div class="panel panel-default ">
        <div class="panel-heading">
            <h1 align="center"> Usuarios </h1>
        </div>
        <div class="panel-body">
            <div class="form-group">
                <form name="form" method="post">
                    <label for="" class="control-label">Tipo de Usuario:</label>
                    <select name="consulta" id="consulta" required>
                        <option></option>
                        <option value="todos">Todos</option>
                        <option value="estudiante">Estudiantes</option>
                        <option value="docente">Docentes</option>
                        <option value="profesional">Profesionales</option>
                        <option value="medico">Medicos</option>
                        <option value="serviciosgenerales">Servicios Generales</option>
                        <option value="otros">Otros</option>

                    </select> &nbsp;&nbsp;&nbsp;
                    <label> desde </label>
                    <input type="date" id="fechaIC" name="fechaIC" required > &nbsp;&nbsp;&nbsp;
                    <label> hasta</label>
                    <input type="date" id="fechaIC2" name="fechaIC2" required> &nbsp;&nbsp;&nbsp;

                    <input type="button" class="btn btn-danger" value="CONSULTAR" onchange="validar()" onclick="cargar_form('vicerrector/recargoVice_InformeUsuarios2.jsp?consulta=' + consulta.value + '&fechaIC=' + fechaIC.value + '&fechaIC2=' + fechaIC2.value)"/>
                </form>                               

                <div class="panel-body" id="cargar">
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
                                        <th>citas</th>                    
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        FacadeUsuario facOtro = new FacadeUsuario();

                                        List<UsuarioDTO> otro = facOtro.consultarUsuarios();

                                        for (int i = 0; i < otro.size(); i++) {

                                            String nombre = otro.get(i).getNombre();
                                            String identf = otro.get(i).getIdentificacion();
                                            String codigo = otro.get(i).getCodigo();
                                            String tipo2 = otro.get(i).getTipo_usuario();

                                            int cantidad = i + 1;

                                            FacadeCita fc = new FacadeCita();
                                            int canCitas = fc.cantidadCitasUsuario(identf);


                                    %>

                                    <tr role="row" class="odd">
                                        <td><%=cantidad%></td>
                                        <td class="sorting_asc" style="height: 5px"><%=nombre%></td>
                                        <td><%=identf%></td>
                                        <td><%=codigo%></td>
                                        <td><%=tipo2%></td>
                                        <td> <%=canCitas%></td>                    
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
        </div>
    </div>

</div>
<script src="../js/dataTables.bootstrap.min.js" type="text/javascript"></script>
<script src="../js/jquery.dataTables.min.js" type="text/javascript"></script>
<script type="text/javascript">$('#sampleTable').DataTable();</script>