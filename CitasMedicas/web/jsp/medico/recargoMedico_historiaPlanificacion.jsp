<%-- 
    Document   : recargoMedico_historiaPlanificacion
    Created on : 5/04/2017, 09:19:29 PM
    Author     : LEGADO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="col-md-1"></div>
        <div class="col-md-10">
            <div class="row">
                <div clas="col-md-12">
                    <div class="card">
                        <table border="2px" width="100%">                                 
                            <tr>                                    
                                <td rowspan="2">
                                    <img src="../img/logo_ufps1.png" alt=""  width="100" height="100"/> <BR>
                                    UFPS
                                </td>
                                <td rowspan="2" align="center" height="100"><p>HISTORIA CLINICA</p>                                   
                                    <p>DIVISION DE SERVICIOS ASISTENCIALES Y DE SALUD</p>
                                    <p>UNIDAD DE SERVICIOS ASISTENCIALES Y DE SALUD</p>
                                </td>
                                <td>Fecha: 04/04/2017</td>                                    
                            </tr>
                            <tr>
                                <td>Hora: 22:00</td>                                                                         
                            </tr>                                
                        </table> <br>
                        <div class="panel panel-default">
                            <ul class="nav nav-pills panel panel-heading">
                                <li class="active"><a href="#datosIdentificacion" data-toggle="tab">DATOS DE IDENTIFICACION|</a></li>
                                <li><a href="#motivo" data-toggle="tab">MOTIVO |</a></li>
                                <li><a href="#revision" data-toggle="tab">REVISION DEL SISTEMA |</a></li>
                                <li><a href="#antecedente" data-toggle="tab">ANTECEDENTES |</a></li>
                            </ul>
                            <form action="../../controlador/procesarRegistroPlanificacionFamiliar.jsp" method="post">
                                <%
                                    int idusuario_hcmed = Integer.parseInt(request.getParameter("id"));
                                    int idcita = Integer.parseInt(request.getParameter("idcita"));
                                    String tipo = request.getParameter("tipo");
                                %>
                                <input type="hidden" value="<%=idusuario_hcmed %>" name="ide"/>
                                <input type="hidden" value="<%=idcita %>" name="idecita" />
                                <div id="myTabContent" class="tab-content">

                                    <div class="tab-pane active" id="datosIdentificacion">
                                        <div class="panel-body">
                                            <table class="table table-responsive">
                                                <tbody>
                                                    <tr>
                                                        <td>Nombre: <input type="text" class="form-control" disabled /></td>
                                                        <td>N° de Identificacion: <input type="text" class="form-control" disabled /> </td>
                                                        <td>Estado civil: <input type="text" class="form-control" disabled /> </td>
                                                    </tr>
                                                    <tr>
                                                        <td>Fecha de nacimiento:<input type="text" class="form-control" disabled /></td>
                                                        <td>Sexo<input type="text" class="form-control" disabled /> </td>
                                                        <td>Edad<input type="text" class="form-control" disabled /> </td>
                                                    </tr>
                                                    <tr>
                                                        <td>Ocupación<input type="text" class="form-control" value="<%=tipo %>" disabled /></td>
                                                        <td>Tipo vinculación<input type="text" class="form-control" name="tipo_vinculacion" required /></td>
                                                        <td>Aseguradora<input type="text" class="form-control" name="aseguradora" required /></td>
                                                    </tr>
                                                    <tr>
                                                        <td>Direccion de residencia<input type="text" class="form-control" disabled /></td>
                                                        <td>Barrio<input type="text" class="form-control" disabled /></td>
                                                        <td>Telefono<input type="text" class="form-control" disabled /></td>
                                                    </tr>
                                                    <tr>
                                                        <td>Correo electronico:</td>
                                                        <td colpsan="2"><input type="text" class="form-control" disabled /></td>
                                                    </tr>
                                                    <tr>
                                                        <td>Nombre responsable<input type="text" class="form-control" name="nombre_resp" /></td>
                                                        <td>Parentesco<input type="text" class="form-control" name="parentesco" /></td>
                                                    </tr>
                                                    <tr>
                                                        <td>Telefono<input type="text" class="form-control" name="telefono_resp" /></td>
                                                        <td>Direccion<input type="text" class="form-control" name="direccion_resp" /></td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                    <div class="tab-pane" id="motivo">
                                        <div class="panel-body">
                                            <table class="table table-responsive">
                                                <tbody>
                                                    <tr>
                                                        <td>Motivo</td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <textarea class="form-control" name="motivo"  ></textarea>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>Enfemedad actual</td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <textarea class="form-control" name="enfermedad"></textarea>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                    <div class="tab-pane" id="revision">
                                        <div class="panel-body">
                                            <table class="table table-responsive">
                                                <tbody>
                                                    <tr>
                                                        <td>
                                                            <label> <input type="checkbox" name="revision_sistemas"> AMENORREA  </label> <br>
                                                            <label> <input type="checkbox" name="revision_sistemas"> MANCHADO </label> <br>
                                                            <label> <input type="checkbox" name="revision_sistemas"> CEFALEA  </label> <br>
                                                            <label> <input type="checkbox" name="revision_sistemas"> DOLOR MAMARIO </label> <br>
                                                            <label> <input type="checkbox" name="revision_sistemas"> SANGRADO </label> <br>
                                                            <label> <input type="checkbox" name="revision_sistemas"> LACTANCIA  </label> <br>
                                                        </td>
                                                        <td>
                                                            <label> <input type="checkbox" name="revision_sistemas"> MAREO  </label> <br>
                                                            <label> <input type="checkbox" name="revision_sistemas"> ACNE </label> <br>
                                                            <label> <input type="checkbox" name="revision_sistemas"> DOLOR PELVICO  </label> <br>
                                                            <label> <input type="checkbox" name="revision_sistemas"> FLUJO VAGINAL  </label> <br>
                                                            <label> <input type="checkbox" name="revision_sistemas"> VARICES </label> <br> 
                                                            <label> <input type="checkbox" name="revision_sistemas"> TRISTEZA O IRRITABLE</label><br>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td><label> <input type="checkbox" name="revision_sistemas"> Otro </label></td>
                                                        <td><label> <input type="text" class="form-control" name="revision" placeholder="¿Cuál?" ></label></td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                    <div class="tab-pane" id="antecedente">
                                        <div class="panel-body">
                                            <table class="table table-responsive">
                                                <tr>
                                                    <td>Patológicos</td>
                                                    <td colspan="2"><input type="text" class="form-control" name="ant_pato" /></td>
                                                </tr>
                                                <tr>
                                                    <td>Quirurgicos</td>
                                                    <td colspan="2"><input type="text" class="form-control" name="ant_quiru" /></td>
                                                </tr>
                                                <tr>
                                                    <td>Hospitalarios</td>
                                                    <td colspan="2"><input type="text" class="form-control" name="ant_hosp" /></td>
                                                </tr>
                                                <tr>
                                                    <td>Toxicoalergicos</td>
                                                    <td colspan="2"><input type="text" class="form-control" name="ant_toxic" /></td>
                                                </tr>
                                                <tr>
                                                    <td>Farmacologicos</td>
                                                    <td colspan="2"><input type="text" class="form-control" name="ant_farm" /></td>
                                                </tr>
                                                <tr>
                                                    <td>Familiares</td>
                                                    <td colspan="2"><input type="text" class="form-control" name="ant_fami" /></td>
                                                </tr>
                                                <tr>
                                                    <td colspan="2">Ginecologicos</td>
                                                </tr>
                                                <tr>
                                                    <td>Menarca <input type="text" class="form-control" name="menarca" /> </td>
                                                    <td>Ciclos <input type="text" class="form-control" name="ciclo" /> </td>
                                                    <td>Menopausia <input type="text" class="form-control" name="menopausia" /> </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="3">
                                                        G:<input type="text" size="10" name="estG" /> &nbsp;&nbsp;&nbsp;
                                                        F:<input type="text" size="10" name="estF" /> &nbsp;&nbsp;&nbsp;
                                                        C:<input type="text" size="10" name="estC" /> &nbsp;&nbsp;&nbsp;
                                                        A:<input type="text" size="10" name="estA" /> &nbsp;&nbsp;&nbsp;
                                                        V:<input type="text" size="10" name="estV" /> &nbsp;&nbsp;&nbsp;
                                                        M:<input type="text" size="10" name="estM" /> &nbsp;&nbsp;&nbsp;
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>Fecha última menstruación:</td>
                                                    <td colspan="2"> <input type="date" size="12" name="ult_menst" /> </td>
                                                </tr>
                                                <tr>
                                                    <td>Fecha último parto:</td>
                                                    <td colspan="2"> <input type="date" size="12" name="ult_parto" /> </td>
                                                </tr>
                                                <tr>
                                                    <td>CCV: <input type="date" size="12" name="ccv" /> </td>
                                                    <td colspan="2"> Resultado <input type="text" class="form-control" name="resulccv" /> </td>
                                                </tr>
                                                <tr>
                                                    <td>Planificación: <input type="text" class="form-control" name="planif" /> </td>
                                                    <td colspan="2"> Metodo <input type="text" class="form-control" name="metodo" /> </td>
                                                </tr>
                                                <tr>
                                                    <td>

                                                        <input type="submit" value="Registrar atención" >
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>

                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-1"></div>
    </body>
</html>
