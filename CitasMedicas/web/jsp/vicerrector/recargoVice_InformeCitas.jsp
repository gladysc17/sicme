<%-- 
    Document   : recargoVice_CitasMedicas
    Created on : 20-mar-2017, 18:56:46
    Author     : Gladys M
--%>

<%@page import="DTO.CitaDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="FACADE.FacadeCita"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1 align="center"> Citas </h1>

        <p align="center"> Mostrar Citas por :
            <select> 
                <option>  </option>
                <option> Servicio </option>
                <option> Patologia </option>
                <option> Profesional</option>
                <option> Programa Academico </option>
                <option> Inasistidas </option>
            </select> <br><br>
        </p>
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-body">                      
                        <table class="table table-responsive table-hover table-bordered dataTable no-footer" id="sampleTable" role="grid" aria-describedby="sampleTable_info">
                            <thead>
                                <tr>
                                    <th class="sorting_asc" tabindex="0" aria-controls="sampleTable" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Name: activate to sort column descending" style="width: 158px;">Fecha</th>                                    
                                    <th>Servicio</th>
                                    <th>Medico</th>
                                    <th>Estudiante</th>
                                    <th>Informe</th>
                                </tr>
                            </thead>
                            <tbody>
                               
                                <tr role="row" class="odd">
                                    <td class="sorting_asc"></td>
                                    <td>ghfgh</td>
                                    <td>fhfgh</td>
                                    <td>fhggfh</td>
                                    <td> Informe</td>

                                </tr> 
                                                             
                            </tbody>
                        </table>
                    </div>
                </div>

            </div>
        </div>


        <!-- Javascripts-->
        <script src="js/jquery-2.1.4.min.js"></script>
        <script src="js/essential-plugins.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/plugins/pace.min.js"></script>
        <script src="js/main.js"></script>
        <script type="text/javascript" src="js/plugins/jquery.dataTables.min.js"></script>
        <script type="text/javascript" src="js/plugins/dataTables.bootstrap.min.js"></script>
        <script type="text/javascript">$('#sampleTable').DataTable();</script>
    </body>
</html>
