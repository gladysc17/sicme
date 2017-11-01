<%-- 
    Document   : recargoVice_InformeUsuarios2
    Created on : 05-jun-2017, 20:19:43
    Author     : Gladys M
--%>

<%@page import="FACADE.FacadePrograma_academico"%>
<%@page import="DTO.Programa_academicoDTO"%>
<%@page import="DTO.EstudianteDTO"%>
<%@page import="FACADE.FacadeEstudiante"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="DTO.CitaDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="FACADE.FacadeCita"%>
<%@page import="java.util.List"%>
<%@page import="DTO.UsuarioDTO"%>
<%@page import="FACADE.FacadeUsuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<div class="ibox float-e-margins">
    <div class="panel panel-default">
        <div class="panel-heading">
            <h3 align="center">INFORME</h3>
        </div>
        <div class="panel-body">
            <div class="table-responsive">
                <table class="table table-responsive table-hover table-bordered dataTable" id="sampleTable" role="grid" aria-describedby="sampleTable_info">

                    <%
                        String tipous = request.getParameter("consulta");
                        String fechaIC = request.getParameter("fechaIC");
                        String fechaIC2 = request.getParameter("fechaIC2");

                        SimpleDateFormat ff = new SimpleDateFormat("yyyy-MM-dd");
                        Date fechaI = ff.parse(fechaIC);
                        Date fechaF = ff.parse(fechaIC2);

                        if (tipous.isEmpty() || fechaIC.isEmpty() || fechaIC2.isEmpty() || tipous == null || fechaIC == null || fechaIC2 == null) {
                    %>
                    <script type="text/javascript">
                        alert('Por Favor seleccione todos los campos');
                    </script>
                    <%
                        }

                        if (fechaF.before(fechaI)) {
                    %>
                    <script type="text/javascript">
                        alert('Fechas no coinciden');
                    </script>
                   
                    <%
                    } else {
                        String nombre = "";
                        String identf = "";
                        String codigo = "";
                        String tipo2 = "";
                        int cantidad = 0;

                        FacadeUsuario facOtro = new FacadeUsuario();

                        if (tipous.equals("todos")) {

                            %>
                     <thead>
                        <tr>
                            <th>#</th>
                            <th>Nombre</th>
                            <th>Identificación</th>
                            <th>Codigo</th>
                            <th>Tipo Usuario</th>
                            <th>Citas</th>                    
                        </tr>
                    </thead>
                    <tbody>
                    
                    <%

                            List<UsuarioDTO> otro = facOtro.consultarUsuariosPorFecha(fechaIC, fechaIC2);

                            for (int i = 0; i < otro.size(); i++) {
                                nombre = otro.get(i).getNombre();
                                identf = otro.get(i).getIdentificacion();
                                codigo = otro.get(i).getCodigo();
                                tipo2 = otro.get(i).getTipo_usuario();

                                cantidad = i + 1;

                                FacadeCita fc = new FacadeCita();
                                int canCitas = fc.cantidadCitasEstudiante(identf, fechaIC, fechaIC2);


                    %>
                    

                        <tr>
                            <td><%=cantidad%></td>
                            <td><%=nombre%></td>
                            <td><%=identf%></td>
                            <td><%=codigo%></td>
                            <td><%=tipo2%> </td> 
                            <td><%=canCitas%> </td>                   
                        </tr> 
                 
                    <%
                        }
                    } else if (tipous.equals("estudiante")) {
                        List<UsuarioDTO> otro = facOtro.listarUsuarioPorTipo(tipous, fechaIC, fechaIC2);
                         
                        %>
                    
                         <thead>
                        <tr>
                            <th>#</th>
                            <th >Nombre</th>
                            <th>Identificación</th>
                            <th>Codigo</th>
                            <th>Tipo Usuario</th>
                            <th>Programa</th>
                            <th>Citas</th>                    
                        </tr>
                    </thead>
                        <%
                    
                    

                        for (int i = 0; i < otro.size(); i++) {

                            nombre = otro.get(i).getNombre();
                            identf = otro.get(i).getIdentificacion();
                            codigo = otro.get(i).getCodigo();
                            tipo2 = otro.get(i).getTipo_usuario();

                            System.out.println("estudiantes en bs: " + nombre);

                            cantidad = i + 1;

                            FacadeCita fc = new FacadeCita();
                            int canCitas = fc.cantidadCitasEstudiante(identf, fechaIC, fechaIC2);
                            FacadeEstudiante facEst = new FacadeEstudiante();
                            EstudianteDTO est = facEst.consultarEstudiantes(identf);
                            String estado = est.getEstado_estudiante();
                            int idP = est.getPrograma_academico();
                            FacadePrograma_academico facPro = new FacadePrograma_academico();
                            Programa_academicoDTO pro = facPro.consultarPrograma_academicoId(idP);
                            String programa = pro.getNombre_programa();


                    %>                    
                   
                    
                        <tr role="row" class="odd">
                            <td><%=cantidad%></td>
                            <td class="sorting_asc" style="height: 5px"><%=nombre%></td>
                            <td><%=identf%></td>
                            <td><%=codigo%></td>                    
                            <td><%=estado%></td>                                
                            <td><%=programa%> </td>                           
                            <td><%=canCitas%> </td> 
                        </tr> 
                    
                    <% }

                    } else {

                        List<UsuarioDTO> otro = facOtro.listarUsuarioPorTipo(tipous, fechaIC, fechaIC2);
                        %>
                        <thead>
                        <tr>
                            <th>#</th>
                            <th >Nombre</th>
                            <th>Identificación</th>
                            <th>Codigo</th>
                            <th>Tipo Usuario</th>
                            <th>Citas</th>                    
                        </tr>
                    </thead><tbody>
                    <%
                        for (int i = 0; i < otro.size(); i++) {

                            nombre = otro.get(i).getNombre();
                            identf = otro.get(i).getIdentificacion();
                            codigo = otro.get(i).getCodigo();
                            tipo2 = otro.get(i).getTipo_usuario();

                            cantidad = i + 1;

                            FacadeCita fc = new FacadeCita();
                            int canCitas = fc.cantidadCitasEstudiante(identf, fechaIC, fechaIC2);

                    %>
                    
                        <tr role="row" class="odd">
                            <td><%=cantidad%></td>
                            <td class="sorting_asc" style="height: 5px"><%=nombre%></td>
                            <td><%=identf%></td>
                            <td><%=codigo%></td>                    
                            <td><%=tipo2%></td>  
                            <td><%=canCitas%> </td>                    
                        </tr> 
                    </tbody>
                    <%}
                            }
                        }
                    %>

                    </tbody>                               
                </table>


            </div>    

            <form action="/CitasMedicas/usuarios" target="_blank" method="post">
                <input type="hidden" value="<%=tipous%>" name="tipous" id="tipous">
                <input type="hidden" value="<%=fechaIC%>" name="fechaIC" id="fechaIC">
                <input type="hidden" value="<%=fechaIC2%>"  name="fechaIC2" id="fechaIC2">
                <button type="submit" class="btn btn-success">IMPRIMIR </button>                                               
            </form>
        </div>
    </div>
</div>
<script src="../js/jquery.dataTables.min.js" type="text/javascript"></script>
<script src="../js/dataTables.bootstrap.min.js" type="text/javascript"></script>
<script type="text/javascript">$('#sampleTable').DataTable();</script>