<%-- 
    Document   : recargoMedico_historiaOdontologia
    Created on : 18/04/2017, 10:39:46 PM
    Author     : LEGADO
--%>

<%@page import="org.json.JSONArray"%>
<%@page import="org.json.JSONObject"%>
<%@page import="DTO.HcOdontologiaDTO"%>
<%@page import="java.util.List"%>
<%@page import="FACADE.FacadeHcOdontologia"%>
<%@page import="DTO.UsuarioDTO"%>
<%@page import="FACADE.FacadeUsuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/sweetalert2/6.6.2/sweetalert2.min.css"/>        
        <style>
            .diente {
                position: static;
                width: 0px;
                height: auto;
                margin-left: 50px;
                display: inline-block;
            }

            .cuadro {
                background-color: #FFFFFF;
                border: 1px solid #7F7F7F;
                position: relative;
                width: 25px;
                height: 15px;
                left: -20px;
                -webkit-border-radius: 80px 80px 0px 15px;
                -moz-border-radius: 80px 80px 0px 15px;
                border-radius: 80px 80px 0px 15px;
            }

            .cuadro:hover {
                /*background: rgba(117, 198, 243, 0.4);*/

                cursor: pointer;
            }

            .izquierdo {
                top: 1px !important;
                left: -36px !important;
                -webkit-transform: rotate(270deg);
                -moz-transform: rotate(270deg);
                -ms-transform: rotate(270deg);
                -o-transform: rotate(270deg);
                transform: rotate(270deg);
            }

            .debajo {
                top: 2px !important;
                left: -20px !important;
                -webkit-transform: rotate(180deg);
                -moz-transform: rotate(180deg);
                -ms-transform: rotate(180deg);
                -o-transform: rotate(180deg);
                transform: rotate(180deg);
            }

            .derecha {
                top: -29px !important;
                left: -5px !important;
                -webkit-transform: rotate(90deg);
                -moz-transform: rotate(90deg);
                -ms-transform: rotate(90deg);
                -o-transform: rotate(90deg);
                transform: rotate(90deg);
            }

            .centro {
                background: #F3F3F3;
                border: 1px solid #7F7F7F;
                width: 25px;
                height: 25px;
                top: -49px;
                left: -20px;
                position: relative;
            }

            .centro:hover {
                border: 1px solid rgba(117, 198, 243, 0.4);
                /*background-color: rgba(117, 198, 243, 0.4);*/

                cursor: pointer;
            }

            #tlr {
                border-bottom: 1px solid black;
                border-right: 1px solid black;
            }

            #tr {
                border-right: 1px solid black;
            }

            #tll {
                border-bottom: 1px solid black;
                border-left: 1px solid black;
            }

            #tl {
                border-left: 1px solid black;
            }

            #blr {
                border-right: 1px solid black;
            }

            #br {
                border-right: 1px solid black;
            }

            #bl {
                border-left: 1px solid black;
            }

            #bll {
                border-left: 1px solid black;
            }

            .click-red {
                background-color: red !important;
            }
            
            .click-red-border {
                border-color : red !important;
            }
            
            .click-marron-border {
                border-color : #3E2723 !important;
            }

            .click-blue {
                background-color: blue !important;
            }
            
            .click-blue-border {
                border-top-color : blue !important;
                border-bottom-color: blue !important;
                border-left-color: blue !important;
                border-right-color: blue !important;
            }

            .click-green {
                background-color: green !important;
            }

            .click-gray {
                background-color: #747F7D !important;
            }

            .click-erupcionar {
                background-color: #827717 !important;
            }

            .click-endo{
                background-color: #3E2723 !important;
            }

            .click-proce{
                background-color: #1B5E20 !important;
            }

            .click-probuen{
                background-color: #F57F17 !important;
            }

            .click-promal{
                background-color: #FF6E40 !important;
            }

            .click-implante {
                background-color: #AEEA00 !important;
            }

            .click-remobuen {
                background-color: #4A235A !important;
            }

            .click-remomal {
                background-color: #00695C !important;
            }

            .click-sellantep {
                background-color: #76FF03 !important;
            }

            .click-sellantei {
                background-color: #558B2F !important;
            }

            .click-erosion {
                background-color: #BA68C8 !important;
            }

            .click-corobuen {
                background-color: #FFFF00 !important;
            }

            .click-coromal {
                background-color: #607D8B !important;
            }

            .click-nuclebuen {
                background-color: #FFB74D !important;
            }

            .click-nuclemal {
                background-color: #A04000 !important;
            }

            .click-white{
                background-color: white !important;
            }

            .kill {
                background-color: green;
            }

            .diente-leche {
                position: relative;
                width: 0px;
                height: auto;
                margin-left: 50px;
                display: inline-block;
            }

            .cuadro-leche {
                background-color: #FFFFFF;
                border: 1px solid #7F7F7F;
                position: relative;
                width: 13px;
                height: 13px;
                left: 45px;
                -webkit-border-radius: 80px 80px 0px 15px;
                -moz-border-radius: 80px 80px 0px 15px;
                border-radius: 80px 80px 0px 15px;
            }

            .cuadro-leche:hover {
                /*background: rgba(117, 198, 243, 0.4);*/

                cursor: pointer;
            }

            .izquierdo-leche {
                top: -4px !important;
                left: -32px !important;
                -webkit-transform: rotate(270deg);
                -moz-transform: rotate(270deg);
                -ms-transform: rotate(270deg);
                -o-transform: rotate(270deg);
                transform: rotate(270deg);
            }

            .top-leche {
                width: 15px;
                left: -20px;
            }

            .debajo-leche {
                width: 15px;
                top: -8px !important;
                left: -20px !important;
                -webkit-transform: rotate(180deg);
                -moz-transform: rotate(180deg);
                -ms-transform: rotate(180deg);
                -o-transform: rotate(180deg);
                transform: rotate(180deg);
            }

            .derecha-leche {
                top: -30px !important;
                left: -7px !important;
                -webkit-transform: rotate(90deg);
                -moz-transform: rotate(90deg);
                -ms-transform: rotate(90deg);
                -o-transform: rotate(90deg);
                transform: rotate(90deg);
            }

            .centro-leche {
                background: #F3F3F3;
                border: 1px solid #7F7F7F;
                width: 15px;
                height: 13px;
                top: -43px;
                left: -20px;
                position: relative;
            }

            .centro-leche:hover {
                border: 1px solid rgba(117, 198, 243, 0.4);
                /*background-color: rgba(117, 198, 243, 0.4);*/

                cursor: pointer;
            }

        </style>    
        
        <%
            String idusuario_hcmed = request.getParameter("id");
            int idcita = Integer.parseInt(request.getParameter("idcita"));
            String tipo = request.getParameter("tipo");

            FacadeUsuario fu = new FacadeUsuario();
            UsuarioDTO u = fu.consultarUsuarioPorId(idusuario_hcmed);
            
            FacadeHcOdontologia f_odontologia = new FacadeHcOdontologia();
            List<HcOdontologiaDTO> list_hcOdontologia = f_odontologia.consultarHcOdontologia(Integer.parseInt(u.getIdentificacion()));
            
            //ESte es la clave
            HcOdontologiaDTO hcOdontologia = null;
            if (list_hcOdontologia.size() > 0) {
                hcOdontologia = list_hcOdontologia.get(0);
            }
            String primeraVez = "SI";
            JSONObject jsonObj = null;
            JSONObject jsonObjOdontograma = null;
            if (hcOdontologia != null) {
                primeraVez = "NO";
                if(hcOdontologia.getF_control_placa() != null) {
                    jsonObj = new JSONObject(hcOdontologia.getF_control_placa());
                }
                
                if(hcOdontologia.getG_odontograma() != null) {
                    jsonObjOdontograma = new JSONObject(hcOdontologia.getG_odontograma());
                }
                /*JSONObject obj = jsonObj.getJSONArray("pla").getJSONObject(0);
                String x = String.valueOf(obj.getJSONArray("ubicaciones").getJSONObject(4).get("valor"));
                System.out.println("Lo q traigo del JSON -> "+x);*/
            }

        %>

        <div class="ibox float-e-margins">  
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
                            <%if (hcOdontologia == null) {%>
                                <ul class="nav nav-pills panel panel-heading">
                                    <li class="active"><a href="#datosIdentificacion" data-toggle="tab">DATOS DE IDENTIFICACION|</a></li>
                                    <li><a href="#anamnesis" data-toggle="tab">ANAMNESIS |</a></li>
                                    <li><a href="#examenes" data-toggle="tab">EXAMENES: ESTOMATOLOGICO-TEJIDOS BALNDOS-HALLAZGOS |</a></li>
                                    <li><a href="#protesiss" data-toggle="tab">PROTESIS |</a></li>
                                    <li><a href="#atm" data-toggle="tab">ANALISIS A.T.M. |</a></li>
                                    <li><a href="#placa" data-toggle="tab">CONTROL PLACA |</a></li>
                                    <li><a href="#odontograma" data-toggle="tab">ODONTOGRAMA |</a></li>
                                    <li><a href="#final" data-toggle="tab">LECTURA RX - DIAGNOSTICO - PLAN DE TRATAMIENTO |</a></li>
                                </ul>
                            <%} else {%>
                                <ul class="nav nav-pills panel panel-heading">
                                    <li class="active"><a href="#datosIdentificacion" data-toggle="tab">DATOS DE IDENTIFICACION|</a></li>
                                    <li><a href="#consulta" data-toggle="tab">CONSULTA |</a></li>
                                    <li><a href="#placa" data-toggle="tab">CONTROL PLACA |</a></li>
                                    <li><a href="#odontograma" data-toggle="tab">ODONTOGRAMA |</a></li>
                                    <li><a href="#historia" data-toggle="tab">HISTORIA CLINICA |</a></li>
                                </ul>
                            <%}%>
                            <form id="regodont" method="POST" action="../controlador/procesarRegistroHistoriaOdontologia.jsp">
                                
                                <input type="hidden" id="primeraVez" name="primeraVez" value="<%=primeraVez%>"/>
                                
                                <div id="myTabContent" class="tab-content">
                                    <div class="tab-pane active" id="datosIdentificacion">
                                        <div class="panel-body">
                                            <table class="table table-responsive">
                                                <tbody>
                                                    <tr>
                                                        <td>Nombre <input type="text" class="form-control" value="<%=u.getNombre()%>" disabled /> </td>
                                                        <td>Sexo <input type="text" class="form-control" value="<%=u.getGenero()%>" disabled /> </td>
                                                    </tr>
                                                    <tr>
                                                        <td>Fecha de nacimiento <input type="text" class="form-control" value="<%=u.getFecha_nacimiento()%>" disabled /> </td>
                                                        <td>Edad <input type="text" class="form-control" value="<%=u.getEdad()%>" disabled /> </td>
                                                    </tr>
                                                    <tr>
                                                        <td>Direccion <input type="text" class="form-control" value="<%=u.getDireccion()%>" disabled /> </td>
                                                        <td>Identificacion <input type="text" class="form-control" value="<%=u.getIdentificacion()%>" disabled /> </td>
                                                    </tr>
                                                    <tr>
                                                        <td>Telefono <input type="text" class="form-control" value="<%=u.getTelefono()%>" disabled /> </td>
                                                        <td>Ocupacion <input type="text" class="form-control" value="<%=u.getTipo_usuario()%>" disabled /> </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                                    
                                <%if (hcOdontologia == null) {%>
                                    <div class="tab-pane" id="anamnesis">
                                        <div class="panel-body">
                                            <table class="table table-responsive">
                                                <tr>
                                                    <td>Motivo de Consulta</td>
                                                    <td colspan="5"> <textarea id="motivo" class="form-control" name="motivo"></textarea> </td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                    <td>Si</td>
                                                    <td>No</td>
                                                    <td></td>
                                                    <td>Si</td>
                                                    <td>No</td>
                                                </tr>
                                                <tr>
                                                    <td>1. Alergias</td>
                                                    <td> <input type="radio" name="alergia" id="alergia" value="Si" /> </td>
                                                    <td> <input type="radio" name="alergia" id="alergia" value="No"/> </td>
                                                    <td>9. HIV</td>
                                                    <td> <input type="radio" name="hiv" id="hiv" value="Si" /> </td>
                                                    <td> <input type="radio" name="hiv" id="hiv" value="No" /> </td>
                                                </tr>
                                                <tr>
                                                    <td>2. Hemorragias</td>
                                                    <td> <input type="radio" name="hemorragia" id="hemorragia" value="Si" /> </td>
                                                    <td> <input type="radio" name="hemorragia" id="hemorragia" value="No" /> </td>
                                                    <td>10. Cirugias (incluso orales)</td>
                                                    <td> <input type="radio" name="cirugia" id="cirugia" value="Si" /></td>
                                                    <td> <input type="radio" name="cirugia" id="cirugia" value="No" /> </td>
                                                </tr>
                                                <tr>
                                                    <td>3. Radioterapias</td>
                                                    <td> <input type="radio" name="radioterapia" id="radioterapia" value="Si" /> </td>
                                                    <td> <input type="radio" name="radioterapia" id="radioterapia" value="No" /> </td>
                                                    <td>11. Exodoncias</td>
                                                    <td> <input type="radio" name="exodoncia" id="exodoncia" value="Si" /> </td>
                                                    <td> <input type="radio" name="exodoncia" id="exodoncia" value="No" /> </td>
                                                </tr>
                                                <tr>
                                                    <td>4. Hipertension</td>
                                                    <td> <input type="radio" name="hipertension" id="hipertension" value="Si" /></td>
                                                    <td> <input type="radio" name="hipertension" id="hipertension" value="No" /> </td>
                                                    <td>12. Hepatitis</td>
                                                    <td> <input type="radio" name="hepatitis" id="hepatitis" value="Si" /> </td>
                                                    <td> <input type="radio" name="hepatitis" id="hepatitis" value="No" /> </td>
                                                </tr>
                                                <tr>
                                                    <td>5. Diabetes</td>
                                                    <td> <input type="radio" name="diabetes" id="diabetes" value="Si" /> </td>
                                                    <td> <input type="radio" name="diabetes" id="diabetes" value="No" /> </td>
                                                    <td>13. Patologias respiratorias</td>
                                                    <td> <input type="radio" name="pato_respi" id="pato_respi" value="Si" /> </td>
                                                    <td> <input type="radio" name="pato_respi" id="pato_respi" value="No" /> </td>
                                                </tr>
                                                <tr>
                                                    <td>6. Tratamiento Medico actual</td>
                                                    <td> <input type="radio" name="trata_med_actual" id="trata_med_actual" value="Si" /> </td>
                                                    <td> <input type="radio" name="trata_med_actual" id="trata_med_actual" value="No" /> </td>
                                                    <td>14. Convulsiones</td>
                                                    <td> <input type="radio" name="convulsion" id="convulsion" value="Si" /> </td>
                                                    <td> <input type="radio" name="convulsion" id="convulsion" value="No" /> </td>
                                                </tr>
                                                <tr>
                                                    <td>7. Toma de medicamentos</td>
                                                    <td> <input type="radio" name="toma_medicam" id="toma_medicam" value="Si" /> </td>
                                                    <td> <input type="radio" name="toma_medicam" id="toma_medicam" value="No" /> </td>
                                                    <td>15. Enfermedades orales</td>
                                                    <td> <input type="radio" name="enfer_orales" id="enfer_orales" value="Si" /> </td>
                                                    <td> <input type="radio" name="enfer_orales" id="enfer_orales" value="No" /> </td>
                                                </tr>
                                                <tr>
                                                    <td>8. Embarazo</td>
                                                    <td> <input type="radio" name="embarazo" id="embarazo" value="Si" /> </td>
                                                    <td> <input type="radio" name="embarazo" id="embarazo" value="No" /> </td>
                                                    <td>16. Enfermedades gastricas</td>
                                                    <td> <input type="radio" name="enfer_gastrica" id="enfer_gastrica" value="Si" /> </td>
                                                    <td> <input type="radio" name="enfer_gastrica" id="enfer_gastrica" value="No" /> </td>
                                                </tr>
                                                <tr>
                                                    <td>Observaciones</td>
                                                    <td colspan="5"> <input type="text" name="obser_anamnesis" id="obser_anamnesis" class="form-control" /> </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                <%}%>
                                    
                                <%if (hcOdontologia == null) {%>
                                    <div class="tab-pane" id="examenes">
                                        <div class="panel-body">
                                            <table class="table table-responsive">
                                                <tr>
                                                    <td>1. Labios</td>
                                                    <td> <input type="text" class="form-control" name="labios" id="labios" /> </td>
                                                    <td>2. Lengua</td>
                                                    <td> <input type="text" class="form-control" name="lengua" id="lengua" /> </td>
                                                </tr>
                                                <tr>
                                                    <td>3. Carrillos</td>
                                                    <td> <input type="text" class="form-control" name="carrillos" id="carrillos" /> </td>
                                                    <td>4. Piso de boca</td>
                                                    <td> <input type="text" class="form-control" name="piso_boca" id="piso_boca" /> </td>
                                                </tr>
                                                <tr>
                                                    <td>5. Paladar</td>
                                                    <td> <input type="text" class="form-control" name="paladar" id="paladar" /> </td>
                                                    <td>6. Frenillos</td>
                                                    <td> <input type="text" class="form-control" name="frenillos" id="frenillos" /> </td>
                                                </tr>
                                                <tr>
                                                    <td>Observaciones</td>
                                                    <td colspan="3"> <input type="text" class="form-control" name="obser_exam" id="obser_exam" /> </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                <%}%>
                                <%if (hcOdontologia == null) {%>
                                    <div class="tab-pane" id="protesiss">
                                        <div class="panel-body">
                                            <table class="table table-responsive">
                                                <tr>
                                                    <td>Presencia de Protesis</td>
                                                    <td>
                                                        <input type="radio" name="presen_protesis" id="presen_protesis" value="Si" onclick="descrip.disabled = false" />Si
                                                        <input type="radio" name="presen_protesis" id="presen_protesis" value="No" onclick="descrip.disabled = true"/>No
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>Descripción</td>
                                                    <td>
                                                        <input type="text" class="form-control" name="descrip" id="descrip" disabled="" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>Higiene oral</td>
                                                    <td>
                                                        B <input type="radio" name="higiene" id="higiene" value="Buena" /> &nbsp;&nbsp;
                                                        R <input type="radio" name="higiene" id="higiene" value="Regular" />&nbsp;&nbsp;
                                                        M <input type="radio" name="higiene" id="higiene" value="Mala" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>Frecuencia Cepillado</td>
                                                    <td>
                                                        1 <input type="radio" name="fr_cepill" id="fr_cepill" value="1" /> &nbsp;&nbsp;
                                                        2 <input type="radio" name="fr_cepill" id="fr_cepill" value="2" />&nbsp;&nbsp;
                                                        3 <input type="radio" name="fr_cepill" id="fr_cepill" value="3" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>Seda dental</td>
                                                    <td>
                                                        <input type="radio" name="seda_dental" id="seda_dental" value="Si" />Si
                                                        <input type="radio" name="seda_dental" id="seda_dental" value="No" />No
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                <%}%>
                                <%if (hcOdontologia == null) {%>
                                    <div class="tab-pane" id="atm">
                                        <div class="panel-body">
                                            <table class="table table-responsive">
                                                <tr>
                                                    <td>1. Dolor muscular</td>
                                                    <td>
                                                        Si <input type="radio" name="dolor_muscular" id="dolor_muscular" value="Si" />
                                                        No <input type="radio" name="dolor_muscular" id="dolor_muscular" value="No" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>2. Dolor articular</td>
                                                    <td>
                                                        Si <input type="radio" name="dolor_articular" id="dolor_articular" value="Si" />
                                                        No <input type="radio" name="dolor_articular" id="dolor_articular" value="No" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>3. Ruido articular</td>
                                                    <td>
                                                        Si <input type="radio" name="ruido_articular" id="ruido_articular" value="Si" />
                                                        No <input type="radio" name="ruido_articular" id="ruido_articular" value="No" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>4. Limitación del movimiento</td>
                                                    <td>
                                                        Si <input type="radio" name="limit_mov" id="limit_mov" value="Si" />
                                                        No <input type="radio" name="limit_mov" id="limit_mov" value="No" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>Observaciones</td>
                                                    <td><input type="text" class="form-control" name="obser_atm" id="obser_atm" /></td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                <%}%>
                                <%if (hcOdontologia != null && hcOdontologia.getF_control_placa() != null) {%>
                                    <div class="tab-pane" id="placa">
                                        <div class="panel-body">
                                            <div class="row" id="placa1">
                                                <div class="row">
                                                    <div class="diente"><!--diente 18-->
                                                        <%
                                                            JSONObject obj_18 = jsonObj.getJSONArray("pla").getJSONObject(0);
                                                            String centro_18 = String.valueOf(obj_18.getJSONArray("ubicaciones").getJSONObject(4).get("valor")).equals("SI") ? "click-green" : "";
                                                            String arriba_18 = String.valueOf(obj_18.getJSONArray("ubicaciones").getJSONObject(0).get("valor")).equals("SI") ? "click-green" : "";
                                                            String abajo_18 = String.valueOf(obj_18.getJSONArray("ubicaciones").getJSONObject(1).get("valor")).equals("SI") ? "click-green" : "";
                                                            String derecha_18 = String.valueOf(obj_18.getJSONArray("ubicaciones").getJSONObject(3).get("valor")).equals("SI") ? "click-green" : "";
                                                            String izquierda_18 = String.valueOf(obj_18.getJSONArray("ubicaciones").getJSONObject(2).get("valor")).equals("SI") ? "click-green" : "";
                                                            
                                                        %>
                                                        <input name="valor" type="hidden" value="1"><span style="margin-left: -15px">18</span>
                                                        <div class="cuadro clickPlaca <%=arriba_18%>" onclick="meterEnControlPlaca('18', 'arriba');"><input name="cuadro" type="hidden" value="1"></div>
                                                        <div class="cuadro izquierdo clickPlaca <%=izquierda_18%>" onclick="meterEnControlPlaca('18', 'izquierda');"><input name="cuadro" type="hidden" value="2"></div>
                                                        <div class="cuadro debajo clickPlaca <%=abajo_18%>" onclick="meterEnControlPlaca('18', 'abajo');"><input name="cuadro" type="hidden" value="3"></div>
                                                        <div class="cuadro derecha clickPlaca <%=derecha_18%>" onclick="meterEnControlPlaca('18', 'derecha');"><input name="cuadro" type="hidden" value="hola"></div>
                                                        <div class="centro clickPlaca <%=centro_18%>" onclick="meterEnControlPlaca('18', 'centro');"><input name="cuadro" type="hidden" value="5"></div>
                                                    </div>
                                                    <div class="diente"><!--diente 17-->
                                                        <%
                                                            JSONObject obj_17 = jsonObj.getJSONArray("pla").getJSONObject(1);
                                                            String centro_17 = String.valueOf(obj_17.getJSONArray("ubicaciones").getJSONObject(4).get("valor")).equals("SI") ? "click-green" : "";
                                                            String arriba_17 = String.valueOf(obj_17.getJSONArray("ubicaciones").getJSONObject(0).get("valor")).equals("SI") ? "click-green" : "";
                                                            String abajo_17 = String.valueOf(obj_17.getJSONArray("ubicaciones").getJSONObject(1).get("valor")).equals("SI") ? "click-green" : "";
                                                            String derecha_17 = String.valueOf(obj_17.getJSONArray("ubicaciones").getJSONObject(3).get("valor")).equals("SI") ? "click-green" : "";
                                                            String izquierda_17 = String.valueOf(obj_17.getJSONArray("ubicaciones").getJSONObject(2).get("valor")).equals("SI") ? "click-green" : "";
                                                        %>
                                                        <input name="valor" type="hidden" value="1"><span style="margin-left: -15px">17</span>
                                                        <div class="cuadro clickPlaca <%=arriba_17%>" onclick="meterEnControlPlaca('17', 'arriba');"><input name="cuadro" type="hidden" value="1"></div>
                                                        <div class="cuadro izquierdo clickPlaca <%=izquierda_17%>" onclick="meterEnControlPlaca('17', 'izquierda');"><input name="cuadro" type="hidden" value="2"></div>
                                                        <div class="cuadro debajo clickPlaca <%=abajo_17%>" onclick="meterEnControlPlaca('17', 'abajo');"><input name="cuadro" type="hidden" value="3"></div>
                                                        <div class="cuadro derecha clickPlaca <%=derecha_17%>" onclick="meterEnControlPlaca('17', 'derecha');"><input name="cuadro" type="hidden" value="hola"></div>
                                                        <div class="centro clickPlaca <%=centro_17%>" onclick="meterEnControlPlaca('17', 'centro');"><input name="cuadro" type="hidden" value="5"></div>
                                                    </div>
                                                    <div class="diente"><!--diente 16-->
                                                        <%
                                                            JSONObject obj_16 = jsonObj.getJSONArray("pla").getJSONObject(2);
                                                            String centro_16 = String.valueOf(obj_16.getJSONArray("ubicaciones").getJSONObject(4).get("valor")).equals("SI") ? "click-green" : "";
                                                            String arriba_16 = String.valueOf(obj_16.getJSONArray("ubicaciones").getJSONObject(0).get("valor")).equals("SI") ? "click-green" : "";
                                                            String abajo_16 = String.valueOf(obj_16.getJSONArray("ubicaciones").getJSONObject(1).get("valor")).equals("SI") ? "click-green" : "";
                                                            String derecha_16 = String.valueOf(obj_16.getJSONArray("ubicaciones").getJSONObject(3).get("valor")).equals("SI") ? "click-green" : "";
                                                            String izquierda_16 = String.valueOf(obj_16.getJSONArray("ubicaciones").getJSONObject(2).get("valor")).equals("SI") ? "click-green" : "";
                                                        %>
                                                        <input name="valor" type="hidden" value="1"><span style="margin-left: -15px">16</span>
                                                        <div class="cuadro clickPlaca <%=arriba_16%>" onclick="meterEnControlPlaca('16', 'arriba');"><input name="cuadro" type="hidden" value="1"></div>
                                                        <div class="cuadro izquierdo clickPlaca <%=izquierda_16%>" onclick="meterEnControlPlaca('16', 'azquierda');"><input name="cuadro" type="hidden" value="2"></div>
                                                        <div class="cuadro debajo clickPlaca <%=abajo_16%>" onclick="meterEnControlPlaca('16', 'abajo');"><input name="cuadro" type="hidden" value="3"></div>
                                                        <div class="cuadro derecha clickPlaca <%=derecha_16%>" onclick="meterEnControlPlaca('16', 'derecha');"><input name="cuadro" type="hidden" value="hola"></div>
                                                        <div class="centro clickPlaca <%=centro_16%>" onclick="meterEnControlPlaca('16', 'centro');"><input name="cuadro" type="hidden" value="5"></div>
                                                    </div>
                                                    <div class="diente"><!--diente 15-->
                                                        <%
                                                            JSONObject obj_15_55 = jsonObj.getJSONArray("pla").getJSONObject(3);
                                                            String centro_15_55 = String.valueOf(obj_15_55.getJSONArray("ubicaciones").getJSONObject(4).get("valor")).equals("SI") ? "click-green" : "";
                                                            String arriba_15_55 = String.valueOf(obj_15_55.getJSONArray("ubicaciones").getJSONObject(0).get("valor")).equals("SI") ? "click-green" : "";
                                                            String abajo_15_55 = String.valueOf(obj_15_55.getJSONArray("ubicaciones").getJSONObject(1).get("valor")).equals("SI") ? "click-green" : "";
                                                            String derecha_15_55 = String.valueOf(obj_15_55.getJSONArray("ubicaciones").getJSONObject(3).get("valor")).equals("SI") ? "click-green" : "";
                                                            String izquierda_15_55 = String.valueOf(obj_15_55.getJSONArray("ubicaciones").getJSONObject(2).get("valor")).equals("SI") ? "click-green" : "";
                                                        %>
                                                        <input name="valor" type="hidden" value="1"><span style="margin-left: -25px">15/55</span>
                                                        <div class="cuadro clickPlaca <%=arriba_15_55%>" onclick="meterEnControlPlaca('15/55', 'arriba');"><input name="cuadro" type="hidden" value="1"></div>
                                                        <div class="cuadro izquierdo clickPlaca <%=izquierda_15_55%>" onclick="meterEnControlPlaca('15/55', 'izquierda');"><input name="cuadro" type="hidden" value="2"></div>
                                                        <div class="cuadro debajo clickPlaca <%=abajo_15_55%>" onclick="meterEnControlPlaca('15/55', 'abajo');"><input name="cuadro" type="hidden" value="3"></div>
                                                        <div class="cuadro derecha clickPlaca <%=derecha_15_55%>" onclick="meterEnControlPlaca('15/55', 'derecha');"><input name="cuadro" type="hidden" value="hola"></div>
                                                        <div class="centro clickPlaca <%=centro_15_55%>" onclick="meterEnControlPlaca('15/55', 'centro');"><input name="cuadro" type="hidden" value="5"></div>
                                                    </div>
                                                    <div class="diente"><!--diente 14-->
                                                        <%
                                                            JSONObject obj_14_54 = jsonObj.getJSONArray("pla").getJSONObject(4);
                                                            String centro_14_54 = String.valueOf(obj_14_54.getJSONArray("ubicaciones").getJSONObject(4).get("valor")).equals("SI") ? "click-green" : "";
                                                            String arriba_14_54 = String.valueOf(obj_14_54.getJSONArray("ubicaciones").getJSONObject(0).get("valor")).equals("SI") ? "click-green" : "";
                                                            String abajo_14_54 = String.valueOf(obj_14_54.getJSONArray("ubicaciones").getJSONObject(1).get("valor")).equals("SI") ? "click-green" : "";
                                                            String derecha_14_54 = String.valueOf(obj_14_54.getJSONArray("ubicaciones").getJSONObject(3).get("valor")).equals("SI") ? "click-green" : "";
                                                            String izquierda_14_54 = String.valueOf(obj_14_54.getJSONArray("ubicaciones").getJSONObject(2).get("valor")).equals("SI") ? "click-green" : "";
                                                        %>
                                                        <input name="valor" type="hidden" value="1"><span style="margin-left: -25px">14/54</span>
                                                        <div class="cuadro clickPlaca <%=arriba_14_54%>" onclick="meterEnControlPlaca('14/54', 'arriba');"><input name="cuadro" type="hidden" value="1"></div>
                                                        <div class="cuadro izquierdo clickPlaca <%=izquierda_14_54%>" onclick="meterEnControlPlaca('14/54', 'izquierda');"><input name="cuadro" type="hidden" value="2"></div>
                                                        <div class="cuadro debajo clickPlaca <%=abajo_14_54%>" onclick="meterEnControlPlaca('14/54', 'abajo');"><input name="cuadro" type="hidden" value="3"></div>
                                                        <div class="cuadro derecha clickPlaca <%=derecha_14_54%>" onclick="meterEnControlPlaca('14/54', 'derecha');"><input name="cuadro" type="hidden" value="hola"></div>
                                                        <div class="centro clickPlaca <%=centro_14_54%>" onclick="meterEnControlPlaca('14/54', 'centro');"><input name="cuadro" type="hidden" value="5"></div>
                                                    </div>
                                                    <div class="diente"><!--diente 13-->
                                                        <%
                                                            JSONObject obj_13_53 = jsonObj.getJSONArray("pla").getJSONObject(5);
                                                            String centro_13_53 = String.valueOf(obj_13_53.getJSONArray("ubicaciones").getJSONObject(4).get("valor")).equals("SI") ? "click-green" : "";
                                                            String arriba_13_53 = String.valueOf(obj_13_53.getJSONArray("ubicaciones").getJSONObject(0).get("valor")).equals("SI") ? "click-green" : "";
                                                            String abajo_13_53 = String.valueOf(obj_13_53.getJSONArray("ubicaciones").getJSONObject(1).get("valor")).equals("SI") ? "click-green" : "";
                                                            String derecha_13_53 = String.valueOf(obj_13_53.getJSONArray("ubicaciones").getJSONObject(3).get("valor")).equals("SI") ? "click-green" : "";
                                                            String izquierda_13_53 = String.valueOf(obj_13_53.getJSONArray("ubicaciones").getJSONObject(2).get("valor")).equals("SI") ? "click-green" : "";
                                                        %>
                                                        <input name="valor" type="hidden" value="1"><span style="margin-left: -25px">13/53</span>
                                                        <div class="cuadro clickPlaca <%=arriba_13_53%>" onclick="meterEnControlPlaca('13/53', 'arriba');"><input name="cuadro" type="hidden" value="1"></div>
                                                        <div class="cuadro izquierdo clickPlaca <%=izquierda_13_53%>" onclick="meterEnControlPlaca('13/53', 'izquierda');"><input name="cuadro" type="hidden" value="2"></div>
                                                        <div class="cuadro debajo clickPlaca <%=abajo_13_53%>" onclick="meterEnControlPlaca('13/53', 'abajo');"><input name="cuadro" type="hidden" value="3"></div>
                                                        <div class="cuadro derecha clickPlaca <%=derecha_13_53%>" onclick="meterEnControlPlaca('13/53', 'derecha');"><input name="cuadro" type="hidden" value="hola"></div>
                                                        <div class="centro clickPlaca <%=centro_13_53%>" onclick="meterEnControlPlaca('13/53', 'centro');"><input name="cuadro" type="hidden" value="5"></div>
                                                    </div>
                                                    <div class="diente"><!--diente 12-->
                                                        <%
                                                            JSONObject obj_12_52 = jsonObj.getJSONArray("pla").getJSONObject(6);
                                                            String centro_12_52 = String.valueOf(obj_12_52.getJSONArray("ubicaciones").getJSONObject(4).get("valor")).equals("SI") ? "click-green" : "";
                                                            String arriba_12_52 = String.valueOf(obj_12_52.getJSONArray("ubicaciones").getJSONObject(0).get("valor")).equals("SI") ? "click-green" : "";
                                                            String abajo_12_52 = String.valueOf(obj_12_52.getJSONArray("ubicaciones").getJSONObject(1).get("valor")).equals("SI") ? "click-green" : "";
                                                            String derecha_12_52 = String.valueOf(obj_12_52.getJSONArray("ubicaciones").getJSONObject(3).get("valor")).equals("SI") ? "click-green" : "";
                                                            String izquierda_12_52 = String.valueOf(obj_12_52.getJSONArray("ubicaciones").getJSONObject(2).get("valor")).equals("SI") ? "click-green" : "";
                                                        %>
                                                        <input name="valor" type="hidden" value="1"><span style="margin-left: -25px">12/52</span>
                                                        <div class="cuadro clickPlaca <%=arriba_12_52%>" onclick="meterEnControlPlaca('12/52', 'arriba');"><input name="cuadro" type="hidden" value="1"></div>
                                                        <div class="cuadro izquierdo clickPlaca <%=izquierda_12_52%>" onclick="meterEnControlPlaca('12/52', 'izquierda');"><input name="cuadro" type="hidden" value="2"></div>
                                                        <div class="cuadro debajo clickPlaca <%=abajo_12_52%>" onclick="meterEnControlPlaca('12/52', 'abajo');"><input name="cuadro" type="hidden" value="3"></div>
                                                        <div class="cuadro derecha clickPlaca <%=derecha_12_52%>" onclick="meterEnControlPlaca('12/52', 'derecha');"><input name="cuadro" type="hidden" value="hola"></div>
                                                        <div class="centro clickPlaca <%=centro_12_52%>" onclick="meterEnControlPlaca('12/52', 'centro');"><input name="cuadro" type="hidden" value="5"></div>
                                                    </div>
                                                    <div class="diente"><!--diente 11-->
                                                        <%
                                                            JSONObject obj_11_51 = jsonObj.getJSONArray("pla").getJSONObject(7);
                                                            String centro_11_51 = String.valueOf(obj_11_51.getJSONArray("ubicaciones").getJSONObject(4).get("valor")).equals("SI") ? "click-green" : "";
                                                            String arriba_11_51 = String.valueOf(obj_11_51.getJSONArray("ubicaciones").getJSONObject(0).get("valor")).equals("SI") ? "click-green" : "";
                                                            String abajo_11_51 = String.valueOf(obj_11_51.getJSONArray("ubicaciones").getJSONObject(1).get("valor")).equals("SI") ? "click-green" : "";
                                                            String derecha_11_51 = String.valueOf(obj_11_51.getJSONArray("ubicaciones").getJSONObject(3).get("valor")).equals("SI") ? "click-green" : "";
                                                            String izquierda_11_51 = String.valueOf(obj_11_51.getJSONArray("ubicaciones").getJSONObject(2).get("valor")).equals("SI") ? "click-green" : "";
                                                        %>
                                                        <input name="valor" type="hidden" value="1"><span style="margin-left: -25px">11/51</span>
                                                        <div class="cuadro clickPlaca <%=arriba_11_51%>" onclick="meterEnControlPlaca('11/51', 'arriba');"><input name="cuadro" type="hidden" value="1"></div>
                                                        <div class="cuadro izquierdo clickPlaca <%=izquierda_11_51%>" onclick="meterEnControlPlaca('11/51', 'izquierda');"><input name="cuadro" type="hidden" value="2"></div>
                                                        <div class="cuadro debajo clickPlaca <%=abajo_11_51%>" onclick="meterEnControlPlaca('11/51', 'abajo');"><input name="cuadro" type="hidden" value="3"></div>
                                                        <div class="cuadro derecha clickPlaca <%=derecha_11_51%>" onclick="meterEnControlPlaca('11/51', 'derecha');"><input name="cuadro" type="hidden" value="hola"></div>
                                                        <div class="centro clickPlaca <%=centro_11_51%>" onclick="meterEnControlPlaca('11/51', 'centro');"><input name="cuadro" type="hidden" value="5"></div>
                                                    </div>
                                                    <div class="diente"><!--diente 21-->
                                                        <%
                                                            JSONObject obj_21_61 = jsonObj.getJSONArray("pla").getJSONObject(8);
                                                            String centro_21_61 = String.valueOf(obj_21_61.getJSONArray("ubicaciones").getJSONObject(4).get("valor")).equals("SI") ? "click-green" : "";
                                                            String arriba_21_61 = String.valueOf(obj_21_61.getJSONArray("ubicaciones").getJSONObject(0).get("valor")).equals("SI") ? "click-green" : "";
                                                            String abajo_21_61 = String.valueOf(obj_21_61.getJSONArray("ubicaciones").getJSONObject(1).get("valor")).equals("SI") ? "click-green" : "";
                                                            String derecha_21_61 = String.valueOf(obj_21_61.getJSONArray("ubicaciones").getJSONObject(3).get("valor")).equals("SI") ? "click-green" : "";
                                                            String izquierda_21_61 = String.valueOf(obj_21_61.getJSONArray("ubicaciones").getJSONObject(2).get("valor")).equals("SI") ? "click-green" : "";
                                                        %>
                                                        <input name="valor" type="hidden" value="1"><span style="margin-left: -25px">21/61</span>
                                                        <div class="cuadro clickPlaca <%=arriba_21_61%>" onclick="meterEnControlPlaca('21/61', 'arriba');"><input name="cuadro" type="hidden" value="1"></div>
                                                        <div class="cuadro izquierdo clickPlaca <%=izquierda_21_61%>" onclick="meterEnControlPlaca('21/61', 'izquierda');"><input name="cuadro" type="hidden" value="2"></div>
                                                        <div class="cuadro debajo clickPlaca <%=abajo_21_61%>" onclick="meterEnControlPlaca('21/61', 'abajo');"><input name="cuadro" type="hidden" value="3"></div>
                                                        <div class="cuadro derecha clickPlaca <%=derecha_21_61%>" onclick="meterEnControlPlaca('21/61', 'derecha');"><input name="cuadro" type="hidden" value="hola"></div>
                                                        <div class="centro clickPlaca <%=centro_21_61%>" onclick="meterEnControlPlaca('21/61', 'centro');"><input name="cuadro" type="hidden" value="5"></div>
                                                    </div>
                                                    <div class="diente"><!--diente 22-->
                                                        <%
                                                            JSONObject obj_22_62 = jsonObj.getJSONArray("pla").getJSONObject(9);
                                                            String centro_22_62 = String.valueOf(obj_22_62.getJSONArray("ubicaciones").getJSONObject(4).get("valor")).equals("SI") ? "click-green" : "";
                                                            String arriba_22_62 = String.valueOf(obj_22_62.getJSONArray("ubicaciones").getJSONObject(0).get("valor")).equals("SI") ? "click-green" : "";
                                                            String abajo_22_62 = String.valueOf(obj_22_62.getJSONArray("ubicaciones").getJSONObject(1).get("valor")).equals("SI") ? "click-green" : "";
                                                            String derecha_22_62 = String.valueOf(obj_22_62.getJSONArray("ubicaciones").getJSONObject(3).get("valor")).equals("SI") ? "click-green" : "";
                                                            String izquierda_22_62 = String.valueOf(obj_22_62.getJSONArray("ubicaciones").getJSONObject(2).get("valor")).equals("SI") ? "click-green" : "";
                                                        %>
                                                        <input name="valor" type="hidden" value="1"><span style="margin-left: -25px">22/62</span>
                                                        <div class="cuadro clickPlaca <%=arriba_22_62%>" onclick="meterEnControlPlaca('22/62', 'arriba');"><input name="cuadro" type="hidden" value="1"></div>
                                                        <div class="cuadro izquierdo clickPlaca <%=izquierda_22_62%>" onclick="meterEnControlPlaca('22/62', 'izquierda');"><input name="cuadro" type="hidden" value="2"></div>
                                                        <div class="cuadro debajo clickPlaca <%=abajo_22_62%>" onclick="meterEnControlPlaca('22/62', 'abajo');"><input name="cuadro" type="hidden" value="3"></div>
                                                        <div class="cuadro derecha clickPlaca <%=derecha_22_62%>" onclick="meterEnControlPlaca('22/62', 'derecha');"><input name="cuadro" type="hidden" value="hola"></div>
                                                        <div class="centro clickPlaca <%=centro_22_62%>" onclick="meterEnControlPlaca('22/62', 'centro');"><input name="cuadro" type="hidden" value="5"></div>
                                                    </div>
                                                    <div class="diente"><!--diente 23-->
                                                        <%
                                                            JSONObject obj_23_63 = jsonObj.getJSONArray("pla").getJSONObject(10);
                                                            String centro_23_63 = String.valueOf(obj_23_63.getJSONArray("ubicaciones").getJSONObject(4).get("valor")).equals("SI") ? "click-green" : "";
                                                            String arriba_23_63 = String.valueOf(obj_23_63.getJSONArray("ubicaciones").getJSONObject(0).get("valor")).equals("SI") ? "click-green" : "";
                                                            String abajo_23_63 = String.valueOf(obj_23_63.getJSONArray("ubicaciones").getJSONObject(1).get("valor")).equals("SI") ? "click-green" : "";
                                                            String derecha_23_63 = String.valueOf(obj_23_63.getJSONArray("ubicaciones").getJSONObject(3).get("valor")).equals("SI") ? "click-green" : "";
                                                            String izquierda_23_63 = String.valueOf(obj_23_63.getJSONArray("ubicaciones").getJSONObject(2).get("valor")).equals("SI") ? "click-green" : "";
                                                        %>
                                                        <input name="valor" type="hidden" value="1"><span style="margin-left: -25px">23/63</span>
                                                        <div class="cuadro clickPlaca <%=arriba_23_63%>" onclick="meterEnControlPlaca('23/63', 'arriba');"><input name="cuadro" type="hidden" value="1"></div>
                                                        <div class="cuadro izquierdo clickPlaca <%=izquierda_23_63%>" onclick="meterEnControlPlaca('23/63', 'izquierda');"><input name="cuadro" type="hidden" value="2"></div>
                                                        <div class="cuadro debajo clickPlaca <%=abajo_23_63%>" onclick="meterEnControlPlaca('23/63', 'abajo');"><input name="cuadro" type="hidden" value="3"></div>
                                                        <div class="cuadro derecha clickPlaca <%=derecha_23_63%>" onclick="meterEnControlPlaca('23/63', 'derecha');"><input name="cuadro" type="hidden" value="hola"></div>
                                                        <div class="centro clickPlaca <%=centro_23_63%>" onclick="meterEnControlPlaca('23/63', 'centro');"><input name="cuadro" type="hidden" value="5"></div>
                                                    </div>
                                                    <div class="diente"><!--diente 24-->
                                                        <%
                                                            JSONObject obj_24_64 = jsonObj.getJSONArray("pla").getJSONObject(11);
                                                            String centro_24_64 = String.valueOf(obj_24_64.getJSONArray("ubicaciones").getJSONObject(4).get("valor")).equals("SI") ? "click-green" : "";
                                                            String arriba_24_64 = String.valueOf(obj_24_64.getJSONArray("ubicaciones").getJSONObject(0).get("valor")).equals("SI") ? "click-green" : "";
                                                            String abajo_24_64 = String.valueOf(obj_24_64.getJSONArray("ubicaciones").getJSONObject(1).get("valor")).equals("SI") ? "click-green" : "";
                                                            String derecha_24_64 = String.valueOf(obj_24_64.getJSONArray("ubicaciones").getJSONObject(3).get("valor")).equals("SI") ? "click-green" : "";
                                                            String izquierda_24_64 = String.valueOf(obj_24_64.getJSONArray("ubicaciones").getJSONObject(2).get("valor")).equals("SI") ? "click-green" : "";
                                                        %>
                                                        <input name="valor" type="hidden" value="1"><span style="margin-left: -25px">24/64</span>
                                                        <div class="cuadro clickPlaca <%=arriba_24_64%>" onclick="meterEnControlPlaca('24/64', 'arriba');"><input name="cuadro" type="hidden" value="1"></div>
                                                        <div class="cuadro izquierdo clickPlaca <%=izquierda_24_64%>" onclick="meterEnControlPlaca('24/64', 'izquierda');"><input name="cuadro" type="hidden" value="2"></div>
                                                        <div class="cuadro debajo clickPlaca <%=abajo_24_64%>" onclick="meterEnControlPlaca('24/64', 'abajo');"><input name="cuadro" type="hidden" value="3"></div>
                                                        <div class="cuadro derecha clickPlaca <%=derecha_24_64%>" onclick="meterEnControlPlaca('24/64', 'derecha');"><input name="cuadro" type="hidden" value="hola"></div>
                                                        <div class="centro clickPlaca <%=centro_24_64%>" onclick="meterEnControlPlaca('24/64', 'centro');"><input name="cuadro" type="hidden" value="5"></div>
                                                    </div>
                                                    <div class="diente"><!--diente 25-->
                                                        <%
                                                            JSONObject obj_25_65 = jsonObj.getJSONArray("pla").getJSONObject(12);
                                                            String centro_25_65 = String.valueOf(obj_25_65.getJSONArray("ubicaciones").getJSONObject(4).get("valor")).equals("SI") ? "click-green" : "";
                                                            String arriba_25_65 = String.valueOf(obj_25_65.getJSONArray("ubicaciones").getJSONObject(0).get("valor")).equals("SI") ? "click-green" : "";
                                                            String abajo_25_65 = String.valueOf(obj_25_65.getJSONArray("ubicaciones").getJSONObject(1).get("valor")).equals("SI") ? "click-green" : "";
                                                            String derecha_25_65 = String.valueOf(obj_25_65.getJSONArray("ubicaciones").getJSONObject(3).get("valor")).equals("SI") ? "click-green" : "";
                                                            String izquierda_25_65 = String.valueOf(obj_25_65.getJSONArray("ubicaciones").getJSONObject(2).get("valor")).equals("SI") ? "click-green" : "";
                                                        %>
                                                        <input name="valor" type="hidden" value="1"><span style="margin-left: -25px">25/65</span>
                                                        <div class="cuadro clickPlaca <%=arriba_25_65%>" onclick="meterEnControlPlaca('25/65', 'arriba');"><input name="cuadro" type="hidden" value="1"></div>
                                                        <div class="cuadro izquierdo clickPlaca <%=izquierda_25_65%>" onclick="meterEnControlPlaca('25/65', 'izquierda');"><input name="cuadro" type="hidden" value="2"></div>
                                                        <div class="cuadro debajo clickPlaca <%=abajo_25_65%>" onclick="meterEnControlPlaca('25/65', 'abajo');"><input name="cuadro" type="hidden" value="3"></div>
                                                        <div class="cuadro derecha clickPlaca <%=derecha_25_65%>" onclick="meterEnControlPlaca('25/65', 'derecha');"><input name="cuadro" type="hidden" value="hola"></div>
                                                        <div class="centro clickPlaca <%=centro_25_65%>" onclick="meterEnControlPlaca('25/65', 'centro');"><input name="cuadro" type="hidden" value="5"></div>
                                                    </div>
                                                    <div class="diente"><!--diente 26-->
                                                        <%
                                                            JSONObject obj_26 = jsonObj.getJSONArray("pla").getJSONObject(13);
                                                            String centro_26 = String.valueOf(obj_26.getJSONArray("ubicaciones").getJSONObject(4).get("valor")).equals("SI") ? "click-green" : "";
                                                            String arriba_26 = String.valueOf(obj_26.getJSONArray("ubicaciones").getJSONObject(0).get("valor")).equals("SI") ? "click-green" : "";
                                                            String abajo_26 = String.valueOf(obj_26.getJSONArray("ubicaciones").getJSONObject(1).get("valor")).equals("SI") ? "click-green" : "";
                                                            String derecha_26 = String.valueOf(obj_26.getJSONArray("ubicaciones").getJSONObject(3).get("valor")).equals("SI") ? "click-green" : "";
                                                            String izquierda_26 = String.valueOf(obj_26.getJSONArray("ubicaciones").getJSONObject(2).get("valor")).equals("SI") ? "click-green" : "";
                                                        %>
                                                        <input name="valor" type="hidden" value="1"><span style="margin-left: -15px">26</span>
                                                        <div class="cuadro clickPlaca <%=arriba_26%>" onclick="meterEnControlPlaca('26', 'arriba');"><input name="cuadro" type="hidden" value="1"></div>
                                                        <div class="cuadro izquierdo clickPlaca <%=izquierda_26%>" onclick="meterEnControlPlaca('26', 'izquierda');"><input name="cuadro" type="hidden" value="2"></div>
                                                        <div class="cuadro debajo clickPlaca <%=abajo_26%>" onclick="meterEnControlPlaca('26', 'abajo');"><input name="cuadro" type="hidden" value="3"></div>
                                                        <div class="cuadro derecha clickPlaca <%=derecha_26%>" onclick="meterEnControlPlaca('26', 'derecha');"><input name="cuadro" type="hidden" value="hola"></div>
                                                        <div class="centro clickPlaca <%=centro_26%>" onclick="meterEnControlPlaca('26', 'centro');"><input name="cuadro" type="hidden" value="5"></div>
                                                    </div>
                                                    <div class="diente"><!--diente 27-->
                                                        <%
                                                            JSONObject obj_27 = jsonObj.getJSONArray("pla").getJSONObject(14);
                                                            String centro_27 = String.valueOf(obj_27.getJSONArray("ubicaciones").getJSONObject(4).get("valor")).equals("SI") ? "click-green" : "";
                                                            String arriba_27 = String.valueOf(obj_27.getJSONArray("ubicaciones").getJSONObject(0).get("valor")).equals("SI") ? "click-green" : "";
                                                            String abajo_27 = String.valueOf(obj_27.getJSONArray("ubicaciones").getJSONObject(1).get("valor")).equals("SI") ? "click-green" : "";
                                                            String derecha_27 = String.valueOf(obj_27.getJSONArray("ubicaciones").getJSONObject(3).get("valor")).equals("SI") ? "click-green" : "";
                                                            String izquierda_27 = String.valueOf(obj_27.getJSONArray("ubicaciones").getJSONObject(2).get("valor")).equals("SI") ? "click-green" : "";
                                                        %>
                                                        <input name="valor" type="hidden" value="1"><span style="margin-left: -15px">27</span>
                                                        <div class="cuadro clickPlaca <%=arriba_27%>" onclick="meterEnControlPlaca('27', 'arriba');"><input name="cuadro" type="hidden" value="1"></div>
                                                        <div class="cuadro izquierdo clickPlaca <%=izquierda_27%>" onclick="meterEnControlPlaca('27', 'izquierda');"><input name="cuadro" type="hidden" value="2"></div>
                                                        <div class="cuadro debajo clickPlaca <%=abajo_27%>" onclick="meterEnControlPlaca('27', 'abajo');"><input name="cuadro" type="hidden" value="3"></div>
                                                        <div class="cuadro derecha clickPlaca <%=derecha_27%>" onclick="meterEnControlPlaca('27', 'derecha');"><input name="cuadro" type="hidden" value="hola"></div>
                                                        <div class="centro clickPlaca <%=centro_27%>" onclick="meterEnControlPlaca('27', 'centro');"><input name="cuadro" type="hidden" value="5"></div>
                                                    </div>
                                                    <div class="diente"><!--diente 28-->
                                                        <%
                                                            JSONObject obj_28 = jsonObj.getJSONArray("pla").getJSONObject(15);
                                                            String centro_28 = String.valueOf(obj_28.getJSONArray("ubicaciones").getJSONObject(4).get("valor")).equals("SI") ? "click-green" : "";
                                                            String arriba_28 = String.valueOf(obj_28.getJSONArray("ubicaciones").getJSONObject(0).get("valor")).equals("SI") ? "click-green" : "";
                                                            String abajo_28 = String.valueOf(obj_28.getJSONArray("ubicaciones").getJSONObject(1).get("valor")).equals("SI") ? "click-green" : "";
                                                            String derecha_28 = String.valueOf(obj_28.getJSONArray("ubicaciones").getJSONObject(3).get("valor")).equals("SI") ? "click-green" : "";
                                                            String izquierda_28 = String.valueOf(obj_28.getJSONArray("ubicaciones").getJSONObject(2).get("valor")).equals("SI") ? "click-green" : "";
                                                        %>
                                                        <input name="valor" type="hidden" value="1"><span style="margin-left: -15px">28</span>
                                                        <div class="cuadro clickPlaca <%=arriba_28%>" onclick="meterEnControlPlaca('28', 'arriba');"><input name="cuadro" type="hidden" value="1"></div>
                                                        <div class="cuadro izquierdo clickPlaca <%=izquierda_28%>" onclick="meterEnControlPlaca('28', 'izquierda');"><input name="cuadro" type="hidden" value="2"></div>
                                                        <div class="cuadro debajo clickPlaca <%=abajo_28%>" onclick="meterEnControlPlaca('28', 'abajo');"><input name="cuadro" type="hidden" value="3"></div>
                                                        <div class="cuadro derecha clickPlaca <%=derecha_28%>" onclick="meterEnControlPlaca('28', 'derecha');"><input name="cuadro" type="hidden" value="hola"></div>
                                                        <div class="centro clickPlaca <%=centro_28%>" onclick="meterEnControlPlaca('28', 'centro');"><input name="cuadro" type="hidden" value="5"></div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="diente"><!--diente 48-->
                                                        <%
                                                            JSONObject obj_48 = jsonObj.getJSONArray("pla").getJSONObject(16);
                                                            String centro_48 = String.valueOf(obj_48.getJSONArray("ubicaciones").getJSONObject(4).get("valor")).equals("SI") ? "click-green" : "";
                                                            String arriba_48 = String.valueOf(obj_48.getJSONArray("ubicaciones").getJSONObject(0).get("valor")).equals("SI") ? "click-green" : "";
                                                            String abajo_48 = String.valueOf(obj_48.getJSONArray("ubicaciones").getJSONObject(1).get("valor")).equals("SI") ? "click-green" : "";
                                                            String derecha_48 = String.valueOf(obj_48.getJSONArray("ubicaciones").getJSONObject(3).get("valor")).equals("SI") ? "click-green" : "";
                                                            String izquierda_48 = String.valueOf(obj_48.getJSONArray("ubicaciones").getJSONObject(2).get("valor")).equals("SI") ? "click-green" : "";
                                                        %>
                                                        <input name="valor" type="hidden" value="1"><span style="margin-left: -15px">48</span>
                                                        <div class="cuadro clickPlaca <%=arriba_48%>" onclick="meterEnControlPlaca('48', 'arriba');"><input name="cuadro" type="hidden" value="1"></div>
                                                        <div class="cuadro izquierdo clickPlaca <%=izquierda_48%>" onclick="meterEnControlPlaca('48', 'izquierda');"><input name="cuadro" type="hidden" value="2"></div>
                                                        <div class="cuadro debajo clickPlaca <%=abajo_48%>" onclick="meterEnControlPlaca('48', 'abajo');"><input name="cuadro" type="hidden" value="3"></div>
                                                        <div class="cuadro derecha clickPlaca <%=derecha_48%>" onclick="meterEnControlPlaca('48', 'derecha');"><input name="cuadro" type="hidden" value="hola"></div>
                                                        <div class="centro clickPlaca <%=centro_48%>" onclick="meterEnControlPlaca('48', 'centro');"><input name="cuadro" type="hidden" value="5"></div>
                                                    </div>
                                                    <div class="diente"><!--diente 47--><span style="margin-left: -15px">47</span>
                                                        <%
                                                            JSONObject obj_47 = jsonObj.getJSONArray("pla").getJSONObject(17);
                                                            String centro_47 = String.valueOf(obj_47.getJSONArray("ubicaciones").getJSONObject(4).get("valor")).equals("SI") ? "click-green" : "";
                                                            String arriba_47 = String.valueOf(obj_47.getJSONArray("ubicaciones").getJSONObject(0).get("valor")).equals("SI") ? "click-green" : "";
                                                            String abajo_47 = String.valueOf(obj_47.getJSONArray("ubicaciones").getJSONObject(1).get("valor")).equals("SI") ? "click-green" : "";
                                                            String derecha_47 = String.valueOf(obj_47.getJSONArray("ubicaciones").getJSONObject(3).get("valor")).equals("SI") ? "click-green" : "";
                                                            String izquierda_47 = String.valueOf(obj_47.getJSONArray("ubicaciones").getJSONObject(2).get("valor")).equals("SI") ? "click-green" : "";
                                                        %>
                                                        <input name="valor" type="hidden" value="1">
                                                        <div class="cuadro clickPlaca <%=arriba_47%>" onclick="meterEnControlPlaca('47', 'arriba');"><input name="cuadro" type="hidden" value="1"></div>
                                                        <div class="cuadro izquierdo clickPlaca <%=izquierda_47%>" onclick="meterEnControlPlaca('47', 'izquierda');"><input name="cuadro" type="hidden" value="2"></div>
                                                        <div class="cuadro debajo clickPlaca <%=abajo_47%>" onclick="meterEnControlPlaca('47', 'abajo');"><input name="cuadro" type="hidden" value="3"></div>
                                                        <div class="cuadro derecha clickPlaca <%=derecha_47%>" onclick="meterEnControlPlaca('47', 'derecha');"><input name="cuadro" type="hidden" value="hola"></div>
                                                        <div class="centro clickPlaca <%=centro_47%>" onclick="meterEnControlPlaca('47', 'centro');"><input name="cuadro" type="hidden" value="5"></div>
                                                    </div>
                                                    <div class="diente"><!--diente 46-->
                                                        <%
                                                            JSONObject obj_46 = jsonObj.getJSONArray("pla").getJSONObject(18);
                                                            String centro_46 = String.valueOf(obj_46.getJSONArray("ubicaciones").getJSONObject(4).get("valor")).equals("SI") ? "click-green" : "";
                                                            String arriba_46 = String.valueOf(obj_46.getJSONArray("ubicaciones").getJSONObject(0).get("valor")).equals("SI") ? "click-green" : "";
                                                            String abajo_46 = String.valueOf(obj_46.getJSONArray("ubicaciones").getJSONObject(1).get("valor")).equals("SI") ? "click-green" : "";
                                                            String derecha_46 = String.valueOf(obj_46.getJSONArray("ubicaciones").getJSONObject(3).get("valor")).equals("SI") ? "click-green" : "";
                                                            String izquierda_46 = String.valueOf(obj_46.getJSONArray("ubicaciones").getJSONObject(2).get("valor")).equals("SI") ? "click-green" : "";
                                                        %>
                                                        <input name="valor" type="hidden" value="1"><span style="margin-left: -15px">46</span>
                                                        <div class="cuadro clickPlaca <%=arriba_46%>" onclick="meterEnControlPlaca('46', 'arriba');"><input name="cuadro" type="hidden" value="1"></div>
                                                        <div class="cuadro izquierdo clickPlaca <%=izquierda_46%>" onclick="meterEnControlPlaca('46', 'izquierda');"><input name="cuadro" type="hidden" value="2"></div>
                                                        <div class="cuadro debajo clickPlaca <%=abajo_46%>" onclick="meterEnControlPlaca('46', 'abajo');"><input name="cuadro" type="hidden" value="3"></div>
                                                        <div class="cuadro derecha clickPlaca <%=derecha_46%>" onclick="meterEnControlPlaca('46', 'derecha');"><input name="cuadro" type="hidden" value="hola"></div>
                                                        <div class="centro clickPlaca <%=centro_46%>" onclick="meterEnControlPlaca('46', 'centro');"><input name="cuadro" type="hidden" value="5"></div>
                                                    </div>
                                                    <div class="diente"><!--diente 45-->
                                                        <%
                                                            JSONObject obj_45_85 = jsonObj.getJSONArray("pla").getJSONObject(19);
                                                            String centro_45_85 = String.valueOf(obj_45_85.getJSONArray("ubicaciones").getJSONObject(4).get("valor")).equals("SI") ? "click-green" : "";
                                                            String arriba_45_85 = String.valueOf(obj_45_85.getJSONArray("ubicaciones").getJSONObject(0).get("valor")).equals("SI") ? "click-green" : "";
                                                            String abajo_45_85 = String.valueOf(obj_45_85.getJSONArray("ubicaciones").getJSONObject(1).get("valor")).equals("SI") ? "click-green" : "";
                                                            String derecha_45_85 = String.valueOf(obj_45_85.getJSONArray("ubicaciones").getJSONObject(3).get("valor")).equals("SI") ? "click-green" : "";
                                                            String izquierda_45_85 = String.valueOf(obj_45_85.getJSONArray("ubicaciones").getJSONObject(2).get("valor")).equals("SI") ? "click-green" : "";
                                                        %>
                                                        <input name="valor" type="hidden" value="1"><span style="margin-left: -25px">45/85</span>
                                                        <div class="cuadro clickPlaca <%=arriba_45_85%>" onclick="meterEnControlPlaca('45/85', 'arriba');"><input name="cuadro" type="hidden" value="1"></div>
                                                        <div class="cuadro izquierdo clickPlaca <%=izquierda_45_85%>" onclick="meterEnControlPlaca('45/85', 'izquierda');"><input name="cuadro" type="hidden" value="2"></div>
                                                        <div class="cuadro debajo clickPlaca <%=abajo_45_85%>" onclick="meterEnControlPlaca('45/85', 'abajo');"><input name="cuadro" type="hidden" value="3"></div>
                                                        <div class="cuadro derecha clickPlaca <%=derecha_45_85%>" onclick="meterEnControlPlaca('45/85', 'derecha');"><input name="cuadro" type="hidden" value="hola"></div>
                                                        <div class="centro clickPlaca <%=centro_45_85%>" onclick="meterEnControlPlaca('45/85', 'centro');"><input name="cuadro" type="hidden" value="5"></div>
                                                    </div>
                                                    <div class="diente"><!--diente 44-->
                                                        <%
                                                            JSONObject obj_44_84 = jsonObj.getJSONArray("pla").getJSONObject(20);
                                                            String centro_44_84 = String.valueOf(obj_44_84.getJSONArray("ubicaciones").getJSONObject(4).get("valor")).equals("SI") ? "click-green" : "";
                                                            String arriba_44_84 = String.valueOf(obj_44_84.getJSONArray("ubicaciones").getJSONObject(0).get("valor")).equals("SI") ? "click-green" : "";
                                                            String abajo_44_84 = String.valueOf(obj_44_84.getJSONArray("ubicaciones").getJSONObject(1).get("valor")).equals("SI") ? "click-green" : "";
                                                            String derecha_44_84 = String.valueOf(obj_44_84.getJSONArray("ubicaciones").getJSONObject(3).get("valor")).equals("SI") ? "click-green" : "";
                                                            String izquierda_44_84 = String.valueOf(obj_44_84.getJSONArray("ubicaciones").getJSONObject(2).get("valor")).equals("SI") ? "click-green" : "";
                                                        %>
                                                        <input name="valor" type="hidden" value="1"><span style="margin-left: -25px">44/84</span>
                                                        <div class="cuadro clickPlaca <%=arriba_44_84%>" onclick="meterEnControlPlaca('44/84', 'arriba');"><input name="cuadro" type="hidden" value="1"></div>
                                                        <div class="cuadro izquierdo clickPlaca <%=izquierda_44_84%>" onclick="meterEnControlPlaca('44/84', 'izquierda');"><input name="cuadro" type="hidden" value="2"></div>
                                                        <div class="cuadro debajo clickPlaca <%=abajo_44_84%>" onclick="meterEnControlPlaca('44/84', 'abajo');"><input name="cuadro" type="hidden" value="3"></div>
                                                        <div class="cuadro derecha clickPlaca <%=derecha_44_84%>" onclick="meterEnControlPlaca('44/84', 'derecha');"><input name="cuadro" type="hidden" value="hola"></div>
                                                        <div class="centro clickPlaca <%=centro_44_84%>" onclick="meterEnControlPlaca('44/84', 'centro');"><input name="cuadro" type="hidden" value="5"></div>
                                                    </div>
                                                    <div class="diente"><!--diente 43-->
                                                        <%
                                                            JSONObject obj_43_83 = jsonObj.getJSONArray("pla").getJSONObject(21);
                                                            String centro_43_83 = String.valueOf(obj_43_83.getJSONArray("ubicaciones").getJSONObject(4).get("valor")).equals("SI") ? "click-green" : "";
                                                            String arriba_43_83 = String.valueOf(obj_43_83.getJSONArray("ubicaciones").getJSONObject(0).get("valor")).equals("SI") ? "click-green" : "";
                                                            String abajo_43_83 = String.valueOf(obj_43_83.getJSONArray("ubicaciones").getJSONObject(1).get("valor")).equals("SI") ? "click-green" : "";
                                                            String derecha_43_83 = String.valueOf(obj_43_83.getJSONArray("ubicaciones").getJSONObject(3).get("valor")).equals("SI") ? "click-green" : "";
                                                            String izquierda_43_83 = String.valueOf(obj_43_83.getJSONArray("ubicaciones").getJSONObject(2).get("valor")).equals("SI") ? "click-green" : "";
                                                        %>
                                                        <input name="valor" type="hidden" value="1"><span style="margin-left: -25px">43/83</span>
                                                        <div class="cuadro clickPlaca <%=arriba_43_83%>" onclick="meterEnControlPlaca('43/83', 'arriba');"><input name="cuadro" type="hidden" value="1"></div>
                                                        <div class="cuadro izquierdo clickPlaca <%=izquierda_43_83%>" onclick="meterEnControlPlaca('43/83', 'izquierda');"><input name="cuadro" type="hidden" value="2"></div>
                                                        <div class="cuadro debajo clickPlaca <%=abajo_43_83%>" onclick="meterEnControlPlaca('43/83', 'abajo');"><input name="cuadro" type="hidden" value="3"></div>
                                                        <div class="cuadro derecha clickPlaca <%=derecha_43_83%>" onclick="meterEnControlPlaca('43/83', 'derecha');"><input name="cuadro" type="hidden" value="hola"></div>
                                                        <div class="centro clickPlaca <%=centro_43_83%>" onclick="meterEnControlPlaca('43/83', 'centro');"><input name="cuadro" type="hidden" value="5"></div>
                                                    </div>
                                                    <div class="diente"><!--diente 42-->
                                                        <%
                                                            JSONObject obj_42_82 = jsonObj.getJSONArray("pla").getJSONObject(22);
                                                            String centro_42_82 = String.valueOf(obj_42_82.getJSONArray("ubicaciones").getJSONObject(4).get("valor")).equals("SI") ? "click-green" : "";
                                                            String arriba_42_82 = String.valueOf(obj_42_82.getJSONArray("ubicaciones").getJSONObject(0).get("valor")).equals("SI") ? "click-green" : "";
                                                            String abajo_42_82 = String.valueOf(obj_42_82.getJSONArray("ubicaciones").getJSONObject(1).get("valor")).equals("SI") ? "click-green" : "";
                                                            String derecha_42_82 = String.valueOf(obj_42_82.getJSONArray("ubicaciones").getJSONObject(3).get("valor")).equals("SI") ? "click-green" : "";
                                                            String izquierda_42_82 = String.valueOf(obj_42_82.getJSONArray("ubicaciones").getJSONObject(2).get("valor")).equals("SI") ? "click-green" : "";
                                                        %>
                                                        <input name="valor" type="hidden" value="1"><span style="margin-left: -25px">42/82</span>
                                                        <div class="cuadro clickPlaca <%=arriba_42_82%>" onclick="meterEnControlPlaca('42/82', 'arriba');"><input name="cuadro" type="hidden" value="1"></div>
                                                        <div class="cuadro izquierdo clickPlaca <%=izquierda_42_82%>" onclick="meterEnControlPlaca('42/82', 'izquierda');"><input name="cuadro" type="hidden" value="2"></div>
                                                        <div class="cuadro debajo clickPlaca <%=abajo_42_82%>" onclick="meterEnControlPlaca('42/82', 'abajo');"><input name="cuadro" type="hidden" value="3"></div>
                                                        <div class="cuadro derecha clickPlaca <%=derecha_42_82%>" onclick="meterEnControlPlaca('42/82', 'derecha');"><input name="cuadro" type="hidden" value="hola"></div>
                                                        <div class="centro clickPlaca <%=centro_42_82%>" onclick="meterEnControlPlaca('42/82', 'centro');"><input name="cuadro" type="hidden" value="5"></div>
                                                    </div>
                                                    <div class="diente"><!--diente 41-->
                                                        <%
                                                            JSONObject obj_41_81 = jsonObj.getJSONArray("pla").getJSONObject(23);
                                                            String centro_41_81 = String.valueOf(obj_41_81.getJSONArray("ubicaciones").getJSONObject(4).get("valor")).equals("SI") ? "click-green" : "";
                                                            String arriba_41_81 = String.valueOf(obj_41_81.getJSONArray("ubicaciones").getJSONObject(0).get("valor")).equals("SI") ? "click-green" : "";
                                                            String abajo_41_81 = String.valueOf(obj_41_81.getJSONArray("ubicaciones").getJSONObject(1).get("valor")).equals("SI") ? "click-green" : "";
                                                            String derecha_41_81 = String.valueOf(obj_41_81.getJSONArray("ubicaciones").getJSONObject(3).get("valor")).equals("SI") ? "click-green" : "";
                                                            String izquierda_41_81 = String.valueOf(obj_41_81.getJSONArray("ubicaciones").getJSONObject(2).get("valor")).equals("SI") ? "click-green" : "";
                                                        %>
                                                        <input name="valor" type="hidden" value="1"><span style="margin-left: -25px">41/81</span>
                                                        <div class="cuadro clickPlaca <%=arriba_41_81%>" onclick="meterEnControlPlaca('41/81', 'arriba');"><input name="cuadro" type="hidden" value="1"></div>
                                                        <div class="cuadro izquierdo clickPlaca <%=izquierda_41_81%>" onclick="meterEnControlPlaca('41/81', 'izquierda');"><input name="cuadro" type="hidden" value="2"></div>
                                                        <div class="cuadro debajo clickPlaca <%=abajo_41_81%>" onclick="meterEnControlPlaca('41/81', 'abajo');"><input name="cuadro" type="hidden" value="3"></div>
                                                        <div class="cuadro derecha clickPlaca <%=derecha_41_81%>" onclick="meterEnControlPlaca('41/81', 'derecha');"><input name="cuadro" type="hidden" value="hola"></div>
                                                        <div class="centro clickPlaca <%=centro_41_81%>" onclick="meterEnControlPlaca('41/81', 'centro');"><input name="cuadro" type="hidden" value="5"></div>
                                                    </div>
                                                    <div class="diente"><!--diente 31-->
                                                        <%
                                                            JSONObject obj_31_71 = jsonObj.getJSONArray("pla").getJSONObject(24);
                                                            String centro_31_71 = String.valueOf(obj_31_71.getJSONArray("ubicaciones").getJSONObject(4).get("valor")).equals("SI") ? "click-green" : "";
                                                            String arriba_31_71 = String.valueOf(obj_31_71.getJSONArray("ubicaciones").getJSONObject(0).get("valor")).equals("SI") ? "click-green" : "";
                                                            String abajo_31_71 = String.valueOf(obj_31_71.getJSONArray("ubicaciones").getJSONObject(1).get("valor")).equals("SI") ? "click-green" : "";
                                                            String derecha_31_71 = String.valueOf(obj_31_71.getJSONArray("ubicaciones").getJSONObject(3).get("valor")).equals("SI") ? "click-green" : "";
                                                            String izquierda_31_71 = String.valueOf(obj_31_71.getJSONArray("ubicaciones").getJSONObject(2).get("valor")).equals("SI") ? "click-green" : "";
                                                        %>
                                                        <input name="valor" type="hidden" value="1"/><span style="margin-left: -25px">31/71</span>
                                                        <div class="cuadro clickPlaca <%=arriba_31_71%>" onclick="meterEnControlPlaca('31/71', 'arriba');"><input name="cuadro" type="hidden" value="1"></div>
                                                        <div class="cuadro izquierdo clickPlaca <%=izquierda_31_71%>" onclick="meterEnControlPlaca('31/71', 'izquierda');"><input name="cuadro" type="hidden" value="2"></div>
                                                        <div class="cuadro debajo clickPlaca <%=abajo_31_71%>" onclick="meterEnControlPlaca('31/71', 'abajo');"><input name="cuadro" type="hidden" value="3"></div>
                                                        <div class="cuadro derecha clickPlaca <%=derecha_31_71%>" onclick="meterEnControlPlaca('31/71', 'derecha');"><input name="cuadro" type="hidden" value="hola"></div>
                                                        <div class="centro clickPlaca <%=centro_31_71%>" onclick="meterEnControlPlaca('31/71', 'centro');"><input name="cuadro" type="hidden" value="5"></div>
                                                    </div>
                                                    <div class="diente"><!--diente 32-->
                                                        <%
                                                            JSONObject obj_32_72 = jsonObj.getJSONArray("pla").getJSONObject(25);
                                                            String centro_32_72 = String.valueOf(obj_32_72.getJSONArray("ubicaciones").getJSONObject(4).get("valor")).equals("SI") ? "click-green" : "";
                                                            String arriba_32_72 = String.valueOf(obj_32_72.getJSONArray("ubicaciones").getJSONObject(0).get("valor")).equals("SI") ? "click-green" : "";
                                                            String abajo_32_72 = String.valueOf(obj_32_72.getJSONArray("ubicaciones").getJSONObject(1).get("valor")).equals("SI") ? "click-green" : "";
                                                            String derecha_32_72 = String.valueOf(obj_32_72.getJSONArray("ubicaciones").getJSONObject(3).get("valor")).equals("SI") ? "click-green" : "";
                                                            String izquierda_32_72 = String.valueOf(obj_32_72.getJSONArray("ubicaciones").getJSONObject(2).get("valor")).equals("SI") ? "click-green" : "";
                                                        %>
                                                        <input name="valor" type="hidden" value="1"><span style="margin-left: -25px">32/72</span>
                                                        <div class="cuadro clickPlaca <%=arriba_32_72%>" onclick="meterEnControlPlaca('32/72', 'arriba');"><input name="cuadro" type="hidden" value="1"></div>
                                                        <div class="cuadro izquierdo clickPlaca <%=izquierda_32_72%>" onclick="meterEnControlPlaca('32/72', 'izquierda');"><input name="cuadro" type="hidden" value="2"></div>
                                                        <div class="cuadro debajo clickPlaca <%=abajo_32_72%>" onclick="meterEnControlPlaca('32/72', 'abajo');"><input name="cuadro" type="hidden" value="3"></div>
                                                        <div class="cuadro derecha clickPlaca <%=derecha_32_72%>" onclick="meterEnControlPlaca('32/72', 'derecha');"><input name="cuadro" type="hidden" value="hola"></div>
                                                        <div class="centro clickPlaca <%=centro_32_72%>" onclick="meterEnControlPlaca('32/72', 'centro');"><input name="cuadro" type="hidden" value="5"></div>
                                                    </div>
                                                    <div class="diente"><!--diente 33-->
                                                        <%
                                                            JSONObject obj_33_73 = jsonObj.getJSONArray("pla").getJSONObject(26);
                                                            String centro_33_73 = String.valueOf(obj_33_73.getJSONArray("ubicaciones").getJSONObject(4).get("valor")).equals("SI") ? "click-green" : "";
                                                            String arriba_33_73 = String.valueOf(obj_33_73.getJSONArray("ubicaciones").getJSONObject(0).get("valor")).equals("SI") ? "click-green" : "";
                                                            String abajo_33_73 = String.valueOf(obj_33_73.getJSONArray("ubicaciones").getJSONObject(1).get("valor")).equals("SI") ? "click-green" : "";
                                                            String derecha_33_73 = String.valueOf(obj_33_73.getJSONArray("ubicaciones").getJSONObject(3).get("valor")).equals("SI") ? "click-green" : "";
                                                            String izquierda_33_73 = String.valueOf(obj_33_73.getJSONArray("ubicaciones").getJSONObject(2).get("valor")).equals("SI") ? "click-green" : "";
                                                        %>
                                                        <input name="valor" type="hidden" value="1"><span style="margin-left: -25px">33/73</span>
                                                        <div class="cuadro clickPlaca <%=arriba_33_73%>" onclick="meterEnControlPlaca('33/73', 'arriba');"><input name="cuadro" type="hidden" value="1"></div>
                                                        <div class="cuadro izquierdo clickPlaca <%=izquierda_33_73%>" onclick="meterEnControlPlaca('33/73', 'izquierda');"><input name="cuadro" type="hidden" value="2"></div>
                                                        <div class="cuadro debajo clickPlaca <%=abajo_33_73%>" onclick="meterEnControlPlaca('33/73', 'abajo');"><input name="cuadro" type="hidden" value="3"></div>
                                                        <div class="cuadro derecha clickPlaca <%=derecha_33_73%>" onclick="meterEnControlPlaca('33/73', 'derecha');"><input name="cuadro" type="hidden" value="hola"></div>
                                                        <div class="centro clickPlaca <%=centro_33_73%>" onclick="meterEnControlPlaca('33/73', 'centro');"><input name="cuadro" type="hidden" value="5"></div>
                                                    </div>
                                                    <div class="diente"><!--diente 34-->
                                                        <%
                                                            JSONObject obj_34_74 = jsonObj.getJSONArray("pla").getJSONObject(27);
                                                            String centro_34_74 = String.valueOf(obj_34_74.getJSONArray("ubicaciones").getJSONObject(4).get("valor")).equals("SI") ? "click-green" : "";
                                                            String arriba_34_74 = String.valueOf(obj_34_74.getJSONArray("ubicaciones").getJSONObject(0).get("valor")).equals("SI") ? "click-green" : "";
                                                            String abajo_34_74 = String.valueOf(obj_34_74.getJSONArray("ubicaciones").getJSONObject(1).get("valor")).equals("SI") ? "click-green" : "";
                                                            String derecha_34_74 = String.valueOf(obj_34_74.getJSONArray("ubicaciones").getJSONObject(3).get("valor")).equals("SI") ? "click-green" : "";
                                                            String izquierda_34_74 = String.valueOf(obj_34_74.getJSONArray("ubicaciones").getJSONObject(2).get("valor")).equals("SI") ? "click-green" : "";
                                                        %>
                                                        <input name="valor" type="hidden" value="1"><span style="margin-left: -25px">34/74</span>
                                                        <div class="cuadro clickPlaca <%=arriba_34_74%>" onclick="meterEnControlPlaca('34/74', 'arriba');"><input name="cuadro" type="hidden" value="1"></div>
                                                        <div class="cuadro izquierdo clickPlaca <%=izquierda_34_74%>" onclick="meterEnControlPlaca('34/74', 'izquierda');"><input name="cuadro" type="hidden" value="2"></div>
                                                        <div class="cuadro debajo clickPlaca <%=abajo_34_74%>" onclick="meterEnControlPlaca('34/74', 'abajo');"><input name="cuadro" type="hidden" value="3"></div>
                                                        <div class="cuadro derecha clickPlaca" onclick="meterEnControlPlaca('34/74', 'derecha');"><input name="cuadro" type="hidden" value="hola"></div>
                                                        <div class="centro clickPlaca <%=centro_34_74%>" onclick="meterEnControlPlaca('34/74', 'centro');"><input name="cuadro" type="hidden" value="5"></div>
                                                    </div>
                                                    <div class="diente"><!--diente 35-->
                                                        <%
                                                            JSONObject obj_35_75 = jsonObj.getJSONArray("pla").getJSONObject(28);
                                                            String centro_35_75 = String.valueOf(obj_35_75.getJSONArray("ubicaciones").getJSONObject(4).get("valor")).equals("SI") ? "click-green" : "";
                                                            String arriba_35_75 = String.valueOf(obj_35_75.getJSONArray("ubicaciones").getJSONObject(0).get("valor")).equals("SI") ? "click-green" : "";
                                                            String abajo_35_75 = String.valueOf(obj_35_75.getJSONArray("ubicaciones").getJSONObject(1).get("valor")).equals("SI") ? "click-green" : "";
                                                            String derecha_35_75 = String.valueOf(obj_35_75.getJSONArray("ubicaciones").getJSONObject(3).get("valor")).equals("SI") ? "click-green" : "";
                                                            String izquierda_35_75 = String.valueOf(obj_35_75.getJSONArray("ubicaciones").getJSONObject(2).get("valor")).equals("SI") ? "click-green" : "";
                                                        %>
                                                        <input name="valor" type="hidden" value="1"><span style="margin-left: -25px">35/75</span>
                                                        <div class="cuadro clickPlaca <%=arriba_35_75%>" onclick="meterEnControlPlaca('35/75', 'arriba');"><input name="cuadro" type="hidden" value="1"></div>
                                                        <div class="cuadro izquierdo clickPlaca <%=izquierda_35_75%>" onclick="meterEnControlPlaca('35/75', 'izquierda');"><input name="cuadro" type="hidden" value="2"></div>
                                                        <div class="cuadro debajo clickPlaca <%=abajo_35_75%>" onclick="meterEnControlPlaca('35/75', 'abajo');"><input name="cuadro" type="hidden" value="3"></div>
                                                        <div class="cuadro derecha clickPlaca <%=derecha_35_75%>" onclick="meterEnControlPlaca('35/75', 'derecha');"><input name="cuadro" type="hidden" value="hola"></div>
                                                        <div class="centro clickPlaca <%=centro_35_75%>" onclick="meterEnControlPlaca('35/75', 'centro');"><input name="cuadro" type="hidden" value="5"></div>
                                                    </div>
                                                    <div class="diente"><!--diente 36-->
                                                        <%
                                                            JSONObject obj_36 = jsonObj.getJSONArray("pla").getJSONObject(29);
                                                            String centro_36 = String.valueOf(obj_36.getJSONArray("ubicaciones").getJSONObject(4).get("valor")).equals("SI") ? "click-green" : "";
                                                            String arriba_36 = String.valueOf(obj_36.getJSONArray("ubicaciones").getJSONObject(0).get("valor")).equals("SI") ? "click-green" : "";
                                                            String abajo_36 = String.valueOf(obj_36.getJSONArray("ubicaciones").getJSONObject(1).get("valor")).equals("SI") ? "click-green" : "";
                                                            String derecha_36 = String.valueOf(obj_36.getJSONArray("ubicaciones").getJSONObject(3).get("valor")).equals("SI") ? "click-green" : "";
                                                            String izquierda_36 = String.valueOf(obj_36.getJSONArray("ubicaciones").getJSONObject(2).get("valor")).equals("SI") ? "click-green" : "";
                                                        %>
                                                        <input name="valor" type="hidden" value="1"><span style="margin-left: -15px">36</span>
                                                        <div class="cuadro clickPlaca <%=arriba_36%>" onclick="meterEnControlPlaca('36', 'arriba');"><input name="cuadro" type="hidden" value="1"></div>
                                                        <div class="cuadro izquierdo clickPlaca <%=izquierda_36%>" onclick="meterEnControlPlaca('36', 'izquierda');"><input name="cuadro" type="hidden" value="2"></div>
                                                        <div class="cuadro debajo clickPlaca <%=abajo_36%>" onclick="meterEnControlPlaca('36', 'abajo');"><input name="cuadro" type="hidden" value="3"></div>
                                                        <div class="cuadro derecha clickPlaca <%=derecha_36%>" onclick="meterEnControlPlaca('36', 'derecha');"><input name="cuadro" type="hidden" value="hola"></div>
                                                        <div class="centro clickPlaca <%=centro_36%>" onclick="meterEnControlPlaca('36', 'centro');"><input name="cuadro" type="hidden" value="5"></div>
                                                    </div>
                                                    <div class="diente"><!--diente 37-->
                                                        <%
                                                            JSONObject obj_37 = jsonObj.getJSONArray("pla").getJSONObject(30);
                                                            String centro_37 = String.valueOf(obj_37.getJSONArray("ubicaciones").getJSONObject(4).get("valor")).equals("SI") ? "click-green" : "";
                                                            String arriba_37 = String.valueOf(obj_37.getJSONArray("ubicaciones").getJSONObject(0).get("valor")).equals("SI") ? "click-green" : "";
                                                            String abajo_37 = String.valueOf(obj_37.getJSONArray("ubicaciones").getJSONObject(1).get("valor")).equals("SI") ? "click-green" : "";
                                                            String derecha_37 = String.valueOf(obj_37.getJSONArray("ubicaciones").getJSONObject(3).get("valor")).equals("SI") ? "click-green" : "";
                                                            String izquierda_37 = String.valueOf(obj_37.getJSONArray("ubicaciones").getJSONObject(2).get("valor")).equals("SI") ? "click-green" : "";
                                                        %>
                                                        <input name="valor" type="hidden" value="1"><span style="margin-left: -15px">37</span>
                                                        <div class="cuadro clickPlaca <%=arriba_37%>" onclick="meterEnControlPlaca('37', 'arriba');"><input name="cuadro" type="hidden" value="1"></div>
                                                        <div class="cuadro izquierdo clickPlaca <%=izquierda_37%>" onclick="meterEnControlPlaca('37', 'izquierda');"><input name="cuadro" type="hidden" value="2"></div>
                                                        <div class="cuadro debajo clickPlaca <%=abajo_37%>" onclick="meterEnControlPlaca('37', 'abajo');"><input name="cuadro" type="hidden" value="3"></div>
                                                        <div class="cuadro derecha clickPlaca <%=derecha_37%>" onclick="meterEnControlPlaca('37', 'derecha');"><input name="cuadro" type="hidden" value="hola"></div>
                                                        <div class="centro clickPlaca <%=centro_37%>" onclick="meterEnControlPlaca('37', 'centro');"><input name="cuadro" type="hidden" value="5"></div>
                                                    </div>
                                                    <div class="diente"><!--diente 38-->
                                                        <%
                                                            JSONObject obj_38 = jsonObj.getJSONArray("pla").getJSONObject(31);
                                                            String centro_38 = String.valueOf(obj_38.getJSONArray("ubicaciones").getJSONObject(4).get("valor")).equals("SI") ? "click-green" : "";
                                                            String arriba_38 = String.valueOf(obj_38.getJSONArray("ubicaciones").getJSONObject(0).get("valor")).equals("SI") ? "click-green" : "";
                                                            String abajo_38 = String.valueOf(obj_38.getJSONArray("ubicaciones").getJSONObject(1).get("valor")).equals("SI") ? "click-green" : "";
                                                            String derecha_38 = String.valueOf(obj_38.getJSONArray("ubicaciones").getJSONObject(3).get("valor")).equals("SI") ? "click-green" : "";
                                                            String izquierda_38 = String.valueOf(obj_38.getJSONArray("ubicaciones").getJSONObject(2).get("valor")).equals("SI") ? "click-green" : "";
                                                        %>
                                                        <input name="valor" type="hidden" value="1"><span style="margin-left: -15px">38</span>
                                                        <div class="cuadro clickPlaca <%=arriba_38%>" onclick="meterEnControlPlaca('38', 'arriba');"><input name="cuadro" type="hidden" value="1"></div>
                                                        <div class="cuadro izquierdo clickPlaca <%=izquierda_38%>" onclick="meterEnControlPlaca('38', 'izquierda');"><input name="cuadro" type="hidden" value="2"></div>
                                                        <div class="cuadro debajo clickPlaca <%=abajo_38%>" onclick="meterEnControlPlaca('38', 'abajo');"><input name="cuadro" type="hidden" value="3"></div>
                                                        <div class="cuadro derecha clickPlaca <%=derecha_38%>" onclick="meterEnControlPlaca('38', 'derecha');"><input name="cuadro" type="hidden" value="hola"></div>
                                                        <div class="centro clickPlaca <%=centro_38%>" onclick="meterEnControlPlaca('38', 'centro');"><input name="cuadro" type="hidden" value="5"></div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                <%} else {%>
                                    <div class="tab-pane" id="placa">
                                        <div class="panel-body">
                                            <div class="row" id="placa1">
                                                <div class="row">
                                                    <div class="diente"><!--diente 18-->
                                                        <input name="valor" type="hidden" value="1"><span style="margin-left: -15px">18</span>
                                                        <div class="cuadro clickPlaca" onclick="meterEnControlPlaca('18', 'arriba');"><input name="cuadro" type="hidden" value="1"></div>
                                                        <div class="cuadro izquierdo clickPlaca" onclick="meterEnControlPlaca('18', 'izquierda');"><input name="cuadro" type="hidden" value="2"></div>
                                                        <div class="cuadro debajo clickPlaca" onclick="meterEnControlPlaca('18', 'abajo');"><input name="cuadro" type="hidden" value="3"></div>
                                                        <div class="cuadro derecha clickPlaca" onclick="meterEnControlPlaca('18', 'derecha');"><input name="cuadro" type="hidden" value="hola"></div>
                                                        <div class="centro clickPlaca" onclick="meterEnControlPlaca('18', 'centro');"><input name="cuadro" type="hidden" value="5"></div>
                                                    </div>
                                                    <div class="diente"><!--diente 17-->
                                                        <input name="valor" type="hidden" value="1"><span style="margin-left: -15px">17</span>
                                                        <div class="cuadro clickPlaca" onclick="meterEnControlPlaca('17', 'arriba');"><input name="cuadro" type="hidden" value="1"></div>
                                                        <div class="cuadro izquierdo clickPlaca" onclick="meterEnControlPlaca('17', 'izquierda');"><input name="cuadro" type="hidden" value="2"></div>
                                                        <div class="cuadro debajo clickPlaca" onclick="meterEnControlPlaca('17', 'abajo');"><input name="cuadro" type="hidden" value="3"></div>
                                                        <div class="cuadro derecha clickPlaca" onclick="meterEnControlPlaca('17', 'derecha');"><input name="cuadro" type="hidden" value="hola"></div>
                                                        <div class="centro clickPlaca" onclick="meterEnControlPlaca('17', 'centro');"><input name="cuadro" type="hidden" value="5"></div>
                                                    </div>
                                                    <div class="diente"><!--diente 16-->
                                                        <input name="valor" type="hidden" value="1"><span style="margin-left: -15px">16</span>
                                                        <div class="cuadro clickPlaca" onclick="meterEnControlPlaca('16', 'arriba');"><input name="cuadro" type="hidden" value="1"></div>
                                                        <div class="cuadro izquierdo clickPlaca" onclick="meterEnControlPlaca('16', 'azquierda');"><input name="cuadro" type="hidden" value="2"></div>
                                                        <div class="cuadro debajo clickPlaca" onclick="meterEnControlPlaca('16', 'abajo');"><input name="cuadro" type="hidden" value="3"></div>
                                                        <div class="cuadro derecha clickPlaca" onclick="meterEnControlPlaca('16', 'derecha');"><input name="cuadro" type="hidden" value="hola"></div>
                                                        <div class="centro clickPlaca" onclick="meterEnControlPlaca('16', 'centro');"><input name="cuadro" type="hidden" value="5"></div>
                                                    </div>
                                                    <div class="diente"><!--diente 15-->
                                                        <input name="valor" type="hidden" value="1"><span style="margin-left: -25px">15/55</span>
                                                        <div class="cuadro clickPlaca" onclick="meterEnControlPlaca('15/55', 'arriba');"><input name="cuadro" type="hidden" value="1"></div>
                                                        <div class="cuadro izquierdo clickPlaca" onclick="meterEnControlPlaca('15/55', 'izquierda');"><input name="cuadro" type="hidden" value="2"></div>
                                                        <div class="cuadro debajo clickPlaca" onclick="meterEnControlPlaca('15/55', 'abajo');"><input name="cuadro" type="hidden" value="3"></div>
                                                        <div class="cuadro derecha clickPlaca" onclick="meterEnControlPlaca('15/55', 'derecha');"><input name="cuadro" type="hidden" value="hola"></div>
                                                        <div class="centro clickPlaca" onclick="meterEnControlPlaca('15/55', 'centro');"><input name="cuadro" type="hidden" value="5"></div>
                                                    </div>
                                                    <div class="diente"><!--diente 14-->
                                                        <input name="valor" type="hidden" value="1"><span style="margin-left: -25px">14/54</span>
                                                        <div class="cuadro clickPlaca" onclick="meterEnControlPlaca('14/54', 'arriba');"><input name="cuadro" type="hidden" value="1"></div>
                                                        <div class="cuadro izquierdo clickPlaca" onclick="meterEnControlPlaca('14/54', 'izquierda');"><input name="cuadro" type="hidden" value="2"></div>
                                                        <div class="cuadro debajo clickPlaca" onclick="meterEnControlPlaca('14/54', 'abajo');"><input name="cuadro" type="hidden" value="3"></div>
                                                        <div class="cuadro derecha clickPlaca" onclick="meterEnControlPlaca('14/54', 'derecha');"><input name="cuadro" type="hidden" value="hola"></div>
                                                        <div class="centro clickPlaca" onclick="meterEnControlPlaca('14/54', 'centro');"><input name="cuadro" type="hidden" value="5"></div>
                                                    </div>
                                                    <div class="diente"><!--diente 13-->
                                                        <input name="valor" type="hidden" value="1"><span style="margin-left: -25px">13/53</span>
                                                        <div class="cuadro clickPlaca" onclick="meterEnControlPlaca('13/53', 'arriba');"><input name="cuadro" type="hidden" value="1"></div>
                                                        <div class="cuadro izquierdo clickPlaca" onclick="meterEnControlPlaca('13/53', 'izquierda');"><input name="cuadro" type="hidden" value="2"></div>
                                                        <div class="cuadro debajo clickPlaca" onclick="meterEnControlPlaca('13/53', 'abajo');"><input name="cuadro" type="hidden" value="3"></div>
                                                        <div class="cuadro derecha clickPlaca" onclick="meterEnControlPlaca('13/53', 'derecha');"><input name="cuadro" type="hidden" value="hola"></div>
                                                        <div class="centro clickPlaca" onclick="meterEnControlPlaca('13/53', 'centro');"><input name="cuadro" type="hidden" value="5"></div>
                                                    </div>
                                                    <div class="diente"><!--diente 12-->
                                                        <input name="valor" type="hidden" value="1"><span style="margin-left: -25px">12/52</span>
                                                        <div class="cuadro clickPlaca" onclick="meterEnControlPlaca('12/52', 'arriba');"><input name="cuadro" type="hidden" value="1"></div>
                                                        <div class="cuadro izquierdo clickPlaca" onclick="meterEnControlPlaca('12/52', 'izquierda');"><input name="cuadro" type="hidden" value="2"></div>
                                                        <div class="cuadro debajo clickPlaca" onclick="meterEnControlPlaca('12/52', 'abajo');"><input name="cuadro" type="hidden" value="3"></div>
                                                        <div class="cuadro derecha clickPlaca" onclick="meterEnControlPlaca('12/52', 'derecha');"><input name="cuadro" type="hidden" value="hola"></div>
                                                        <div class="centro clickPlaca" onclick="meterEnControlPlaca('12/52', 'centro');"><input name="cuadro" type="hidden" value="5"></div>
                                                    </div>
                                                    <div class="diente"><!--diente 11-->
                                                        <input name="valor" type="hidden" value="1"><span style="margin-left: -25px">11/51</span>
                                                        <div class="cuadro clickPlaca" onclick="meterEnControlPlaca('11/51', 'arriba');"><input name="cuadro" type="hidden" value="1"></div>
                                                        <div class="cuadro izquierdo clickPlaca" onclick="meterEnControlPlaca('11/51', 'izquierda');"><input name="cuadro" type="hidden" value="2"></div>
                                                        <div class="cuadro debajo clickPlaca" onclick="meterEnControlPlaca('11/51', 'abajo');"><input name="cuadro" type="hidden" value="3"></div>
                                                        <div class="cuadro derecha clickPlaca" onclick="meterEnControlPlaca('11/51', 'derecha');"><input name="cuadro" type="hidden" value="hola"></div>
                                                        <div class="centro clickPlaca" onclick="meterEnControlPlaca('11/51', 'centro');"><input name="cuadro" type="hidden" value="5"></div>
                                                    </div>
                                                    <div class="diente"><!--diente 21-->
                                                        <input name="valor" type="hidden" value="1"><span style="margin-left: -25px">21/61</span>
                                                        <div class="cuadro clickPlaca" onclick="meterEnControlPlaca('21/61', 'arriba');"><input name="cuadro" type="hidden" value="1"></div>
                                                        <div class="cuadro izquierdo clickPlaca" onclick="meterEnControlPlaca('21/61', 'izquierda');"><input name="cuadro" type="hidden" value="2"></div>
                                                        <div class="cuadro debajo clickPlaca" onclick="meterEnControlPlaca('21/61', 'abajo');"><input name="cuadro" type="hidden" value="3"></div>
                                                        <div class="cuadro derecha clickPlaca" onclick="meterEnControlPlaca('21/61', 'derecha');"><input name="cuadro" type="hidden" value="hola"></div>
                                                        <div class="centro clickPlaca" onclick="meterEnControlPlaca('21/61', 'centro');"><input name="cuadro" type="hidden" value="5"></div>
                                                    </div>
                                                    <div class="diente"><!--diente 22-->
                                                        <input name="valor" type="hidden" value="1"><span style="margin-left: -25px">22/62</span>
                                                        <div class="cuadro clickPlaca" onclick="meterEnControlPlaca('22/62', 'arriba');"><input name="cuadro" type="hidden" value="1"></div>
                                                        <div class="cuadro izquierdo clickPlaca" onclick="meterEnControlPlaca('22/62', 'izquierda');"><input name="cuadro" type="hidden" value="2"></div>
                                                        <div class="cuadro debajo clickPlaca" onclick="meterEnControlPlaca('22/62', 'abajo');"><input name="cuadro" type="hidden" value="3"></div>
                                                        <div class="cuadro derecha clickPlaca" onclick="meterEnControlPlaca('22/62', 'derecha');"><input name="cuadro" type="hidden" value="hola"></div>
                                                        <div class="centro clickPlaca" onclick="meterEnControlPlaca('22/62', 'centro');"><input name="cuadro" type="hidden" value="5"></div>
                                                    </div>
                                                    <div class="diente"><!--diente 23-->
                                                        <input name="valor" type="hidden" value="1"><span style="margin-left: -25px">23/63</span>
                                                        <div class="cuadro clickPlaca" onclick="meterEnControlPlaca('23/63', 'arriba');"><input name="cuadro" type="hidden" value="1"></div>
                                                        <div class="cuadro izquierdo clickPlaca" onclick="meterEnControlPlaca('23/63', 'izquierda');"><input name="cuadro" type="hidden" value="2"></div>
                                                        <div class="cuadro debajo clickPlaca" onclick="meterEnControlPlaca('23/63', 'abajo');"><input name="cuadro" type="hidden" value="3"></div>
                                                        <div class="cuadro derecha clickPlaca" onclick="meterEnControlPlaca('23/63', 'derecha');"><input name="cuadro" type="hidden" value="hola"></div>
                                                        <div class="centro clickPlaca" onclick="meterEnControlPlaca('23/63', 'centro');"><input name="cuadro" type="hidden" value="5"></div>
                                                    </div>
                                                    <div class="diente"><!--diente 24-->
                                                        <input name="valor" type="hidden" value="1"><span style="margin-left: -25px">24/64</span>
                                                        <div class="cuadro clickPlaca" onclick="meterEnControlPlaca('24/64', 'arriba');"><input name="cuadro" type="hidden" value="1"></div>
                                                        <div class="cuadro izquierdo clickPlaca" onclick="meterEnControlPlaca('24/64', 'izquierda');"><input name="cuadro" type="hidden" value="2"></div>
                                                        <div class="cuadro debajo clickPlaca" onclick="meterEnControlPlaca('24/64', 'abajo');"><input name="cuadro" type="hidden" value="3"></div>
                                                        <div class="cuadro derecha clickPlaca" onclick="meterEnControlPlaca('24/64', 'derecha');"><input name="cuadro" type="hidden" value="hola"></div>
                                                        <div class="centro clickPlaca" onclick="meterEnControlPlaca('24/64', 'centro');"><input name="cuadro" type="hidden" value="5"></div>
                                                    </div>
                                                    <div class="diente"><!--diente 25-->
                                                        <input name="valor" type="hidden" value="1"><span style="margin-left: -25px">25/65</span>
                                                        <div class="cuadro clickPlaca" onclick="meterEnControlPlaca('25/65', 'arriba');"><input name="cuadro" type="hidden" value="1"></div>
                                                        <div class="cuadro izquierdo clickPlaca" onclick="meterEnControlPlaca('25/65', 'izquierda');"><input name="cuadro" type="hidden" value="2"></div>
                                                        <div class="cuadro debajo clickPlaca" onclick="meterEnControlPlaca('25/65', 'abajo');"><input name="cuadro" type="hidden" value="3"></div>
                                                        <div class="cuadro derecha clickPlaca" onclick="meterEnControlPlaca('25/65', 'derecha');"><input name="cuadro" type="hidden" value="hola"></div>
                                                        <div class="centro clickPlaca" onclick="meterEnControlPlaca('25/65', 'centro');"><input name="cuadro" type="hidden" value="5"></div>
                                                    </div>
                                                    <div class="diente"><!--diente 26-->
                                                        <input name="valor" type="hidden" value="1"><span style="margin-left: -15px">26</span>
                                                        <div class="cuadro clickPlaca" onclick="meterEnControlPlaca('26', 'arriba');"><input name="cuadro" type="hidden" value="1"></div>
                                                        <div class="cuadro izquierdo clickPlaca" onclick="meterEnControlPlaca('26', 'izquierda');"><input name="cuadro" type="hidden" value="2"></div>
                                                        <div class="cuadro debajo clickPlaca" onclick="meterEnControlPlaca('26', 'abajo');"><input name="cuadro" type="hidden" value="3"></div>
                                                        <div class="cuadro derecha clickPlaca" onclick="meterEnControlPlaca('26', 'derecha');"><input name="cuadro" type="hidden" value="hola"></div>
                                                        <div class="centro clickPlaca" onclick="meterEnControlPlaca('26', 'centro');"><input name="cuadro" type="hidden" value="5"></div>
                                                    </div>
                                                    <div class="diente"><!--diente 27-->
                                                        <input name="valor" type="hidden" value="1"><span style="margin-left: -15px">27</span>
                                                        <div class="cuadro clickPlaca" onclick="meterEnControlPlaca('27', 'arriba');"><input name="cuadro" type="hidden" value="1"></div>
                                                        <div class="cuadro izquierdo clickPlaca" onclick="meterEnControlPlaca('27', 'izquierda');"><input name="cuadro" type="hidden" value="2"></div>
                                                        <div class="cuadro debajo clickPlaca" onclick="meterEnControlPlaca('27', 'abajo');"><input name="cuadro" type="hidden" value="3"></div>
                                                        <div class="cuadro derecha clickPlaca" onclick="meterEnControlPlaca('27', 'derecha');"><input name="cuadro" type="hidden" value="hola"></div>
                                                        <div class="centro clickPlaca" onclick="meterEnControlPlaca('27', 'centro');"><input name="cuadro" type="hidden" value="5"></div>
                                                    </div>
                                                    <div class="diente"><!--diente 28-->
                                                        <input name="valor" type="hidden" value="1"><span style="margin-left: -15px">28</span>
                                                        <div class="cuadro clickPlaca" onclick="meterEnControlPlaca('28', 'arriba');"><input name="cuadro" type="hidden" value="1"></div>
                                                        <div class="cuadro izquierdo clickPlaca" onclick="meterEnControlPlaca('28', 'izquierda');"><input name="cuadro" type="hidden" value="2"></div>
                                                        <div class="cuadro debajo clickPlaca" onclick="meterEnControlPlaca('28', 'abajo');"><input name="cuadro" type="hidden" value="3"></div>
                                                        <div class="cuadro derecha clickPlaca" onclick="meterEnControlPlaca('28', 'derecha');"><input name="cuadro" type="hidden" value="hola"></div>
                                                        <div class="centro clickPlaca" onclick="meterEnControlPlaca('28', 'centro');"><input name="cuadro" type="hidden" value="5"></div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="diente"><!--diente 48-->
                                                        <input name="valor" type="hidden" value="1"><span style="margin-left: -15px">48</span>
                                                        <div class="cuadro clickPlaca" onclick="meterEnControlPlaca('48', 'arriba');"><input name="cuadro" type="hidden" value="1"></div>
                                                        <div class="cuadro izquierdo clickPlaca" onclick="meterEnControlPlaca('48', 'izquierda');"><input name="cuadro" type="hidden" value="2"></div>
                                                        <div class="cuadro debajo clickPlaca" onclick="meterEnControlPlaca('48', 'abajo');"><input name="cuadro" type="hidden" value="3"></div>
                                                        <div class="cuadro derecha clickPlaca" onclick="meterEnControlPlaca('48', 'derecha');"><input name="cuadro" type="hidden" value="hola"></div>
                                                        <div class="centro clickPlaca" onclick="meterEnControlPlaca('48', 'centro');"><input name="cuadro" type="hidden" value="5"></div>
                                                    </div>
                                                    <div class="diente"><!--diente 47--><span style="margin-left: -15px">47</span>
                                                        <input name="valor" type="hidden" value="1">
                                                        <div class="cuadro clickPlaca" onclick="meterEnControlPlaca('47', 'arriba');"><input name="cuadro" type="hidden" value="1"></div>
                                                        <div class="cuadro izquierdo clickPlaca" onclick="meterEnControlPlaca('47', 'izquierda');"><input name="cuadro" type="hidden" value="2"></div>
                                                        <div class="cuadro debajo clickPlaca" onclick="meterEnControlPlaca('47', 'abajo');"><input name="cuadro" type="hidden" value="3"></div>
                                                        <div class="cuadro derecha clickPlaca" onclick="meterEnControlPlaca('47', 'derecha');"><input name="cuadro" type="hidden" value="hola"></div>
                                                        <div class="centro clickPlaca" onclick="meterEnControlPlaca('47', 'centro');"><input name="cuadro" type="hidden" value="5"></div>
                                                    </div>
                                                    <div class="diente"><!--diente 46-->
                                                        <input name="valor" type="hidden" value="1"><span style="margin-left: -15px">46</span>
                                                        <div class="cuadro clickPlaca" onclick="meterEnControlPlaca('46', 'arriba');"><input name="cuadro" type="hidden" value="1"></div>
                                                        <div class="cuadro izquierdo clickPlaca" onclick="meterEnControlPlaca('46', 'izquierda');"><input name="cuadro" type="hidden" value="2"></div>
                                                        <div class="cuadro debajo clickPlaca" onclick="meterEnControlPlaca('46', 'abajo');"><input name="cuadro" type="hidden" value="3"></div>
                                                        <div class="cuadro derecha clickPlaca" onclick="meterEnControlPlaca('46', 'derecha');"><input name="cuadro" type="hidden" value="hola"></div>
                                                        <div class="centro clickPlaca" onclick="meterEnControlPlaca('46', 'centro');"><input name="cuadro" type="hidden" value="5"></div>
                                                    </div>
                                                    <div class="diente"><!--diente 45-->
                                                        <input name="valor" type="hidden" value="1"><span style="margin-left: -25px">45/85</span>
                                                        <div class="cuadro clickPlaca" onclick="meterEnControlPlaca('45/85', 'arriba');"><input name="cuadro" type="hidden" value="1"></div>
                                                        <div class="cuadro izquierdo clickPlaca" onclick="meterEnControlPlaca('45/85', 'izquierda');"><input name="cuadro" type="hidden" value="2"></div>
                                                        <div class="cuadro debajo clickPlaca" onclick="meterEnControlPlaca('45/85', 'abajo');"><input name="cuadro" type="hidden" value="3"></div>
                                                        <div class="cuadro derecha clickPlaca" onclick="meterEnControlPlaca('45/85', 'derecha');"><input name="cuadro" type="hidden" value="hola"></div>
                                                        <div class="centro clickPlaca" onclick="meterEnControlPlaca('45/85', 'centro');"><input name="cuadro" type="hidden" value="5"></div>
                                                    </div>
                                                    <div class="diente"><!--diente 44-->
                                                        <input name="valor" type="hidden" value="1"><span style="margin-left: -25px">44/84</span>
                                                        <div class="cuadro clickPlaca" onclick="meterEnControlPlaca('44/84', 'arriba');"><input name="cuadro" type="hidden" value="1"></div>
                                                        <div class="cuadro izquierdo clickPlaca" onclick="meterEnControlPlaca('44/84', 'izquierda');"><input name="cuadro" type="hidden" value="2"></div>
                                                        <div class="cuadro debajo clickPlaca" onclick="meterEnControlPlaca('44/84', 'abajo');"><input name="cuadro" type="hidden" value="3"></div>
                                                        <div class="cuadro derecha clickPlaca" onclick="meterEnControlPlaca('44/84', 'derecha');"><input name="cuadro" type="hidden" value="hola"></div>
                                                        <div class="centro clickPlaca" onclick="meterEnControlPlaca('44/84', 'centro');"><input name="cuadro" type="hidden" value="5"></div>
                                                    </div>
                                                    <div class="diente"><!--diente 43-->
                                                        <input name="valor" type="hidden" value="1"><span style="margin-left: -25px">43/83</span>
                                                        <div class="cuadro clickPlaca" onclick="meterEnControlPlaca('43/83', 'arriba');"><input name="cuadro" type="hidden" value="1"></div>
                                                        <div class="cuadro izquierdo clickPlaca" onclick="meterEnControlPlaca('43/83', 'izquierda');"><input name="cuadro" type="hidden" value="2"></div>
                                                        <div class="cuadro debajo clickPlaca" onclick="meterEnControlPlaca('43/83', 'abajo');"><input name="cuadro" type="hidden" value="3"></div>
                                                        <div class="cuadro derecha clickPlaca" onclick="meterEnControlPlaca('43/83', 'derecha');"><input name="cuadro" type="hidden" value="hola"></div>
                                                        <div class="centro clickPlaca" onclick="meterEnControlPlaca('43/83', 'centro');"><input name="cuadro" type="hidden" value="5"></div>
                                                    </div>
                                                    <div class="diente"><!--diente 42-->
                                                        <input name="valor" type="hidden" value="1"><span style="margin-left: -25px">42/82</span>
                                                        <div class="cuadro clickPlaca" onclick="meterEnControlPlaca('42/82', 'arriba');"><input name="cuadro" type="hidden" value="1"></div>
                                                        <div class="cuadro izquierdo clickPlaca" onclick="meterEnControlPlaca('42/82', 'izquierda');"><input name="cuadro" type="hidden" value="2"></div>
                                                        <div class="cuadro debajo clickPlaca" onclick="meterEnControlPlaca('42/82', 'abajo');"><input name="cuadro" type="hidden" value="3"></div>
                                                        <div class="cuadro derecha clickPlaca" onclick="meterEnControlPlaca('42/82', 'derecha');"><input name="cuadro" type="hidden" value="hola"></div>
                                                        <div class="centro clickPlaca" onclick="meterEnControlPlaca('42/82', 'centro');"><input name="cuadro" type="hidden" value="5"></div>
                                                    </div>
                                                    <div class="diente"><!--diente 41-->
                                                        <input name="valor" type="hidden" value="1"><span style="margin-left: -25px">41/81</span>
                                                        <div class="cuadro clickPlaca" onclick="meterEnControlPlaca('41/81', 'arriba');"><input name="cuadro" type="hidden" value="1"></div>
                                                        <div class="cuadro izquierdo clickPlaca" onclick="meterEnControlPlaca('41/81', 'izquierda');"><input name="cuadro" type="hidden" value="2"></div>
                                                        <div class="cuadro debajo clickPlaca" onclick="meterEnControlPlaca('41/81', 'abajo');"><input name="cuadro" type="hidden" value="3"></div>
                                                        <div class="cuadro derecha clickPlaca" onclick="meterEnControlPlaca('41/81', 'derecha');"><input name="cuadro" type="hidden" value="hola"></div>
                                                        <div class="centro clickPlaca" onclick="meterEnControlPlaca('41/81', 'centro');"><input name="cuadro" type="hidden" value="5"></div>
                                                    </div>
                                                    <div class="diente"><!--diente 31-->
                                                        <input name="valor" type="hidden" value="1"/><span style="margin-left: -25px">31/71</span>
                                                        <div class="cuadro clickPlaca" onclick="meterEnControlPlaca('31/71', 'arriba');"><input name="cuadro" type="hidden" value="1"></div>
                                                        <div class="cuadro izquierdo clickPlaca" onclick="meterEnControlPlaca('31/71', 'izquierda');"><input name="cuadro" type="hidden" value="2"></div>
                                                        <div class="cuadro debajo clickPlaca" onclick="meterEnControlPlaca('31/71', 'abajo');"><input name="cuadro" type="hidden" value="3"></div>
                                                        <div class="cuadro derecha clickPlaca" onclick="meterEnControlPlaca('31/71', 'derecha');"><input name="cuadro" type="hidden" value="hola"></div>
                                                        <div class="centro clickPlaca" onclick="meterEnControlPlaca('31/71', 'centro');"><input name="cuadro" type="hidden" value="5"></div>
                                                    </div>
                                                    <div class="diente"><!--diente 32-->
                                                        <input name="valor" type="hidden" value="1"><span style="margin-left: -25px">32/72</span>
                                                        <div class="cuadro clickPlaca" onclick="meterEnControlPlaca('32/72', 'arriba');"><input name="cuadro" type="hidden" value="1"></div>
                                                        <div class="cuadro izquierdo clickPlaca" onclick="meterEnControlPlaca('32/72', 'izquierda');"><input name="cuadro" type="hidden" value="2"></div>
                                                        <div class="cuadro debajo clickPlaca" onclick="meterEnControlPlaca('32/72', 'abajo');"><input name="cuadro" type="hidden" value="3"></div>
                                                        <div class="cuadro derecha clickPlaca" onclick="meterEnControlPlaca('32/72', 'derecha');"><input name="cuadro" type="hidden" value="hola"></div>
                                                        <div class="centro clickPlaca" onclick="meterEnControlPlaca('32/72', 'centro');"><input name="cuadro" type="hidden" value="5"></div>
                                                    </div>
                                                    <div class="diente"><!--diente 33-->
                                                        <input name="valor" type="hidden" value="1"><span style="margin-left: -25px">33/73</span>
                                                        <div class="cuadro clickPlaca" onclick="meterEnControlPlaca('33/73', 'arriba');"><input name="cuadro" type="hidden" value="1"></div>
                                                        <div class="cuadro izquierdo clickPlaca" onclick="meterEnControlPlaca('33/73', 'izquierda');"><input name="cuadro" type="hidden" value="2"></div>
                                                        <div class="cuadro debajo clickPlaca" onclick="meterEnControlPlaca('33/73', 'abajo');"><input name="cuadro" type="hidden" value="3"></div>
                                                        <div class="cuadro derecha clickPlaca" onclick="meterEnControlPlaca('33/73', 'derecha');"><input name="cuadro" type="hidden" value="hola"></div>
                                                        <div class="centro clickPlaca" onclick="meterEnControlPlaca('33/73', 'centro');"><input name="cuadro" type="hidden" value="5"></div>
                                                    </div>
                                                    <div class="diente"><!--diente 34-->
                                                        <input name="valor" type="hidden" value="1"><span style="margin-left: -25px">34/74</span>
                                                        <div class="cuadro clickPlaca" onclick="meterEnControlPlaca('34/74', 'arriba');"><input name="cuadro" type="hidden" value="1"></div>
                                                        <div class="cuadro izquierdo clickPlaca" onclick="meterEnControlPlaca('34/74', 'izquierda');"><input name="cuadro" type="hidden" value="2"></div>
                                                        <div class="cuadro debajo clickPlaca" onclick="meterEnControlPlaca('34/74', 'abajo');"><input name="cuadro" type="hidden" value="3"></div>
                                                        <div class="cuadro derecha clickPlaca" onclick="meterEnControlPlaca('34/74', 'derecha');"><input name="cuadro" type="hidden" value="hola"></div>
                                                        <div class="centro clickPlaca" onclick="meterEnControlPlaca('34/74', 'centro');"><input name="cuadro" type="hidden" value="5"></div>
                                                    </div>
                                                    <div class="diente"><!--diente 35-->
                                                        <input name="valor" type="hidden" value="1"><span style="margin-left: -25px">35/75</span>
                                                        <div class="cuadro clickPlaca" onclick="meterEnControlPlaca('35/75', 'arriba');"><input name="cuadro" type="hidden" value="1"></div>
                                                        <div class="cuadro izquierdo clickPlaca" onclick="meterEnControlPlaca('35/75', 'izquierda');"><input name="cuadro" type="hidden" value="2"></div>
                                                        <div class="cuadro debajo clickPlaca" onclick="meterEnControlPlaca('35/75', 'abajo');"><input name="cuadro" type="hidden" value="3"></div>
                                                        <div class="cuadro derecha clickPlaca" onclick="meterEnControlPlaca('35/75', 'derecha');"><input name="cuadro" type="hidden" value="hola"></div>
                                                        <div class="centro clickPlaca" onclick="meterEnControlPlaca('35/75', 'centro');"><input name="cuadro" type="hidden" value="5"></div>
                                                    </div>
                                                    <div class="diente"><!--diente 36-->
                                                        <input name="valor" type="hidden" value="1"><span style="margin-left: -15px">36</span>
                                                        <div class="cuadro clickPlaca" onclick="meterEnControlPlaca('36', 'arriba');"><input name="cuadro" type="hidden" value="1"></div>
                                                        <div class="cuadro izquierdo clickPlaca" onclick="meterEnControlPlaca('36', 'izquierda');"><input name="cuadro" type="hidden" value="2"></div>
                                                        <div class="cuadro debajo clickPlaca" onclick="meterEnControlPlaca('36', 'abajo');"><input name="cuadro" type="hidden" value="3"></div>
                                                        <div class="cuadro derecha clickPlaca" onclick="meterEnControlPlaca('36', 'derecha');"><input name="cuadro" type="hidden" value="hola"></div>
                                                        <div class="centro clickPlaca" onclick="meterEnControlPlaca('36', 'centro');"><input name="cuadro" type="hidden" value="5"></div>
                                                    </div>
                                                    <div class="diente"><!--diente 37-->
                                                        <input name="valor" type="hidden" value="1"><span style="margin-left: -15px">37</span>
                                                        <div class="cuadro clickPlaca" onclick="meterEnControlPlaca('37', 'arriba');"><input name="cuadro" type="hidden" value="1"></div>
                                                        <div class="cuadro izquierdo clickPlaca" onclick="meterEnControlPlaca('37', 'izquierda');"><input name="cuadro" type="hidden" value="2"></div>
                                                        <div class="cuadro debajo clickPlaca" onclick="meterEnControlPlaca('37', 'abajo');"><input name="cuadro" type="hidden" value="3"></div>
                                                        <div class="cuadro derecha clickPlaca" onclick="meterEnControlPlaca('37', 'derecha');"><input name="cuadro" type="hidden" value="hola"></div>
                                                        <div class="centro clickPlaca" onclick="meterEnControlPlaca('37', 'centro');"><input name="cuadro" type="hidden" value="5"></div>
                                                    </div>
                                                    <div class="diente"><!--diente 38-->
                                                        <input name="valor" type="hidden" value="1"><span style="margin-left: -15px">38</span>
                                                        <div class="cuadro clickPlaca" onclick="meterEnControlPlaca('38', 'arriba');"><input name="cuadro" type="hidden" value="1"></div>
                                                        <div class="cuadro izquierdo clickPlaca" onclick="meterEnControlPlaca('38', 'izquierda');"><input name="cuadro" type="hidden" value="2"></div>
                                                        <div class="cuadro debajo clickPlaca" onclick="meterEnControlPlaca('38', 'abajo');"><input name="cuadro" type="hidden" value="3"></div>
                                                        <div class="cuadro derecha clickPlaca" onclick="meterEnControlPlaca('38', 'derecha');"><input name="cuadro" type="hidden" value="hola"></div>
                                                        <div class="centro clickPlaca" onclick="meterEnControlPlaca('38', 'centro');"><input name="cuadro" type="hidden" value="5"></div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                <%}%>
                                
                                <%if (hcOdontologia == null) {%>
                                    <div class="tab-pane" id="odontograma">
                                        <div class="panel-body">
                                            <div class="row" id="placa2">
                                                <div class="row">

                                                    <div id="controls" class="panel panel-default">
                                                        <div class="panel-body">
                                                            <div class="btn-group" data-toggle="buttons">
                                                                <label id="cariado" class="btn btn-rounded">
                                                                    <input type="radio" name="options" id="option1" autocomplete="off" checked>Cariado</label>
                                                                <label id="obturado" class="btn btn-rounded">
                                                                    <input type="radio" name="options" id="option2" autocomplete="off"> Obturado
                                                                </label>
                                                                <label id="exodonciarealizada" class="btn btn-rounded">
                                                                    <input type="radio" name="options" id="option3" autocomplete="off"> Exodoncia realizada
                                                                </label>
                                                                <label id="exodonciasimpleindicada" class="btn btn-rounded">
                                                                    <input type="radio" name="options" id="option4" autocomplete="off"> Exodoncia simple indicada
                                                                </label>
                                                                <label id="exodonciaquirrugicaindicada" class="btn btn-rounded">
                                                                    <input type="radio" name="options" id="option5" autocomplete="off"> Exodoncia quirrugica indicada
                                                                </label>
                                                                <label id="sinerupcionar" class="btn btn-rounded">
                                                                    <input type="radio" name="options" id="option6" autocomplete="off"> Sin erupcionar
                                                                </label>
                                                                <label id="endodonciarealizada" class="btn btn-rounded">
                                                                    <input type="radio" name="options" id="option7" autocomplete="off"> Endodoncia realizada
                                                                </label>
                                                                <label id="endodonciaindicada" class="btn btn-rounded">
                                                                    <input type="radio" name="options" id="option8" autocomplete="off"> Endodoncia indicada
                                                                </label>
                                                                <label id="sellantepresente" class="btn btn-rounded">
                                                                    <input type="radio" name="options" id="option9" autocomplete="off"> Sellante presente
                                                                </label>
                                                                <label id="sellanteindicado" class="btn btn-rounded">
                                                                    <input type="radio" name="options" id="option10" autocomplete="off"> Sellante indicado
                                                                </label>
                                                                <label id="erosion" class="btn btn-rounded">
                                                                    <input type="radio" name="options" id="option11" autocomplete="off"> Erosion
                                                                </label>
                                                                <label id="procedimientorealizado" class="btn btn-rounded">
                                                                    <input type="radio" name="options" id="option12" autocomplete="off"> Procedimiento realizado
                                                                </label>
                                                                <label id="coronabuenestado" class="btn btn-rounded">
                                                                    <input type="radio" name="options" id="option13" autocomplete="off"> Corona buen estado
                                                                </label>
                                                                <label id="coronamalestado" class="btn btn-rounded">
                                                                    <input type="radio" name="options" id="option14" autocomplete="off"> Corona mal estado
                                                                </label>
                                                                <label id="provisionalbuenestado" class="btn btn-rounded">
                                                                    <input type="radio" name="options" id="option15" autocomplete="off"> Provisional buen estado
                                                                </label>
                                                                <label id="provisionalmalestado" class="btn btn-rounded">
                                                                    <input type="radio" name="options" id="option16" autocomplete="off"> Provisional mal estado
                                                                </label>
                                                                <label id="nucleobuenestado" class="btn btn-rounded">
                                                                    <input type="radio" name="options" id="option17" autocomplete="off"> Nucleo buen estado
                                                                </label>
                                                                <label id="nucleomalestado" class="btn btn-rounded">
                                                                    <input type="radio" name="options" id="option18" autocomplete="off"> Nucleo mal estado
                                                                </label>
                                                                <label id="removiblebuenestado" class="btn btn-rounded">
                                                                    <input type="radio" name="options" id="option19" autocomplete="off"> Removible buen estado
                                                                </label>
                                                                <label id="removiblemalestado" class="btn btn-rounded">
                                                                    <input type="radio" name="options" id="option20" autocomplete="off"> Removible mal estado
                                                                </label>
                                                                <label id="implante" class="btn btn-rounded">
                                                                    <input type="radio" name="options" id="option21" autocomplete="off"> Implante
                                                                </label>
                                                                <label id="placa" class="btn btn-rounded active">
                                                                    <input type="hidden" name="option" id="option22" autocomplete="off" value="Placa" /> Placa
                                                                </label>
                                                                <label id="limpiar" class="btn btn-rounded">
                                                                    <input type="radio" name="option" id="option23" autocomplete="off" value="Limpiar" /> Limpiar
                                                                </label>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div id="tr" class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                                                    </div>
                                                    <div id="tl" class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                                                    </div>
                                                    <div id="tlr" class="col-xs-6 col-sm-6 col-md-6 col-lg-6 text-right">
                                                    </div>
                                                    <div id="tll" class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div id="blr" class="col-xs-6 col-sm-6 col-md-6 col-lg-6 text-right">
                                                    </div>
                                                    <div id="bll" class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                                                    </div>
                                                    <div id="br" class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                                                    </div>
                                                    <div id="bl" class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                <%} else {%>
                                <div class="tab-pane" id="odontograma">
                                    <div class="tab-pane" id="odontograma">
                                        <div class="panel-body">
                                            <div class="row" id="placa2">
                                                <div class="row">

                                                    <div id="controls" class="panel panel-default">
                                                        <div class="panel-body">
                                                            <div class="btn-group" data-toggle="buttons">
                                                                <label id="cariado" class="btn btn-rounded">
                                                                    <input type="radio" name="options" id="option1" autocomplete="off" checked>Cariado</label>
                                                                <label id="obturado" class="btn btn-rounded">
                                                                    <input type="radio" name="options" id="option2" autocomplete="off"> Obturado
                                                                </label>
                                                                <label id="exodonciarealizada" class="btn btn-rounded">
                                                                    <input type="radio" name="options" id="option3" autocomplete="off"> Exodoncia realizada
                                                                </label>
                                                                <label id="exodonciasimpleindicada" class="btn btn-rounded">
                                                                    <input type="radio" name="options" id="option4" autocomplete="off"> Exodoncia simple indicada
                                                                </label>
                                                                <label id="exodonciaquirrugicaindicada" class="btn btn-rounded">
                                                                    <input type="radio" name="options" id="option5" autocomplete="off"> Exodoncia quirrugica indicada
                                                                </label>
                                                                <label id="sinerupcionar" class="btn btn-rounded">
                                                                    <input type="radio" name="options" id="option6" autocomplete="off"> Sin erupcionar
                                                                </label>
                                                                <label id="endodonciarealizada" class="btn btn-rounded">
                                                                    <input type="radio" name="options" id="option7" autocomplete="off"> Endodoncia realizada
                                                                </label>
                                                                <label id="endodonciaindicada" class="btn btn-rounded">
                                                                    <input type="radio" name="options" id="option8" autocomplete="off"> Endodoncia indicada
                                                                </label>
                                                                <label id="sellantepresente" class="btn btn-rounded">
                                                                    <input type="radio" name="options" id="option9" autocomplete="off"> Sellante presente
                                                                </label>
                                                                <label id="sellanteindicado" class="btn btn-rounded">
                                                                    <input type="radio" name="options" id="option10" autocomplete="off"> Sellante indicado
                                                                </label>
                                                                <label id="erosion" class="btn btn-rounded">
                                                                    <input type="radio" name="options" id="option11" autocomplete="off"> Erosion
                                                                </label>
                                                                <label id="procedimientorealizado" class="btn btn-rounded">
                                                                    <input type="radio" name="options" id="option12" autocomplete="off"> Procedimiento realizado
                                                                </label>
                                                                <label id="coronabuenestado" class="btn btn-rounded">
                                                                    <input type="radio" name="options" id="option13" autocomplete="off"> Corona buen estado
                                                                </label>
                                                                <label id="coronamalestado" class="btn btn-rounded">
                                                                    <input type="radio" name="options" id="option14" autocomplete="off"> Corona mal estado
                                                                </label>
                                                                <label id="provisionalbuenestado" class="btn btn-rounded">
                                                                    <input type="radio" name="options" id="option15" autocomplete="off"> Provisional buen estado
                                                                </label>
                                                                <label id="provisionalmalestado" class="btn btn-rounded">
                                                                    <input type="radio" name="options" id="option16" autocomplete="off"> Provisional mal estado
                                                                </label>
                                                                <label id="nucleobuenestado" class="btn btn-rounded">
                                                                    <input type="radio" name="options" id="option17" autocomplete="off"> Nucleo buen estado
                                                                </label>
                                                                <label id="nucleomalestado" class="btn btn-rounded">
                                                                    <input type="radio" name="options" id="option18" autocomplete="off"> Nucleo mal estado
                                                                </label>
                                                                <label id="removiblebuenestado" class="btn btn-rounded">
                                                                    <input type="radio" name="options" id="option19" autocomplete="off"> Removible buen estado
                                                                </label>
                                                                <label id="removiblemalestado" class="btn btn-rounded">
                                                                    <input type="radio" name="options" id="option20" autocomplete="off"> Removible mal estado
                                                                </label>
                                                                <label id="implante" class="btn btn-rounded">
                                                                    <input type="radio" name="options" id="option21" autocomplete="off"> Implante
                                                                </label>
                                                                <label id="placa" class="btn btn-rounded active">
                                                                    <input type="hidden" name="option" id="option22" autocomplete="off" value="Placa" /> Placa
                                                                </label>
                                                                <label id="limpiar" class="btn btn-rounded">
                                                                    <input type="radio" name="option" id="option23" autocomplete="off" value="Limpiar" /> Limpiar
                                                                </label>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div id="tr" class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                                                    </div>
                                                    <div id="tl" class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                                                    </div>
                                                    <div id="tlr" class="col-xs-6 col-sm-6 col-md-6 col-lg-6 text-right">
                                                    </div>
                                                    <div id="tll" class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div id="blr" class="col-xs-6 col-sm-6 col-md-6 col-lg-6 text-right">
                                                    </div>
                                                    <div id="bll" class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                                                    </div>
                                                    <div id="br" class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                                                    </div>
                                                    <div id="bl" class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <%}%>
                                
                                <%if (hcOdontologia == null) {%>
                                    <div class="tab-pane" id="final">
                                        <div class="panel-body">
                                            <table class="table table-responsive">
                                                <tr>
                                                    <td>Lectura RX</td>
                                                    <td colspan="2">
                                                        <textarea class="form-control" name="lectura_rx" id="lectura_rx"></textarea>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>Diagnostico</td>
                                                    <td colspan="2">
                                                        <textarea class="form-control" name="diagnostico" id="diagnostico"></textarea>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="2"> Plan de tratamiento</td>
                                                </tr>
                                                <tr>
                                                    <td>Operatoria <input type="text" class="form-control" name="operatoria" id="operatoria" /> </td>
                                                    <td>Cirugia Oral <input type="text" class="form-control" name="cirugia_oral" id="cirugia_oral" /> </td>
                                                    <td>Higiene Oral <input type="text" class="form-control" name="higiene_oral" id="higiene_oral" /> </td>
                                                </tr>
                                                <tr>
                                                    <td>Endodoncia <input type="text" class="form-control" name="endodoncia" id="endodoncia" /> </td>
                                                    <td>MD Oral <input type="text" class="form-control" name="md_oral" id="md_oral" /> </td>
                                                    <td>Rehabilitación Oral <input type="text" class="form-control" name="rehab_oral" id="rehab_oral" /> </td>
                                                </tr>
                                                <tr>
                                                    <td>Periodoncia <input type="text" class="form-control" name="periodoncia" id="periodoncia" /> </td>
                                                    <td>Cirugia Maxilo Facial <input type="text" class="form-control" name="ciru_maxi_facial" id="ciru_maxi_facial" /> </td>
                                                    <td>Ortodoncia <input type="text" class="form-control" name="ortodoncia" id="ortodoncia" /> </td>
                                                </tr>
                                                <tr>
                                                   
                                                </tr>
                                                
                                                
                                            </table>
                                        </div>
                                    </div>
                                <%}%>
                                
                                <%if (hcOdontologia != null) {%>
                                    <div class="tab-pane" id="consulta">
                                        <div class="panel-body">
                                            <table class="table table-responsive">
                                                <tbody>
                                                    <tr>
                                                        <td>Motivo de Consulta</td>
                                                        <td colspan="7"> <textarea id="motivo" class="form-control" name="motivo"></textarea> </td>
                                                    </tr>
                                                    <tr>
                                                        <td>Diagnostico</td>
                                                        <td colspan="3">
                                                            <textarea class="form-control" name="diagnostico" id="diagnostico"></textarea>
                                                            <input type="hidden" id="id_hc_odontograma" name="id_hc_odontograma" value="<%=hcOdontologia.getId_hcodontologia()%>"/>
                                                        </td>
                                                    </tr>                                                    
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                <%}%>
                                
                                <%if (hcOdontologia != null) {%>
                                    <div class="tab-pane" id="historia">
                                        <div class="panel-body">
                                            <table class="table table-responsive">
                                                <tbody>
                                                    <tr>
                                                        <td colspan="4"><strong>1. ANAMNESIS</strong></td>
                                                    </tr>
                                                    <tr>
                                                        <td>Alergias: <%=hcOdontologia.getB_alergias()%> </td>
                                                        <td>Cirugias: <%=hcOdontologia.getB_cirugias()%></td>
                                                        <td>Convulsiones: <%=hcOdontologia.getB_convulsion()%></td>
                                                        <td>Diabetes: <%=hcOdontologia.getB_diabetes()%></td>
                                                    </tr>
                                                    <tr>
                                                        <td>Embarazo: <%=hcOdontologia.getB_embarazo()%> </td>
                                                        <td>Enfermedades gástricas: <%=hcOdontologia.getB_enfermedades_gastricas()%></td>
                                                        <td>Enfermedades orales: <%=hcOdontologia.getB_enfermedades_orales()%></td>
                                                        <td>Exodoncia: <%=hcOdontologia.getB_exodoncia()%></td>
                                                    </tr>
                                                    <tr>
                                                        <td>Hemorragias: <%=hcOdontologia.getB_hemorragia()%> </td>
                                                        <td>Hepatitis: <%=hcOdontologia.getB_hepatitis()%></td>
                                                        <td>Hipertensión: <%=hcOdontologia.getB_hipertension()%></td>
                                                        <td>HIV: <%=hcOdontologia.getB_hiv()%></td>
                                                    </tr>
                                                    <tr>
                                                        <td>Tratamiento médico actual: <%=hcOdontologia.getB_tratamiento_medico_actual()%></td>
                                                        <td>Toma medicamentos: <%=hcOdontologia.getB_toma_medicamentos()%> </td>
                                                        <td>Patología respiratoria: <%=hcOdontologia.getB_patologia_respiratoria()%></td>
                                                        <td>Readioterapia: <%=hcOdontologia.getB_radioterapia()%></td>
                                                    </tr>
                                                    <tr>                                                        
                                                        <td colspan="2">Motivo: <%=hcOdontologia.getB_motivo()%> </td>
                                                        <td colspan="2">Observación: <%=hcOdontologia.getB_observacion_anamnesis()%></td>                                                        
                                                    </tr>
                                                    
                                                    <tr>
                                                        <td colspan="4"><strong>2. EXAMENES: ESTOMATOLOGICO-TEJIDOS BALNDOS-HALLAZGOS</strong></td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2">Labios: <%=hcOdontologia.getC_labios()%> </td>
                                                        <td colspan="2">Lengua: <%=hcOdontologia.getC_lengua()%></td>                                                        
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2">Carrillos: <%=hcOdontologia.getC_carrillos()%> </td>
                                                        <td colspan="2">Piso de boca: <%=hcOdontologia.getC_pisodeboca()%></td>                                                        
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2">Paladar: <%=hcOdontologia.getC_paladar()%> </td>
                                                        <td colspan="2">Frenillos: <%=hcOdontologia.getC_frenillos()%></td>                                                        
                                                    </tr>
                                                    
                                                    <tr>
                                                        <td colspan="4"><strong>3. PROTESIS</strong></td>
                                                    </tr>
                                                    <tr>
                                                        <td>Presencia de prótesis: <%=hcOdontologia.getD_protesis()%></td>
                                                        <td colspan="3">Descripción: <%=hcOdontologia.getD_descripcion_protesis()%></td>
                                                    </tr>
                                                    <tr>
                                                        <td>Higiene oral: <%=hcOdontologia.getD_higiene_oral()%></td>
                                                        <td>Frecuencia cepillado: <%=hcOdontologia.getD_fr_cepillado()%></td>
                                                        <td>Seda dental: <%=hcOdontologia.getD_seda_dental()%></td>
                                                    </tr>
                                                    
                                                    <tr>
                                                        <td colspan="4"><strong>4. ANALISIS A.T.M.</strong></td>
                                                    </tr>
                                                    <tr>
                                                        <td>Dolor muscular: <%=hcOdontologia.getE_dolor_muscular()%></td>
                                                        <td>Dolor articular: <%=hcOdontologia.getE_dolor_articular()%></td>
                                                        <td>Ruido articular: <%=hcOdontologia.getE_ruido_articular()%></td>
                                                        <td>Limitaciones de movimiento: <%=hcOdontologia.getE_limit_movimiento()%></td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="4">Observaciones: <%=hcOdontologia.getE_obser_atm()%></td>                                                        
                                                    </tr>
                                                    
                                                    <tr>
                                                        <td colspan="4"><strong>5. LECTURA RX - DIAGNOSTICO - PLAN DE TRATAMIENTO</strong></td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="4">Lectur RX: <%=hcOdontologia.getH_lectura_rx()%></td>                                                        
                                                    </tr>
                                                    <tr>
                                                        <td colspan="4">Diagnóstico: <%=hcOdontologia.getI_diagnostico()%></td>          
                                                    </tr>
                                                    <tr>
                                                        <td>Operatoria: <%=hcOdontologia.getK_operatoria()%></td>          
                                                        <td>Cirugía oral: <%=hcOdontologia.getK_cirugia_oral()%></td>
                                                        <td>Higiene oral: <%=hcOdontologia.getK_higiene_oral()%></td>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td>Endodoncia: <%=hcOdontologia.getK_endodoncia()%></td>          
                                                        <td>MD oral: <%=hcOdontologia.getK_md_oral()%></td>
                                                        <td>Rehabilitacion oral: <%=hcOdontologia.getK_rehab_oral()%></td>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td>Periodoncia: <%=hcOdontologia.getK_periodoncia()%></td>          
                                                        <td>Cirugía Maxilo facial: <%=hcOdontologia.getK_ciru_maxi_facial()%></td>
                                                        <td>Ortodoncia: <%=hcOdontologia.getK_ortodoncia()%></td>
                                                        <td></td>
                                                    </tr>                                                  
                                                    
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                <%}%>
                                             
                                </div>
                                
                                <input type="hidden" id="controlPlaca" name="controlPlaca" value=""/>
                                <input type="hidden" id="odon" name="odon" value=""/>
                                <input type="hidden" id="idCita" name="idCita" value="<%=idcita%>"/>
                                <input type="hidden" id="tipo" name="tipo" value="<%=tipo%>"/>
                                <input type="hidden" id="identificacionU" name="identificacionU" value="<%=u.getIdentificacion()%>"/>
                                <%if (hcOdontologia != null) {%>
                                <input type="hidden" id="id_hc_odontologia" name="id_hc_odontologia" value="<%=hcOdontologia.getId_hcodontologia()%>"/>
                                <%}%>
                                                                
                                &nbsp;&nbsp;&nbsp;&nbsp;<input  type="button" class="btn btn-success" value="Registrar" onclick="registrarss();" />                                
                                <a id="test"></a>
                                <br>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <script type="text/javascript" src="../../js/registrodon.js"></script>
        <script src="https://cdn.jsdelivr.net/sweetalert2/6.6.2/sweetalert2.min.js"></script>
        <script type="text/javascript" src="../js/modal.js"></script>
        
        <script>
                                  
        // Inicialización control placa  
    <% if (hcOdontologia == null || hcOdontologia.getF_control_placa() == null) {%> 
            
        function getArrayUbicacionesPlaca() {
            var arrayUbi = [
                            {"posicion" : "arriba", "valor" : "NO"},
                            {"posicion" : "abajo", "valor" : "NO"},
                            {"posicion" : "izquierda", "valor" : "NO"},
                            {"posicion" : "derecha", "valor" : "NO"},
                            {"posicion" : "centro", "valor" : "NO"}
                        ];
            return arrayUbi;
        }
        
        var placa = { "pla" : [
                    {
                        "numero": "18", 
                        "ubicaciones" : getArrayUbicacionesPlaca()                        
                    },
                    {
                        "numero": "17", 
                        "ubicaciones" : getArrayUbicacionesPlaca()
                    },
                    {
                        "numero": "16", 
                        "ubicaciones" : getArrayUbicacionesPlaca()
                    },
                    {
                        "numero": "15/55", 
                        "ubicaciones" : getArrayUbicacionesPlaca()
                    },
                    {
                        "numero": "14/54", 
                        "ubicaciones" : getArrayUbicacionesPlaca()
                    },
                    {
                        "numero": "13/53", 
                        "ubicaciones" : getArrayUbicacionesPlaca()
                    },
                    {
                        "numero": "12/52", 
                        "ubicaciones" : getArrayUbicacionesPlaca()
                    },
                    {
                        "numero": "11/51", 
                        "ubicaciones" : getArrayUbicacionesPlaca()
                    },
                    {
                        "numero": "21/61", 
                        "ubicaciones" : getArrayUbicacionesPlaca()
                    },
                    {
                        "numero": "22/62", 
                        "ubicaciones" : getArrayUbicacionesPlaca()
                    },
                    {
                        "numero": "23/63", 
                        "ubicaciones" : getArrayUbicacionesPlaca()
                    },
                    {
                        "numero": "24/64", 
                        "ubicaciones" : getArrayUbicacionesPlaca()
                    },
                    {
                        "numero": "25/65", 
                        "ubicaciones" : getArrayUbicacionesPlaca()
                    },
                    {
                        "numero": "26", 
                        "ubicaciones" : getArrayUbicacionesPlaca()
                    },
                    {
                        "numero": "27", 
                        "ubicaciones" : getArrayUbicacionesPlaca()
                    },
                    {
                        "numero": "28", 
                        "ubicaciones" : getArrayUbicacionesPlaca()
                    },
                    {
                        "numero": "48", 
                        "ubicaciones" : getArrayUbicacionesPlaca()
                    },
                    {
                        "numero": "47", 
                        "ubicaciones" : getArrayUbicacionesPlaca()
                    },
                    {
                        "numero": "46", 
                        "ubicaciones" : getArrayUbicacionesPlaca()
                    },
                    {
                        "numero": "45/85", 
                        "ubicaciones" : getArrayUbicacionesPlaca()
                    },
                    {
                        "numero": "44/84", 
                        "ubicaciones" : getArrayUbicacionesPlaca()
                    },
                    {
                        "numero": "43/83", 
                        "ubicaciones" : getArrayUbicacionesPlaca()
                    },
                    {
                        "numero": "42/82", 
                        "ubicaciones" : getArrayUbicacionesPlaca()
                    },
                    {
                        "numero": "41/81", 
                        "ubicaciones" : getArrayUbicacionesPlaca()
                    },
                    {
                        "numero": "31/71", 
                        "ubicaciones" : getArrayUbicacionesPlaca()
                    },
                    {
                        "numero": "32/72", 
                        "ubicaciones" : getArrayUbicacionesPlaca()
                    },
                    {
                        "numero": "33/73", 
                        "ubicaciones" : getArrayUbicacionesPlaca()
                    },
                    {
                        "numero": "34/74", 
                        "ubicaciones" : getArrayUbicacionesPlaca()
                    },
                    {
                        "numero": "35/75", 
                        "ubicaciones" : getArrayUbicacionesPlaca()
                    },
                    {
                        "numero": "36", 
                        "ubicaciones" : getArrayUbicacionesPlaca()
                    },
                    {
                        "numero": "37", 
                        "ubicaciones" : getArrayUbicacionesPlaca()
                    },
                    {
                        "numero": "38", 
                        "ubicaciones" : getArrayUbicacionesPlaca()
                    }
        ]};
    
    <%} else { %>
        var placa = <%=jsonObj%>
    <%}%>
        
    <% if (hcOdontologia == null || hcOdontologia.getG_odontograma() == null) {%>
    
    function getArrayTipoMarca(){
            var tipoMarca = [
                                    {
                                        "nombre" : "cariado",                                        
                                        "valor" : "NO"                                        
                                    },
                                    {
                                        "nombre" : "obturado",                                       
                                        "valor" : "NO"
                                    },
                                    {
                                        "nombre" : "exodonciarealizada",                                        
                                        "valor" : "NO"
                                    },
                                    {
                                        "nombre" : "exodonciasimpleindicada",
                                        "valor" : "NO"
                                    },
                                    {
                                        "nombre" : "exodonciaquirrugicaindicada",
                                        "valor" : "NO"
                                    },
                                    {
                                        "nombre" : "sinerupcionar",
                                        "valor" : "NO"
                                    },
                                    {
                                        "nombre" : "endodonciarealizada",
                                        "valor" : "NO"
                                    },
                                    {
                                        "nombre" : "endodonciaindicada",
                                        "valor" : "NO"
                                    },
                                    {
                                        "nombre" : "sellantepresente",
                                        "valor" : "NO"
                                    },
                                    {
                                        "nombre" : "sellanteindicado",
                                        "valor" : "NO"
                                    },
                                    {
                                        "nombre" : "erosion",
                                        "valor" : "NO"
                                    },
                                    {
                                        "nombre" : "procedimientorealizado",
                                        "valor" : "NO"
                                    },
                                    {
                                        "nombre" : "coronabuenestado",
                                        "valor" : "NO"
                                    },
                                    {
                                        "nombre" : "coronamalestado",
                                        "valor" : "NO"
                                    },
                                    {
                                        "nombre" : "provisionalbuenestado",
                                        "valor" : "NO"
                                    },
                                    {
                                        "nombre" : "provisionalmalestado",
                                        "valor" : "NO"
                                    },
                                    {
                                        "nombre" : "nucleobuenestado",
                                        "valor" : "NO"
                                    },
                                    {
                                        "nombre" : "nucleomalestado",
                                        "valor" : "NO"
                                    },
                                    {
                                        "nombre" : "removiblebuenestado",
                                        "valor" : "NO"
                                    },
                                    {
                                        "nombre" : "removiblemalestado",
                                        "valor" : "NO"
                                    },
                                    {
                                        "nombre" : "implante",
                                        "valor" : "NO"
                                    },
                                    {
                                        "nombre" : "placa",
                                        "valor" : "NO"
                                    }
                                ];
                                
            return tipoMarca;
        }
    
    function getArrayUbicaciones(){
    var arrayUbicaciones = [
                            {
                                "posicion" : "arriba",                                 
                                "tipoMarca" : getArrayTipoMarca()                            
                            },
                            {
                                "posicion" : "abajo",                                 
                                "tipoMarca" : getArrayTipoMarca()
                            },
                            {
                                "posicion" : "izquierda",                                 
                                "tipoMarca" : getArrayTipoMarca()
                            },
                            {
                                "posicion" : "derecha",                                 
                                "tipoMarca" : getArrayTipoMarca()
                            },
                            {
                                "posicion" : "centro",                                 
                                "tipoMarca" : getArrayTipoMarca()
                            }
                        ];
        return arrayUbicaciones;
    }
    
    var odontograma = { "pla" : [
                        {
                            "numero": "18", 
                            "ubicaciones" : getArrayUbicaciones()
                        },
                        {
                            "numero": "17", 
                            "ubicaciones" : getArrayUbicaciones()
                        },
                        {
                            "numero": "16", 
                            "ubicaciones" : getArrayUbicaciones()
                        },
                        {
                            "numero": "15", 
                            "ubicaciones" : getArrayUbicaciones()
                        },
                        {
                            "numero": "14", 
                            "ubicaciones" : getArrayUbicaciones()
                        },
                        {
                            "numero": "13", 
                            "ubicaciones" : getArrayUbicaciones()
                        },
                        {
                            "numero": "12", 
                            "ubicaciones" : getArrayUbicaciones()
                        },
                        {
                            "numero": "11", 
                            "ubicaciones" : getArrayUbicaciones()
                        },
                        {
                            "numero": "21", 
                            "ubicaciones" : getArrayUbicaciones()
                        },
                        {
                            "numero": "22", 
                            "ubicaciones" : getArrayUbicaciones()
                        },
                        {
                            "numero": "23", 
                            "ubicaciones" : getArrayUbicaciones()
                        },
                        {
                            "numero": "24", 
                            "ubicaciones" : getArrayUbicaciones()
                        },
                        {
                            "numero": "25", 
                            "ubicaciones" : getArrayUbicaciones()
                        },
                        {
                            "numero": "26", 
                            "ubicaciones" : getArrayUbicaciones()
                        },
                        {
                            "numero": "27", 
                            "ubicaciones" : getArrayUbicaciones()
                        },
                        {
                            "numero": "28", 
                            "ubicaciones" : getArrayUbicaciones()
                        },
                        {
                            "numero": "48", 
                            "ubicaciones" : getArrayUbicaciones()
                        },
                        {
                            "numero": "47", 
                            "ubicaciones" : getArrayUbicaciones()
                        },
                        {
                            "numero": "46", 
                            "ubicaciones" : getArrayUbicaciones()
                        },
                        {
                            "numero": "45", 
                            "ubicaciones" : getArrayUbicaciones()
                        },
                        {
                            "numero": "44", 
                            "ubicaciones" : getArrayUbicaciones()
                        },
                        {
                            "numero": "43", 
                            "ubicaciones" : getArrayUbicaciones()
                        },
                        {
                            "numero": "42", 
                            "ubicaciones" : getArrayUbicaciones()
                        },
                        {
                            "numero": "41", 
                            "ubicaciones" : getArrayUbicaciones()
                        },
                        {
                            "numero": "31", 
                            "ubicaciones" : getArrayUbicaciones()
                        },
                        {
                            "numero": "32", 
                            "ubicaciones" : getArrayUbicaciones()
                        },
                        {
                            "numero": "33", 
                            "ubicaciones" : getArrayUbicaciones()
                        },
                        {
                            "numero": "34", 
                            "ubicaciones" : getArrayUbicaciones()
                        },
                        {
                            "numero": "35", 
                            "ubicaciones" : getArrayUbicaciones()
                        },
                        {
                            "numero": "36", 
                            "ubicaciones" : getArrayUbicaciones()
                        },
                        {
                            "numero": "37", 
                            "ubicaciones" : getArrayUbicaciones()
                        },
                        {
                            "numero": "38", 
                            "ubicaciones" : getArrayUbicaciones()
                        },
                        {
                            "numero": "55", 
                            "ubicaciones" : getArrayUbicaciones()
                        },
                        {
                            "numero": "54", 
                            "ubicaciones" : getArrayUbicaciones()
                        },
                        {
                            "numero": "53", 
                            "ubicaciones" : getArrayUbicaciones()
                        },
                        {
                            "numero": "52", 
                            "ubicaciones" : getArrayUbicaciones()
                        },
                        {
                            "numero": "51", 
                            "ubicaciones" : getArrayUbicaciones()
                        },
                        {
                            "numero": "61", 
                            "ubicaciones" : getArrayUbicaciones()
                        },
                        {
                            "numero": "62", 
                            "ubicaciones" : getArrayUbicaciones()
                        },
                        {
                            "numero": "63", 
                            "ubicaciones" : getArrayUbicaciones()
                        },
                        {
                            "numero": "64", 
                            "ubicaciones" : getArrayUbicaciones()
                        },
                        {
                            "numero": "65", 
                            "ubicaciones" : getArrayUbicaciones()
                        },
                        {
                            "numero": "85", 
                            "ubicaciones" : getArrayUbicaciones()
                        },
                        {
                            "numero": "84", 
                            "ubicaciones" : getArrayUbicaciones()
                        },
                        {
                            "numero": "83", 
                            "ubicaciones" : getArrayUbicaciones()
                        },
                        {
                            "numero": "82", 
                            "ubicaciones" : getArrayUbicaciones()
                        },
                        {
                            "numero": "81", 
                            "ubicaciones" : getArrayUbicaciones()
                        },
                        {
                            "numero": "71", 
                            "ubicaciones" : getArrayUbicaciones()
                        },
                        {
                            "numero": "72", 
                            "ubicaciones" : getArrayUbicaciones()
                        },
                        {
                            "numero": "73", 
                            "ubicaciones" : getArrayUbicaciones()
                        },
                        {
                            "numero": "74", 
                            "ubicaciones" : getArrayUbicaciones()
                        },
                        {
                            "numero": "75", 
                            "ubicaciones" : getArrayUbicaciones()
                        }
                    ]};
                
    <%} else {%>
        var odontograma = <%=jsonObjOdontograma%>
    <%}%>
                    
            function obtenerIndiceTipoMarca(tipoMarca, indiceDiente, indicePosicion, objJson) {
                var indiceMarca = objJson.pla[indiceDiente].ubicaciones[indicePosicion].tipoMarca.findIndex(elem => {
                    if (elem.nombre === tipoMarca) {
                        return true;
                    }
                    return false;
                });                
                return indiceMarca;
            }
    
            function obtenerUbicacion(posicion, indiceDiente, objJson) {
                var indicePosicion = objJson.pla[indiceDiente].ubicaciones.findIndex(elem => {
                    if (elem.posicion === posicion) {
                        return true;
                    }
                    return false;
                });
                
                return indicePosicion;
            }
            function obtenerIndiceDiente(diente, objJson) {
                var indiceDiente = objJson.pla.findIndex(elem => {
                        if(elem.numero === diente){
                            return true;
                        } 
                        return false;
                });
                
                return indiceDiente;
            }
            //alert("inicializa -> "+placa.pla[0].ubicaciones[0].valor);
            function meterEnControlPlaca(diente, posicion){
                                
                var indiceDiente = obtenerIndiceDiente(diente, placa);
                
                var indicePosicion = obtenerUbicacion(posicion, indiceDiente, placa);
                
                //alert("dientePosicion" + placa.pla[indiceDiente].numero + " posicion " + indicePosicion + "valor "+ placa.pla[indiceDiente].ubicaciones[indicePosicion].valor);
                if (placa.pla[indiceDiente].ubicaciones[indicePosicion].valor === "NO") {
                    placa.pla[indiceDiente].ubicaciones[indicePosicion].valor = "SI";
                    //alert("Lo pasaré a SI");
                }else {
                    placa.pla[indiceDiente].ubicaciones[indicePosicion].valor = "NO";
                }                
                return;
            }
            
            function meterEnOdontograma(diente, ubicacion, tipoMarca, esCompleto) {
                
                var indiceDiente = obtenerIndiceDiente(diente, odontograma);
                
                var indicePosicion = obtenerUbicacion(ubicacion, indiceDiente, odontograma);
                
                var indiceTipoMarca = obtenerIndiceTipoMarca(tipoMarca, indiceDiente, indicePosicion, odontograma);
                
                if(esCompleto === "NO"){
                    if(odontograma.pla[indiceDiente].ubicaciones[indicePosicion].tipoMarca[indiceTipoMarca].valor === "SI") {
                        odontograma.pla[indiceDiente].ubicaciones[indicePosicion].tipoMarca[indiceTipoMarca].valor = "NO";
                    } else {
                        odontograma.pla[indiceDiente].ubicaciones[indicePosicion].tipoMarca[indiceTipoMarca].valor = "SI";
                    }
                } else {
                    if(odontograma.pla[indiceDiente].ubicaciones[indicePosicion].tipoMarca[indiceTipoMarca].valor === "SI") {
                        odontograma.pla[indiceDiente].ubicaciones[0].tipoMarca[indiceTipoMarca].valor = "NO";
                        odontograma.pla[indiceDiente].ubicaciones[1].tipoMarca[indiceTipoMarca].valor = "NO";
                        odontograma.pla[indiceDiente].ubicaciones[2].tipoMarca[indiceTipoMarca].valor = "NO";
                        odontograma.pla[indiceDiente].ubicaciones[3].tipoMarca[indiceTipoMarca].valor = "NO";
                        odontograma.pla[indiceDiente].ubicaciones[4].tipoMarca[indiceTipoMarca].valor = "NO";
                    } else {
                        console.log("Entra por acá");
                        odontograma.pla[indiceDiente].ubicaciones[0].tipoMarca[indiceTipoMarca].valor = "SI";
                        odontograma.pla[indiceDiente].ubicaciones[1].tipoMarca[indiceTipoMarca].valor = "SI";
                        odontograma.pla[indiceDiente].ubicaciones[2].tipoMarca[indiceTipoMarca].valor = "SI";
                        odontograma.pla[indiceDiente].ubicaciones[3].tipoMarca[indiceTipoMarca].valor = "SI";
                        odontograma.pla[indiceDiente].ubicaciones[4].tipoMarca[indiceTipoMarca].valor = "SI";
                    }
                }
                
                //alert("J "+JSON.stringify(odontograma));
                
            }
            
            function registrarss(){
                
                //Para capture de la imagen
                /*
                var divIma = document.getElementById("placa1");
                html2canvas(divIma,{
                    onrendered: function(canvas){
                        //BASED64 ENCODED DATA
                        console.log(canvas.toDataURL('image/png'));
                        
                        $('#test').attr('href', canvas.toDataURL('image/png'));
                        $('#test').attr('download', 'prueba_test.png');
                        $('#test')[0].click();
                    }
                });
                */
                
                //alert("voy a registrar");
                var getFormulario = document.getElementById("regodont");
                var controlPlaca = document.getElementById("controlPlaca");
                controlPlaca.value = JSON.stringify(placa);
                
                var odontogra = document.getElementById("odon");
                console.log("odo -> " + JSON.stringify(odontograma));
                odontogra.value = JSON.stringify(odontograma);
                
                //alert("valor placa -> " + JSON.stringify(placa));
                //alert("voy a enviar");
                getFormulario.submit();
                
                
                
                /*var formData = new FormData(getFormulario);
                formData.append("controlPlaca", placa);
                
                var request = new XMLHttpRequest();
                request.open("POST", "../controlador/procesarRegistroHistoriaOdontologia.jsp");
                request.send(formData);*/
                
                /*$("#regodont").on("submit", function(e){
        alert("enviaré..");
        e.preventDefault();
        alert("a enviar..");
        var motivo = new FormData(document.getElementById("motivo"));
        var alergia = new FormData(document.getElementById("alergia"));
        var hiv = new FormData(document.getElementById("hiv"));
        var hemorragia = new FormData(document.getElementById("hemorragia"));
        var cirugia = new FormData(document.getElementById("cirugia"));
        var radioterapia = new FormData(document.getElementById("radioterapia"));
        var exodoncia = new FormData(document.getElementById("exodoncia"));
        var hipertension = new FormData(document.getElementById("hipertension"));
        var hepatitis = new FormData(document.getElementById("hepatitis"));
        var diabetes = new FormData(document.getElementById("diabetes"));
        var pato_respi = new FormData(document.getElementById("pato_respi"));
        var trata_med_actual = new FormData(document.getElementById("trata_med_actual"));
        var convulsion = new FormData(document.getElementById("convulsion"));
        var toma_medicam = new FormData(document.getElementById("toma_medicam"));
        var enfer_orales = new FormData(document.getElementById("enfer_orales"));
        var embarazo = new FormData(document.getElementById("embarazo"));
        var hiv = new FormData (document.getElementById("hiv"));
        var cirugia = new FormData(document.getElementById("cirugia"));
        var exodoncia = new FormData(document.getElementById("exodoncia"));
        var hepatitis = new FormData(document.getElementById("hepatitis"));
        var pato_respi = new FormData(document.getElementById("pato_respi"));
        var convulsion = new FormData(document.getElementById("convulsion"));
        var enfer_orales = new FormData(document.getElementById("enfer_orales"));
        var enfer_gastrica = new FormData(document.getElementById("enfer_gastrica"));
        var obser_anamnesis = new FormData(document.getElementById("obser_anamnesis"));
        var labios = new FormData(document.getElementById("labios"));
        var lengua = new FormData(document.getElementById("lengua"));
        var carrillos = new FormData(document.getElementById("carrillos"));
        var paladar = new FormData(document.getElementById("paladar"));
        var frenillos = new FormData(document.getElementById("frenillos"));
        var obser_exam = new FormData(document.getElementById("obser_exam"));
        var presen_protesis = new FormData(document.getElementById("presen_protesis"));
        var descrip = new FormData(document.getElementById("descrip"));
        var higiene = new FormData(document.getElementById("higiene"));
        var fr_cepill = new FormData(document.getElementById("fr_cepill"));
        var presen_protesis = new FormData(document.getElementById("presen_protesis"));
        var dolor_muscular = new FormData(document.getElementById("dolor_muscular"));
        var dolor_articular = new FormData(document.getElementById("dolor_articular"));
        var ruido_articular = new FormData(document.getElementById("ruido_articular"));
        var limit_mov = new FormData(document.getElementById("limit_mov"));
        var obser_atm = new FormData(document.getElementById("obser_atm"));
               
        var lectura_rx = new FormData(document.getElementById("lectura_rx"));
        var diagnostico = new FormData(document.getElementById("diagnostico"));
        var operatoria = new FormData(document.getElementById("operatoria"));
        var cirugia_oral = new FormData(document.getElementById("cirugia_oral"));
        var higiene_oral = new FormData(document.getElementById("higiene_oral"));
        var endodoncia = new FormData(document.getElementById("endodoncia"));
        var md_oral = new FormData (document.getElementById("md_oral"));
        var rehab_oral = new FormData(document.getElementById("rehab_oral"));
        var periodoncia = new FormData(document.getElementById("periodoncia"));
        var ciru_maxi_facial = new FormData(document.getElementById("ciru_maxi_facial"));
        var ortodoncia = new FormData(document.getElementById("ortodoncia"));*/

        /*html2canvas($("placa1"),{
            onrendered: function(canvas){
                theCanvas = canvas;
                document.body.appendChild(canvas);
                Canvas2Image.saveAsPNG(canvas); 
            }
        });
        html2canvas($("placa2"),{
            onrendered: function(canvas2){
                theCanvas = canvas2;
                document.body.appendChild(canvas2);
                Canvas2Image.saveAsPNG(canvas2); 
            }
        });*/
        /*alert("pasee");
        $.ajax({
            url:"../controlador/procesarRegistroHistoriaOdontologia.jsp",
            type: "POST",
            dataType: "html",
            data: formData,
            cache: false,
            contentType: false,
            processData: false
        }).done(function(echo){
            alert("Listo");
        });*/
    // });
            }
        </script>
        
        <script type="text/javascript">
            function replaceAll(find, replace, str) {
                return str.replace(new RegExp(find, 'g'), replace);
            }

            function calcularIndiceNumero(prefijo, indice) {
                var indiceNumero = odontograma.pla.findIndex(el => {
                    if (el.numero === prefijo + indice) {
                        return true;
                    }
                    return false;
                });
                return indiceNumero;
            }

            //Lapiz verde del control de placa
            $(document).ready(function () {
                $(".clickPlaca").click(function (event) {
                    //var dientePosition = $(this).position();
                                if ($(this).hasClass("click-green")) {
                                    $(this).removeClass('click-green');
                                } else {                                                                                
                                    $(this).addClass('click-green');
                                }                                                                            
                });

            });

            function createOdontogram() {
                var htmlLecheLeft = "",
                        htmlLecheLeft2 = "",
                        htmlLecheRight = "",
                        htmlLecheRight2 = "",
                        htmlLeft = "",
                        htmlLeft2 = "",
                        htmlRight = "",
                        htmlRight2 = "",
                        a = 1;

                //arriba
                var arribaCariado = "", arribaObturado = "", arribaExoRealizada = "", arribaExoSimple = "", arribaExoQuirurgica = "",
                        arribaSinErupcionar = "", arribaEndoRealizada = "", arribaEndoIndicada = "", arribaSellantePresente = "",
                        arribaSellanteIndicado = "", arribaErosion = "", arribaProceRealizado = "", arribaCoronaBE = "",
                        arribaCoronaME = "", arribaProvBE = "", arribaProvME = "", arribaNucleoBE = "", arribaNucleoME = "",
                        arribaRemovibleBE = "", arribaRemovibleME = "", arribaImplante = "", arribaPlaca = "";

                //abajo
                var abajoCariado = "", abajoObturado = "", abajoExoRealizada = "", abajoExoSimple = "", abajoExoQuirurgica = "",
                        abajoSinErupcionar = "", abajoEndoRealizada = "", abajoEndoIndicada = "", abajoSellantePresente = "",
                        abajoSellanteIndicado = "", abajoErosion = "", abajoProceRealizado = "", abajoCoronaBE = "",
                        abajoCoronaME = "", abajoProvBE = "", abajoProvME = "", abajoNucleoBE = "", abajoNucleoME = "",
                        abajoRemovibleBE = "", abajoRemovibleME = "", abajoImplante = "", abajoPlaca = "";

                //izquierda                                                                
                var izquierdaCariado = "", izquierdaObturado = "", izquierdaExoRealizada = "", izquierdaExoSimple = "", izquierdaExoQuirurgica = "",
                        izquierdaSinErupcionar = "", izquierdaEndoRealizada = "", izquierdaEndoIndicada = "", izquierdaSellantePresente = "",
                        izquierdaSellanteIndicado = "", izquierdaErosion = "", izquierdaProceRealizado = "", izquierdaCoronaBE = "",
                        izquierdaCoronaME = "", izquierdaProvBE = "", izquierdaProvME = "", izquierdaNucleoBE = "", izquierdaNucleoME = "",
                        izquierdaRemovibleBE = "", izquierdaRemovibleME = "", izquierdaImplante = "", izquierdaPlaca = "";

                //derecha                                                                
                var derechaCariado = "", derechaObturado = "", derechaExoRealizada = "", derechaExoSimple = "", derechaExoQuirurgica = "",
                        derechaSinErupcionar = "", derechaEndoRealizada = "", derechaEndoIndicada = "", derechaSellantePresente = "",
                        derechaSellanteIndicado = "", derechaErosion = "", derechaProceRealizado = "", derechaCoronaBE = "",
                        derechaCoronaME = "", derechaProvBE = "", derechaProvME = "", derechaNucleoBE = "", derechaNucleoME = "",
                        derechaRemovibleBE = "", derechaRemovibleME = "", derechaImplante = "", derechaPlaca = "";

                //centro                                                                
                var centroCariado = "", centroObturado = "", centroExoRealizada = "", centroExoSimple = "", centroExoQuirurgica = "",
                        centroSinErupcionar = "", centroEndoRealizada = "", centroEndoIndicada = "", centroSellantePresente = "",
                        centroSellanteIndicado = "", centroErosion = "", centroProceRealizado = "", centroCoronaBE = "",
                        centroCoronaME = "", centroProvBE = "", centroProvME = "", centroNucleoBE = "", centroNucleoME = "",
                        centroRemovibleBE = "", centroRemovibleME = "", centroImplante = "", centroPlaca = "";

                var indiceNumero = 0;

                for (var i = 9 - 1; i >= 1; i--) {                                                              

                    <%if (hcOdontologia != null && hcOdontologia.getG_odontograma() != null) {%>

                        indiceNumero = calcularIndiceNumero("1", i);      
                        //arriba
                        arribaCariado = odontograma.pla[indiceNumero].ubicaciones[0].tipoMarca[0].valor === "SI" ? "click-red" : "";                                                                       
                        arribaObturado = odontograma.pla[indiceNumero].ubicaciones[0].tipoMarca[1].valor === "SI" ? "click-blue" : "";
                        arribaExoRealizada = odontograma.pla[indiceNumero].ubicaciones[0].tipoMarca[2].valor === "SI" ? "click-gray" : "";
                        arribaExoSimple = odontograma.pla[indiceNumero].ubicaciones[0].tipoMarca[3].valor === "SI" ? "click-blue-border" : "";
                        arribaExoQuirurgica = odontograma.pla[indiceNumero].ubicaciones[0].tipoMarca[4].valor === "SI" ? "click-red-border" : "";
                        arribaSinErupcionar = odontograma.pla[indiceNumero].ubicaciones[0].tipoMarca[5].valor === "SI" ? "click-erupcionar" : "";
                        arribaEndoRealizada = odontograma.pla[indiceNumero].ubicaciones[0].tipoMarca[6].valor === "SI" ? "click-endo" : "";
                        arribaEndoIndicada = odontograma.pla[indiceNumero].ubicaciones[0].tipoMarca[7].valor === "SI" ? "click-marron-border" : "";
                        arribaSellantePresente = odontograma.pla[indiceNumero].ubicaciones[0].tipoMarca[8].valor === "SI" ? "click-sellantep" : "";
                        arribaSellanteIndicado = odontograma.pla[indiceNumero].ubicaciones[0].tipoMarca[9].valor === "SI" ? "click-sellantei" : "";
                        arribaErosion = odontograma.pla[indiceNumero].ubicaciones[0].tipoMarca[10].valor === "SI" ? "click-erosion" : "";
                        arribaProceRealizado = odontograma.pla[indiceNumero].ubicaciones[0].tipoMarca[11].valor === "SI" ? "click-proce" : "";
                        arribaCoronaBE = odontograma.pla[indiceNumero].ubicaciones[0].tipoMarca[12].valor === "SI" ? "click-corobuen" : "";
                        arribaCoronaME = odontograma.pla[indiceNumero].ubicaciones[0].tipoMarca[13].valor === "SI" ? "click-coromal" : "";
                        arribaProvBE = odontograma.pla[indiceNumero].ubicaciones[0].tipoMarca[14].valor === "SI" ? "click-probuen" : "";
                        arribaProvME = odontograma.pla[indiceNumero].ubicaciones[0].tipoMarca[16].valor === "SI" ? "click-promal" : "";
                        arribaNucleoBE = odontograma.pla[indiceNumero].ubicaciones[0].tipoMarca[16].valor === "SI" ? "click-nuclebuen" : "";
                        arribaNucleoME = odontograma.pla[indiceNumero].ubicaciones[0].tipoMarca[17].valor === "SI" ? "click-nuclemal" : "";
                        arribaRemovibleBE = odontograma.pla[indiceNumero].ubicaciones[0].tipoMarca[18].valor === "SI" ? "click-remobuen" : "";
                        arribaRemovibleME = odontograma.pla[indiceNumero].ubicaciones[0].tipoMarca[19].valor === "SI" ? "click-remomal" : "";
                        arribaImplante = odontograma.pla[indiceNumero].ubicaciones[0].tipoMarca[20].valor === "SI" ? "click-implante" : "";
                        arribaPlaca = odontograma.pla[indiceNumero].ubicaciones[0].tipoMarca[21].valor === "SI" ? "click-green" : "";

                        //abajo
                        abajoCariado = odontograma.pla[indiceNumero].ubicaciones[1].tipoMarca[0].valor === "SI" ? "click-red" : "";                                                                       
                        abajoObturado = odontograma.pla[indiceNumero].ubicaciones[1].tipoMarca[1].valor === "SI" ? "click-blue" : "";
                        abajoExoRealizada = odontograma.pla[indiceNumero].ubicaciones[1].tipoMarca[2].valor === "SI" ? "click-gray" : "";
                        abajoExoSimple = odontograma.pla[indiceNumero].ubicaciones[1].tipoMarca[3].valor === "SI" ? "click-blue-border" : "";
                        abajoExoQuirurgica = odontograma.pla[indiceNumero].ubicaciones[1].tipoMarca[4].valor === "SI" ? "click-red-border" : "";
                        abajoSinErupcionar = odontograma.pla[indiceNumero].ubicaciones[1].tipoMarca[5].valor === "SI" ? "click-erupcionar" : "";
                        abajoEndoRealizada = odontograma.pla[indiceNumero].ubicaciones[1].tipoMarca[6].valor === "SI" ? "click-endo" : "";
                        abajoEndoIndicada = odontograma.pla[indiceNumero].ubicaciones[1].tipoMarca[7].valor === "SI" ? "click-marron-border" : "";
                        abajoSellantePresente = odontograma.pla[indiceNumero].ubicaciones[1].tipoMarca[8].valor === "SI" ? "click-sellantep" : "";
                        abajoSellanteIndicado = odontograma.pla[indiceNumero].ubicaciones[1].tipoMarca[9].valor === "SI" ? "click-sellantei" : "";
                        abajoErosion = odontograma.pla[indiceNumero].ubicaciones[1].tipoMarca[10].valor === "SI" ? "click-erosion" : "";
                        abajoProceRealizado = odontograma.pla[indiceNumero].ubicaciones[1].tipoMarca[11].valor === "SI" ? "click-proce" : "";
                        abajoCoronaBE = odontograma.pla[indiceNumero].ubicaciones[1].tipoMarca[12].valor === "SI" ? "click-corobuen" : "";
                        abajoCoronaME = odontograma.pla[indiceNumero].ubicaciones[1].tipoMarca[13].valor === "SI" ? "click-coromal" : "";
                        abajoProvBE = odontograma.pla[indiceNumero].ubicaciones[1].tipoMarca[14].valor === "SI" ? "click-probuen" : "";
                        abajoProvME = odontograma.pla[indiceNumero].ubicaciones[1].tipoMarca[16].valor === "SI" ? "click-promal" : "";
                        abajoNucleoBE = odontograma.pla[indiceNumero].ubicaciones[1].tipoMarca[16].valor === "SI" ? "click-nuclebuen" : "";
                        abajoNucleoME = odontograma.pla[indiceNumero].ubicaciones[1].tipoMarca[17].valor === "SI" ? "click-nuclemal" : "";
                        abajoRemovibleBE = odontograma.pla[indiceNumero].ubicaciones[1].tipoMarca[18].valor === "SI" ? "click-remobuen" : "";
                        abajoRemovibleME = odontograma.pla[indiceNumero].ubicaciones[1].tipoMarca[19].valor === "SI" ? "click-remomal" : "";
                        abajoImplante = odontograma.pla[indiceNumero].ubicaciones[1].tipoMarca[20].valor === "SI" ? "click-implante" : "";
                        abajoPlaca = odontograma.pla[indiceNumero].ubicaciones[1].tipoMarca[21].valor === "SI" ? "click-green" : "";

                        //izquierda
                        izquierdaCariado = odontograma.pla[indiceNumero].ubicaciones[2].tipoMarca[0].valor === "SI" ? "click-red" : "";                                                                       
                        izquierdaObturado = odontograma.pla[indiceNumero].ubicaciones[2].tipoMarca[1].valor === "SI" ? "click-blue" : "";
                        izquierdaExoRealizada = odontograma.pla[indiceNumero].ubicaciones[2].tipoMarca[2].valor === "SI" ? "click-gray" : "";
                        izquierdaExoSimple = odontograma.pla[indiceNumero].ubicaciones[2].tipoMarca[3].valor === "SI" ? "click-blue-border" : "";
                        izquierdaExoQuirurgica = odontograma.pla[indiceNumero].ubicaciones[2].tipoMarca[4].valor === "SI" ? "click-red-border" : "";
                        izquierdaSinErupcionar = odontograma.pla[indiceNumero].ubicaciones[2].tipoMarca[5].valor === "SI" ? "click-erupcionar" : "";
                        izquierdaEndoRealizada = odontograma.pla[indiceNumero].ubicaciones[2].tipoMarca[6].valor === "SI" ? "click-endo" : "";
                        izquierdaEndoIndicada = odontograma.pla[indiceNumero].ubicaciones[2].tipoMarca[7].valor === "SI" ? "click-marron-border" : "";
                        izquierdaSellantePresente = odontograma.pla[indiceNumero].ubicaciones[2].tipoMarca[8].valor === "SI" ? "click-sellantep" : "";
                        izquierdaSellanteIndicado = odontograma.pla[indiceNumero].ubicaciones[2].tipoMarca[9].valor === "SI" ? "click-sellantei" : "";
                        izquierdaErosion = odontograma.pla[indiceNumero].ubicaciones[2].tipoMarca[10].valor === "SI" ? "click-erosion" : "";
                        izquierdaProceRealizado = odontograma.pla[indiceNumero].ubicaciones[2].tipoMarca[11].valor === "SI" ? "click-proce" : "";
                        izquierdaCoronaBE = odontograma.pla[indiceNumero].ubicaciones[2].tipoMarca[12].valor === "SI" ? "click-corobuen" : "";
                        izquierdaCoronaME = odontograma.pla[indiceNumero].ubicaciones[2].tipoMarca[13].valor === "SI" ? "click-coromal" : "";
                        izquierdaProvBE = odontograma.pla[indiceNumero].ubicaciones[2].tipoMarca[14].valor === "SI" ? "click-probuen" : "";
                        izquierdaProvME = odontograma.pla[indiceNumero].ubicaciones[2].tipoMarca[16].valor === "SI" ? "click-promal" : "";
                        izquierdaNucleoBE = odontograma.pla[indiceNumero].ubicaciones[2].tipoMarca[16].valor === "SI" ? "click-nuclebuen" : "";
                        izquierdaNucleoME = odontograma.pla[indiceNumero].ubicaciones[2].tipoMarca[17].valor === "SI" ? "click-nuclemal" : "";
                        izquierdaRemovibleBE = odontograma.pla[indiceNumero].ubicaciones[2].tipoMarca[18].valor === "SI" ? "click-remobuen" : "";
                        izquierdaRemovibleME = odontograma.pla[indiceNumero].ubicaciones[2].tipoMarca[19].valor === "SI" ? "click-remomal" : "";
                        izquierdaImplante = odontograma.pla[indiceNumero].ubicaciones[2].tipoMarca[20].valor === "SI" ? "click-implante" : "";
                        izquierdaPlaca = odontograma.pla[indiceNumero].ubicaciones[2].tipoMarca[21].valor === "SI" ? "click-green" : "";

                        //derecha
                        derechaCariado = odontograma.pla[indiceNumero].ubicaciones[3].tipoMarca[0].valor === "SI" ? "click-red" : "";                                                                       
                        derechaObturado = odontograma.pla[indiceNumero].ubicaciones[3].tipoMarca[1].valor === "SI" ? "click-blue" : "";
                        derechaExoRealizada = odontograma.pla[indiceNumero].ubicaciones[3].tipoMarca[2].valor === "SI" ? "click-gray" : "";
                        derechaExoSimple = odontograma.pla[indiceNumero].ubicaciones[3].tipoMarca[3].valor === "SI" ? "click-blue-border" : "";
                        derechaExoQuirurgica = odontograma.pla[indiceNumero].ubicaciones[3].tipoMarca[4].valor === "SI" ? "click-red-border" : "";
                        derechaSinErupcionar = odontograma.pla[indiceNumero].ubicaciones[3].tipoMarca[5].valor === "SI" ? "click-erupcionar" : "";
                        derechaEndoRealizada = odontograma.pla[indiceNumero].ubicaciones[3].tipoMarca[6].valor === "SI" ? "click-endo" : "";
                        derechaEndoIndicada = odontograma.pla[indiceNumero].ubicaciones[3].tipoMarca[7].valor === "SI" ? "click-marron-border" : "";
                        derechaSellantePresente = odontograma.pla[indiceNumero].ubicaciones[3].tipoMarca[8].valor === "SI" ? "click-sellantep" : "";
                        derechaSellanteIndicado = odontograma.pla[indiceNumero].ubicaciones[3].tipoMarca[9].valor === "SI" ? "click-sellantei" : "";
                        derechaErosion = odontograma.pla[indiceNumero].ubicaciones[3].tipoMarca[10].valor === "SI" ? "click-erosion" : "";
                        derechaProceRealizado = odontograma.pla[indiceNumero].ubicaciones[3].tipoMarca[11].valor === "SI" ? "click-proce" : "";
                        derechaCoronaBE = odontograma.pla[indiceNumero].ubicaciones[3].tipoMarca[12].valor === "SI" ? "click-corobuen" : "";
                        derechaCoronaME = odontograma.pla[indiceNumero].ubicaciones[3].tipoMarca[13].valor === "SI" ? "click-coromal" : "";
                        derechaProvBE = odontograma.pla[indiceNumero].ubicaciones[3].tipoMarca[14].valor === "SI" ? "click-probuen" : "";
                        derechaProvME = odontograma.pla[indiceNumero].ubicaciones[3].tipoMarca[16].valor === "SI" ? "click-promal" : "";
                        derechaNucleoBE = odontograma.pla[indiceNumero].ubicaciones[3].tipoMarca[16].valor === "SI" ? "click-nuclebuen" : "";
                        derechaNucleoME = odontograma.pla[indiceNumero].ubicaciones[3].tipoMarca[17].valor === "SI" ? "click-nuclemal" : "";
                        derechaRemovibleBE = odontograma.pla[indiceNumero].ubicaciones[3].tipoMarca[18].valor === "SI" ? "click-remobuen" : "";
                        derechaRemovibleME = odontograma.pla[indiceNumero].ubicaciones[3].tipoMarca[19].valor === "SI" ? "click-remomal" : "";
                        derechaImplante = odontograma.pla[indiceNumero].ubicaciones[3].tipoMarca[20].valor === "SI" ? "click-implante" : "";
                        derechaPlaca = odontograma.pla[indiceNumero].ubicaciones[3].tipoMarca[21].valor === "SI" ? "click-green" : "";

                        //centro
                        centroCariado = odontograma.pla[indiceNumero].ubicaciones[4].tipoMarca[0].valor === "SI" ? "click-red" : "";                                                                       
                        centroObturado = odontograma.pla[indiceNumero].ubicaciones[4].tipoMarca[1].valor === "SI" ? "click-blue" : "";
                        centroExoRealizada = odontograma.pla[indiceNumero].ubicaciones[4].tipoMarca[2].valor === "SI" ? "click-gray" : "";
                        centroExoSimple = odontograma.pla[indiceNumero].ubicaciones[4].tipoMarca[3].valor === "SI" ? "click-blue-border" : "";
                        centroExoQuirurgica = odontograma.pla[indiceNumero].ubicaciones[4].tipoMarca[4].valor === "SI" ? "click-red-border" : "";
                        centroSinErupcionar = odontograma.pla[indiceNumero].ubicaciones[4].tipoMarca[5].valor === "SI" ? "click-erupcionar" : "";
                        centroEndoRealizada = odontograma.pla[indiceNumero].ubicaciones[4].tipoMarca[6].valor === "SI" ? "click-endo" : "";
                        centroEndoIndicada = odontograma.pla[indiceNumero].ubicaciones[4].tipoMarca[7].valor === "SI" ? "click-marron-border" : "";
                        centroSellantePresente = odontograma.pla[indiceNumero].ubicaciones[4].tipoMarca[8].valor === "SI" ? "click-sellantep" : "";
                        centroSellanteIndicado = odontograma.pla[indiceNumero].ubicaciones[4].tipoMarca[9].valor === "SI" ? "click-sellantei" : "";
                        centroErosion = odontograma.pla[indiceNumero].ubicaciones[4].tipoMarca[10].valor === "SI" ? "click-erosion" : "";
                        centroProceRealizado = odontograma.pla[indiceNumero].ubicaciones[4].tipoMarca[11].valor === "SI" ? "click-proce" : "";
                        centroCoronaBE = odontograma.pla[indiceNumero].ubicaciones[4].tipoMarca[12].valor === "SI" ? "click-corobuen" : "";
                        centroCoronaME = odontograma.pla[indiceNumero].ubicaciones[4].tipoMarca[13].valor === "SI" ? "click-coromal" : "";
                        centroProvBE = odontograma.pla[indiceNumero].ubicaciones[4].tipoMarca[14].valor === "SI" ? "click-probuen" : "";
                        centroProvME = odontograma.pla[indiceNumero].ubicaciones[4].tipoMarca[16].valor === "SI" ? "click-promal" : "";
                        centroNucleoBE = odontograma.pla[indiceNumero].ubicaciones[4].tipoMarca[16].valor === "SI" ? "click-nuclebuen" : "";
                        centroNucleoME = odontograma.pla[indiceNumero].ubicaciones[4].tipoMarca[17].valor === "SI" ? "click-nuclemal" : "";
                        centroRemovibleBE = odontograma.pla[indiceNumero].ubicaciones[4].tipoMarca[18].valor === "SI" ? "click-remobuen" : "";
                        centroRemovibleME = odontograma.pla[indiceNumero].ubicaciones[4].tipoMarca[19].valor === "SI" ? "click-remomal" : "";
                        centroImplante = odontograma.pla[indiceNumero].ubicaciones[4].tipoMarca[20].valor === "SI" ? "click-implante" : "";
                        centroPlaca = odontograma.pla[indiceNumero].ubicaciones[4].tipoMarca[21].valor === "SI" ? "click-green" : "";

                        <%}%>
                            //Dientes Definitivos Cuandrante Derecho (Superior)
                            htmlRight += '<div data-name="value" id="diente1' + i + '" class="diente">' +
                                    '<span style="margin-left: -19px; margin-bottom:5px; display: inline-block !important; border-radius: 10px !important;" class="label label-info">1' + i + '</span>' +
                                    '<div id="t1' + i + '" class="cuadro click ' + arribaCariado + ' '+arribaObturado+' '+arribaExoRealizada+' '+arribaExoSimple+' '+arribaExoQuirurgica +
                                            ' '+arribaSinErupcionar+' '+arribaEndoRealizada+' '+arribaEndoIndicada+' '+arribaSellantePresente+' '+arribaSellanteIndicado+' '+arribaErosion+
                                            ' '+arribaProceRealizado+' '+arribaCoronaBE+' '+arribaCoronaME+' '+arribaProvBE+' '+arribaProvME+' '+arribaNucleoBE+' '+
                                            ' '+arribaNucleoME+' '+arribaRemovibleBE+' '+arribaRemovibleME+' '+arribaImplante+' '+ arribaPlaca +
                                            ' ">' +
                                        '<input type="hidden" id="arriba" value="1'+i+'"/>' +
                                    '</div>' +
                                    '<div id="l1' + i + '" class="cuadro izquierdo click ' + izquierdaCariado + ' '+izquierdaObturado+' '+izquierdaExoRealizada+' '+izquierdaExoSimple+' '+izquierdaExoQuirurgica +
                                            ' '+izquierdaSinErupcionar+' '+izquierdaEndoRealizada+' '+izquierdaEndoIndicada+' '+izquierdaSellantePresente+' '+izquierdaSellanteIndicado+' '+izquierdaErosion+
                                            ' '+izquierdaProceRealizado+' '+izquierdaCoronaBE+' '+izquierdaCoronaME+' '+izquierdaProvBE+' '+izquierdaProvME+' '+izquierdaNucleoBE+' '+
                                            ' '+izquierdaNucleoME+' '+izquierdaRemovibleBE+' '+izquierdaRemovibleME+' '+izquierdaImplante+' '+ izquierdaPlaca +
                                            ' ">' +
                                        '<input type="hidden" id="izquierda" value="1'+i+'"/>' +
                                    '</div>' +
                                    '<div id="b1' + i + '" class="cuadro debajo click ' + abajoCariado + ' '+abajoObturado+' '+abajoExoRealizada+' '+abajoExoSimple+' '+abajoExoQuirurgica +
                                            ' '+abajoSinErupcionar+' '+abajoEndoRealizada+' '+abajoEndoIndicada+' '+abajoSellantePresente+' '+abajoSellanteIndicado+' '+abajoErosion+
                                            ' '+abajoProceRealizado+' '+abajoCoronaBE+' '+abajoCoronaME+' '+abajoProvBE+' '+izquierdaProvME+' '+abajoNucleoBE+' '+
                                            ' '+abajoNucleoME+' '+abajoRemovibleBE+' '+abajoRemovibleME+' '+abajoImplante+' '+ abajoPlaca +
                                            ' ">' +
                                        '<input type="hidden" id="abajo" value="1'+i+'"/>' +
                                    '</div>' +
                                    '<div id="r1' + i + '" class="cuadro derecha click click ' + derechaCariado + ' '+derechaObturado+' '+derechaExoRealizada+' '+derechaExoSimple+' '+derechaExoQuirurgica +
                                            ' '+derechaSinErupcionar+' '+derechaEndoRealizada+' '+derechaEndoIndicada+' '+derechaSellantePresente+' '+derechaSellanteIndicado+' '+derechaErosion+
                                            ' '+derechaProceRealizado+' '+derechaCoronaBE+' '+derechaCoronaME+' '+derechaProvBE+' '+derechaProvME+' '+derechaNucleoBE+' '+
                                            ' '+derechaNucleoME+' '+derechaRemovibleBE+' '+derechaRemovibleME+' '+derechaImplante+' '+ derechaPlaca +
                                            ' ">' +
                                        '<input type="hidden" id="derecha" value="1'+i+'"/>' +
                                    '</div>' +
                                    '<div id="c1' + i + '" class="centro click ' + centroCariado + ' '+centroObturado+' '+centroExoRealizada+' '+centroExoSimple+' '+centroExoQuirurgica +
                                            ' '+centroSinErupcionar+' '+centroEndoRealizada+' '+centroEndoIndicada+' '+centroSellantePresente+' '+centroSellanteIndicado+' '+centroErosion+
                                            ' '+centroProceRealizado+' '+centroCoronaBE+' '+centroCoronaME+' '+centroProvBE+' '+centroProvME+' '+centroNucleoBE+' '+
                                            ' '+centroNucleoME+' '+centroRemovibleBE+' '+centroRemovibleME+' '+centroImplante+' '+ centroPlaca +
                                            ' ">' +
                                        '<input type="hidden" id="centro" value="1'+i+'"/>' +
                                    '</div>' +
                                    '</div>';                                                            

                        <%if (hcOdontologia != null  && hcOdontologia.getG_odontograma() != null) {%>

                            indiceNumero = calcularIndiceNumero("4", i);                                                                                                                                                
                            arribaCariado = odontograma.pla[indiceNumero].ubicaciones[0].tipoMarca[0].valor === "SI" ? "click-red" : "";                                                                        
                            arribaObturado = odontograma.pla[indiceNumero].ubicaciones[0].tipoMarca[1].valor === "SI" ? "click-blue" : "";
                            arribaExoRealizada = odontograma.pla[indiceNumero].ubicaciones[0].tipoMarca[2].valor === "SI" ? "click-gray" : "";
                            arribaExoSimple = odontograma.pla[indiceNumero].ubicaciones[0].tipoMarca[3].valor === "SI" ? "click-blue-border" : "";
                            arribaExoQuirurgica = odontograma.pla[indiceNumero].ubicaciones[0].tipoMarca[4].valor === "SI" ? "click-red-border" : "";
                            arribaSinErupcionar = odontograma.pla[indiceNumero].ubicaciones[0].tipoMarca[5].valor === "SI" ? "click-erupcionar" : "";
                            arribaEndoRealizada = odontograma.pla[indiceNumero].ubicaciones[0].tipoMarca[6].valor === "SI" ? "click-endo" : "";
                            arribaEndoIndicada = odontograma.pla[indiceNumero].ubicaciones[0].tipoMarca[7].valor === "SI" ? "click-marron-border" : "";
                            arribaSellantePresente = odontograma.pla[indiceNumero].ubicaciones[0].tipoMarca[8].valor === "SI" ? "click-sellantep" : "";
                            arribaSellanteIndicado = odontograma.pla[indiceNumero].ubicaciones[0].tipoMarca[9].valor === "SI" ? "click-sellantei" : "";
                            arribaErosion = odontograma.pla[indiceNumero].ubicaciones[0].tipoMarca[10].valor === "SI" ? "click-erosion" : "";
                            arribaProceRealizado = odontograma.pla[indiceNumero].ubicaciones[0].tipoMarca[11].valor === "SI" ? "click-proce" : "";
                            arribaCoronaBE = odontograma.pla[indiceNumero].ubicaciones[0].tipoMarca[12].valor === "SI" ? "click-corobuen" : "";
                            arribaCoronaME = odontograma.pla[indiceNumero].ubicaciones[0].tipoMarca[13].valor === "SI" ? "click-coromal" : "";
                            arribaProvBE = odontograma.pla[indiceNumero].ubicaciones[0].tipoMarca[14].valor === "SI" ? "click-probuen" : "";
                            arribaProvME = odontograma.pla[indiceNumero].ubicaciones[0].tipoMarca[16].valor === "SI" ? "click-promal" : "";
                            arribaNucleoBE = odontograma.pla[indiceNumero].ubicaciones[0].tipoMarca[16].valor === "SI" ? "click-nuclebuen" : "";
                            arribaNucleoME = odontograma.pla[indiceNumero].ubicaciones[0].tipoMarca[17].valor === "SI" ? "click-nuclemal" : "";
                            arribaRemovibleBE = odontograma.pla[indiceNumero].ubicaciones[0].tipoMarca[18].valor === "SI" ? "click-remobuen" : "";
                            arribaRemovibleME = odontograma.pla[indiceNumero].ubicaciones[0].tipoMarca[19].valor === "SI" ? "click-remomal" : "";
                            arribaImplante = odontograma.pla[indiceNumero].ubicaciones[0].tipoMarca[20].valor === "SI" ? "click-implante" : "";
                            arribaPlaca = odontograma.pla[indiceNumero].ubicaciones[0].tipoMarca[21].valor === "SI" ? "click-green" : "";

                            //abajo
                            abajoCariado = odontograma.pla[indiceNumero].ubicaciones[1].tipoMarca[0].valor === "SI" ? "click-red" : "";                                                                       
                            abajoObturado = odontograma.pla[indiceNumero].ubicaciones[1].tipoMarca[1].valor === "SI" ? "click-blue" : "";
                            abajoExoRealizada = odontograma.pla[indiceNumero].ubicaciones[1].tipoMarca[2].valor === "SI" ? "click-gray" : "";
                            abajoExoSimple = odontograma.pla[indiceNumero].ubicaciones[1].tipoMarca[3].valor === "SI" ? "click-blue-border" : "";
                            abajoExoQuirurgica = odontograma.pla[indiceNumero].ubicaciones[1].tipoMarca[4].valor === "SI" ? "click-red-border" : "";
                            abajoSinErupcionar = odontograma.pla[indiceNumero].ubicaciones[1].tipoMarca[5].valor === "SI" ? "click-erupcionar" : "";
                            abajoEndoRealizada = odontograma.pla[indiceNumero].ubicaciones[1].tipoMarca[6].valor === "SI" ? "click-endo" : "";
                            abajoEndoIndicada = odontograma.pla[indiceNumero].ubicaciones[1].tipoMarca[7].valor === "SI" ? "click-marron-border" : "";
                            abajoSellantePresente = odontograma.pla[indiceNumero].ubicaciones[1].tipoMarca[8].valor === "SI" ? "click-sellantep" : "";
                            abajoSellanteIndicado = odontograma.pla[indiceNumero].ubicaciones[1].tipoMarca[9].valor === "SI" ? "click-sellantei" : "";
                            abajoErosion = odontograma.pla[indiceNumero].ubicaciones[1].tipoMarca[10].valor === "SI" ? "click-erosion" : "";
                            abajoProceRealizado = odontograma.pla[indiceNumero].ubicaciones[1].tipoMarca[11].valor === "SI" ? "click-proce" : "";
                            abajoCoronaBE = odontograma.pla[indiceNumero].ubicaciones[1].tipoMarca[12].valor === "SI" ? "click-corobuen" : "";
                            abajoCoronaME = odontograma.pla[indiceNumero].ubicaciones[1].tipoMarca[13].valor === "SI" ? "click-coromal" : "";
                            abajoProvBE = odontograma.pla[indiceNumero].ubicaciones[1].tipoMarca[14].valor === "SI" ? "click-probuen" : "";
                            abajoProvME = odontograma.pla[indiceNumero].ubicaciones[1].tipoMarca[16].valor === "SI" ? "click-promal" : "";
                            abajoNucleoBE = odontograma.pla[indiceNumero].ubicaciones[1].tipoMarca[16].valor === "SI" ? "click-nuclebuen" : "";
                            abajoNucleoME = odontograma.pla[indiceNumero].ubicaciones[1].tipoMarca[17].valor === "SI" ? "click-nuclemal" : "";
                            abajoRemovibleBE = odontograma.pla[indiceNumero].ubicaciones[1].tipoMarca[18].valor === "SI" ? "click-remobuen" : "";
                            abajoRemovibleME = odontograma.pla[indiceNumero].ubicaciones[1].tipoMarca[19].valor === "SI" ? "click-remomal" : "";
                            abajoImplante = odontograma.pla[indiceNumero].ubicaciones[1].tipoMarca[20].valor === "SI" ? "click-implante" : "";
                            abajoPlaca = odontograma.pla[indiceNumero].ubicaciones[1].tipoMarca[21].valor === "SI" ? "click-green" : "";

                            //izquierda
                            izquierdaCariado = odontograma.pla[indiceNumero].ubicaciones[2].tipoMarca[0].valor === "SI" ? "click-red" : "";                                                                       
                            izquierdaObturado = odontograma.pla[indiceNumero].ubicaciones[2].tipoMarca[1].valor === "SI" ? "click-blue" : "";
                            izquierdaExoRealizada = odontograma.pla[indiceNumero].ubicaciones[2].tipoMarca[2].valor === "SI" ? "click-gray" : "";
                            izquierdaExoSimple = odontograma.pla[indiceNumero].ubicaciones[2].tipoMarca[3].valor === "SI" ? "click-blue-border" : "";
                            izquierdaExoQuirurgica = odontograma.pla[indiceNumero].ubicaciones[2].tipoMarca[4].valor === "SI" ? "click-red-border" : "";
                            izquierdaSinErupcionar = odontograma.pla[indiceNumero].ubicaciones[2].tipoMarca[5].valor === "SI" ? "click-erupcionar" : "";
                            izquierdaEndoRealizada = odontograma.pla[indiceNumero].ubicaciones[2].tipoMarca[6].valor === "SI" ? "click-endo" : "";
                            izquierdaEndoIndicada = odontograma.pla[indiceNumero].ubicaciones[2].tipoMarca[7].valor === "SI" ? "click-marron-border" : "";
                            izquierdaSellantePresente = odontograma.pla[indiceNumero].ubicaciones[2].tipoMarca[8].valor === "SI" ? "click-sellantep" : "";
                            izquierdaSellanteIndicado = odontograma.pla[indiceNumero].ubicaciones[2].tipoMarca[9].valor === "SI" ? "click-sellantei" : "";
                            izquierdaErosion = odontograma.pla[indiceNumero].ubicaciones[2].tipoMarca[10].valor === "SI" ? "click-erosion" : "";
                            izquierdaProceRealizado = odontograma.pla[indiceNumero].ubicaciones[2].tipoMarca[11].valor === "SI" ? "click-proce" : "";
                            izquierdaCoronaBE = odontograma.pla[indiceNumero].ubicaciones[2].tipoMarca[12].valor === "SI" ? "click-corobuen" : "";
                            izquierdaCoronaME = odontograma.pla[indiceNumero].ubicaciones[2].tipoMarca[13].valor === "SI" ? "click-coromal" : "";
                            izquierdaProvBE = odontograma.pla[indiceNumero].ubicaciones[2].tipoMarca[14].valor === "SI" ? "click-probuen" : "";
                            izquierdaProvME = odontograma.pla[indiceNumero].ubicaciones[2].tipoMarca[16].valor === "SI" ? "click-promal" : "";
                            izquierdaNucleoBE = odontograma.pla[indiceNumero].ubicaciones[2].tipoMarca[16].valor === "SI" ? "click-nuclebuen" : "";
                            izquierdaNucleoME = odontograma.pla[indiceNumero].ubicaciones[2].tipoMarca[17].valor === "SI" ? "click-nuclemal" : "";
                            izquierdaRemovibleBE = odontograma.pla[indiceNumero].ubicaciones[2].tipoMarca[18].valor === "SI" ? "click-remobuen" : "";
                            izquierdaRemovibleME = odontograma.pla[indiceNumero].ubicaciones[2].tipoMarca[19].valor === "SI" ? "click-remomal" : "";
                            izquierdaImplante = odontograma.pla[indiceNumero].ubicaciones[2].tipoMarca[20].valor === "SI" ? "click-implante" : "";
                            izquierdaPlaca = odontograma.pla[indiceNumero].ubicaciones[2].tipoMarca[21].valor === "SI" ? "click-green" : "";

                            //derecha
                            derechaCariado = odontograma.pla[indiceNumero].ubicaciones[3].tipoMarca[0].valor === "SI" ? "click-red" : "";                                                                       
                            derechaObturado = odontograma.pla[indiceNumero].ubicaciones[3].tipoMarca[1].valor === "SI" ? "click-blue" : "";
                            derechaExoRealizada = odontograma.pla[indiceNumero].ubicaciones[3].tipoMarca[2].valor === "SI" ? "click-gray" : "";
                            derechaExoSimple = odontograma.pla[indiceNumero].ubicaciones[3].tipoMarca[3].valor === "SI" ? "click-blue-border" : "";
                            derechaExoQuirurgica = odontograma.pla[indiceNumero].ubicaciones[3].tipoMarca[4].valor === "SI" ? "click-red-border" : "";
                            derechaSinErupcionar = odontograma.pla[indiceNumero].ubicaciones[3].tipoMarca[5].valor === "SI" ? "click-erupcionar" : "";
                            derechaEndoRealizada = odontograma.pla[indiceNumero].ubicaciones[3].tipoMarca[6].valor === "SI" ? "click-endo" : "";
                            derechaEndoIndicada = odontograma.pla[indiceNumero].ubicaciones[3].tipoMarca[7].valor === "SI" ? "click-marron-border" : "";
                            derechaSellantePresente = odontograma.pla[indiceNumero].ubicaciones[3].tipoMarca[8].valor === "SI" ? "click-sellantep" : "";
                            derechaSellanteIndicado = odontograma.pla[indiceNumero].ubicaciones[3].tipoMarca[9].valor === "SI" ? "click-sellantei" : "";
                            derechaErosion = odontograma.pla[indiceNumero].ubicaciones[3].tipoMarca[10].valor === "SI" ? "click-erosion" : "";
                            derechaProceRealizado = odontograma.pla[indiceNumero].ubicaciones[3].tipoMarca[11].valor === "SI" ? "click-proce" : "";
                            derechaCoronaBE = odontograma.pla[indiceNumero].ubicaciones[3].tipoMarca[12].valor === "SI" ? "click-corobuen" : "";
                            derechaCoronaME = odontograma.pla[indiceNumero].ubicaciones[3].tipoMarca[13].valor === "SI" ? "click-coromal" : "";
                            derechaProvBE = odontograma.pla[indiceNumero].ubicaciones[3].tipoMarca[14].valor === "SI" ? "click-probuen" : "";
                            derechaProvME = odontograma.pla[indiceNumero].ubicaciones[3].tipoMarca[16].valor === "SI" ? "click-promal" : "";
                            derechaNucleoBE = odontograma.pla[indiceNumero].ubicaciones[3].tipoMarca[16].valor === "SI" ? "click-nuclebuen" : "";
                            derechaNucleoME = odontograma.pla[indiceNumero].ubicaciones[3].tipoMarca[17].valor === "SI" ? "click-nuclemal" : "";
                            derechaRemovibleBE = odontograma.pla[indiceNumero].ubicaciones[3].tipoMarca[18].valor === "SI" ? "click-remobuen" : "";
                            derechaRemovibleME = odontograma.pla[indiceNumero].ubicaciones[3].tipoMarca[19].valor === "SI" ? "click-remomal" : "";
                            derechaImplante = odontograma.pla[indiceNumero].ubicaciones[3].tipoMarca[20].valor === "SI" ? "click-implante" : "";
                            derechaPlaca = odontograma.pla[indiceNumero].ubicaciones[3].tipoMarca[21].valor === "SI" ? "click-green" : "";

                            //centro
                            centroCariado = odontograma.pla[indiceNumero].ubicaciones[4].tipoMarca[0].valor === "SI" ? "click-red" : "";                                                                       
                            centroObturado = odontograma.pla[indiceNumero].ubicaciones[4].tipoMarca[1].valor === "SI" ? "click-blue" : "";
                            centroExoRealizada = odontograma.pla[indiceNumero].ubicaciones[4].tipoMarca[2].valor === "SI" ? "click-gray" : "";
                            centroExoSimple = odontograma.pla[indiceNumero].ubicaciones[4].tipoMarca[3].valor === "SI" ? "click-blue-border" : "";
                            centroExoQuirurgica = odontograma.pla[indiceNumero].ubicaciones[4].tipoMarca[4].valor === "SI" ? "click-red-border" : "";
                            centroSinErupcionar = odontograma.pla[indiceNumero].ubicaciones[4].tipoMarca[5].valor === "SI" ? "click-erupcionar" : "";
                            centroEndoRealizada = odontograma.pla[indiceNumero].ubicaciones[4].tipoMarca[6].valor === "SI" ? "click-endo" : "";
                            centroEndoIndicada = odontograma.pla[indiceNumero].ubicaciones[4].tipoMarca[7].valor === "SI" ? "click-marron-border" : "";
                            centroSellantePresente = odontograma.pla[indiceNumero].ubicaciones[4].tipoMarca[8].valor === "SI" ? "click-sellantep" : "";
                            centroSellanteIndicado = odontograma.pla[indiceNumero].ubicaciones[4].tipoMarca[9].valor === "SI" ? "click-sellantei" : "";
                            centroErosion = odontograma.pla[indiceNumero].ubicaciones[4].tipoMarca[10].valor === "SI" ? "click-erosion" : "";
                            centroProceRealizado = odontograma.pla[indiceNumero].ubicaciones[4].tipoMarca[11].valor === "SI" ? "click-proce" : "";
                            centroCoronaBE = odontograma.pla[indiceNumero].ubicaciones[4].tipoMarca[12].valor === "SI" ? "click-corobuen" : "";
                            centroCoronaME = odontograma.pla[indiceNumero].ubicaciones[4].tipoMarca[13].valor === "SI" ? "click-coromal" : "";
                            centroProvBE = odontograma.pla[indiceNumero].ubicaciones[4].tipoMarca[14].valor === "SI" ? "click-probuen" : "";
                            centroProvME = odontograma.pla[indiceNumero].ubicaciones[4].tipoMarca[16].valor === "SI" ? "click-promal" : "";
                            centroNucleoBE = odontograma.pla[indiceNumero].ubicaciones[4].tipoMarca[16].valor === "SI" ? "click-nuclebuen" : "";
                            centroNucleoME = odontograma.pla[indiceNumero].ubicaciones[4].tipoMarca[17].valor === "SI" ? "click-nuclemal" : "";
                            centroRemovibleBE = odontograma.pla[indiceNumero].ubicaciones[4].tipoMarca[18].valor === "SI" ? "click-remobuen" : "";
                            centroRemovibleME = odontograma.pla[indiceNumero].ubicaciones[4].tipoMarca[19].valor === "SI" ? "click-remomal" : "";
                            centroImplante = odontograma.pla[indiceNumero].ubicaciones[4].tipoMarca[20].valor === "SI" ? "click-implante" : "";
                            centroPlaca = odontograma.pla[indiceNumero].ubicaciones[4].tipoMarca[21].valor === "SI" ? "click-green" : "";
                        <%}%>

                        //Dientes Definitivos Cuandrante Derecho (Inferior)
                        htmlRight2 += '<div data-name="value" id="diente4' + i + '" class="diente">' +
                                '<span style="margin-left: -19px; margin-bottom:5px; display: inline-block !important; border-radius: 10px !important;" class="label label-info">4' + i + '</span>' +
                                '<div id="t4' + i + '" class="cuadro click ' + arribaCariado + ' '+arribaObturado+' '+arribaExoRealizada+' '+arribaExoSimple+' '+arribaExoQuirurgica +
                                            ' '+arribaSinErupcionar+' '+arribaEndoRealizada+' '+arribaEndoIndicada+' '+arribaSellantePresente+' '+arribaSellanteIndicado+' '+arribaErosion+
                                            ' '+arribaProceRealizado+' '+arribaCoronaBE+' '+arribaCoronaME+' '+arribaProvBE+' '+arribaProvME+' '+arribaNucleoBE+' '+
                                            ' '+arribaNucleoME+' '+arribaRemovibleBE+' '+arribaRemovibleME+' '+arribaImplante+' '+ arribaPlaca +
                                            ' ">' +
                                    '<input type="hidden" id="arriba" value="4'+i+'"/>' +
                                '</div>' +
                                '<div id="l4' + i + '" class="cuadro izquierdo click ' + izquierdaCariado + ' '+izquierdaObturado+' '+izquierdaExoRealizada+' '+izquierdaExoSimple+' '+izquierdaExoQuirurgica +
                                            ' '+izquierdaSinErupcionar+' '+izquierdaEndoRealizada+' '+izquierdaEndoIndicada+' '+izquierdaSellantePresente+' '+izquierdaSellanteIndicado+' '+izquierdaErosion+
                                            ' '+izquierdaProceRealizado+' '+izquierdaCoronaBE+' '+izquierdaCoronaME+' '+izquierdaProvBE+' '+izquierdaProvME+' '+izquierdaNucleoBE+' '+
                                            ' '+izquierdaNucleoME+' '+izquierdaRemovibleBE+' '+izquierdaRemovibleME+' '+izquierdaImplante+' '+ izquierdaPlaca +
                                            ' ">' +
                                    '<input type="hidden" id="izquierda" value="4'+i+'"/>' +
                                '</div>' +
                                '<div id="b4' + i + '" class="cuadro debajo click ' + abajoCariado + ' '+abajoObturado+' '+abajoExoRealizada+' '+abajoExoSimple+' '+abajoExoQuirurgica +
                                            ' '+abajoSinErupcionar+' '+abajoEndoRealizada+' '+abajoEndoIndicada+' '+abajoSellantePresente+' '+abajoSellanteIndicado+' '+abajoErosion+
                                            ' '+abajoProceRealizado+' '+abajoCoronaBE+' '+abajoCoronaME+' '+abajoProvBE+' '+izquierdaProvME+' '+abajoNucleoBE+' '+
                                            ' '+abajoNucleoME+' '+abajoRemovibleBE+' '+abajoRemovibleME+' '+abajoImplante+' '+ abajoPlaca +
                                            ' ">' +
                                    '<input type="hidden" id="abajo" value="4'+i+'"/>' +
                                '</div>' +
                                '<div id="r4' + i + '" class="cuadro derecha click click ' + derechaCariado + ' '+derechaObturado+' '+derechaExoRealizada+' '+derechaExoSimple+' '+derechaExoQuirurgica +
                                            ' '+derechaSinErupcionar+' '+derechaEndoRealizada+' '+derechaEndoIndicada+' '+derechaSellantePresente+' '+derechaSellanteIndicado+' '+derechaErosion+
                                            ' '+derechaProceRealizado+' '+derechaCoronaBE+' '+derechaCoronaME+' '+derechaProvBE+' '+derechaProvME+' '+derechaNucleoBE+' '+
                                            ' '+derechaNucleoME+' '+derechaRemovibleBE+' '+derechaRemovibleME+' '+derechaImplante+' '+ derechaPlaca +
                                            ' ">' +
                                    '<input type="hidden" id="derecha" value="4'+i+'"/>' +
                                '</div>' +
                                '<div id="c4' + i + '" class="centro click ' + centroCariado + ' '+centroObturado+' '+centroExoRealizada+' '+centroExoSimple+' '+centroExoQuirurgica +
                                            ' '+centroSinErupcionar+' '+centroEndoRealizada+' '+centroEndoIndicada+' '+centroSellantePresente+' '+centroSellanteIndicado+' '+centroErosion+
                                            ' '+centroProceRealizado+' '+centroCoronaBE+' '+centroCoronaME+' '+centroProvBE+' '+centroProvME+' '+centroNucleoBE+' '+
                                            ' '+centroNucleoME+' '+centroRemovibleBE+' '+centroRemovibleME+' '+centroImplante+' '+ centroPlaca +
                                            ' ">' +
                                    '<input type="hidden" id="centro" value="4'+i+'"/>' +
                                '</div>' +
                                '</div>';

                        <%if (hcOdontologia != null && hcOdontologia.getG_odontograma() != null) {%>

                            indiceNumero = calcularIndiceNumero("2", a);                                                                                                                                             
                            arribaCariado = odontograma.pla[indiceNumero].ubicaciones[0].tipoMarca[0].valor === "SI" ? "click-red" : "";
                            arribaObturado = odontograma.pla[indiceNumero].ubicaciones[0].tipoMarca[1].valor === "SI" ? "click-blue" : "";
                            arribaExoRealizada = odontograma.pla[indiceNumero].ubicaciones[0].tipoMarca[2].valor === "SI" ? "click-gray" : "";
                            arribaExoSimple = odontograma.pla[indiceNumero].ubicaciones[0].tipoMarca[3].valor === "SI" ? "click-blue-border" : "";
                            arribaExoQuirurgica = odontograma.pla[indiceNumero].ubicaciones[0].tipoMarca[4].valor === "SI" ? "click-red-border" : "";
                            arribaSinErupcionar = odontograma.pla[indiceNumero].ubicaciones[0].tipoMarca[5].valor === "SI" ? "click-erupcionar" : "";
                            arribaEndoRealizada = odontograma.pla[indiceNumero].ubicaciones[0].tipoMarca[6].valor === "SI" ? "click-endo" : "";
                            arribaEndoIndicada = odontograma.pla[indiceNumero].ubicaciones[0].tipoMarca[7].valor === "SI" ? "click-marron-border" : "";
                            arribaSellantePresente = odontograma.pla[indiceNumero].ubicaciones[0].tipoMarca[8].valor === "SI" ? "click-sellantep" : "";
                            arribaSellanteIndicado = odontograma.pla[indiceNumero].ubicaciones[0].tipoMarca[9].valor === "SI" ? "click-sellantei" : "";
                            arribaErosion = odontograma.pla[indiceNumero].ubicaciones[0].tipoMarca[10].valor === "SI" ? "click-erosion" : "";
                            arribaProceRealizado = odontograma.pla[indiceNumero].ubicaciones[0].tipoMarca[11].valor === "SI" ? "click-proce" : "";
                            arribaCoronaBE = odontograma.pla[indiceNumero].ubicaciones[0].tipoMarca[12].valor === "SI" ? "click-corobuen" : "";
                            arribaCoronaME = odontograma.pla[indiceNumero].ubicaciones[0].tipoMarca[13].valor === "SI" ? "click-coromal" : "";
                            arribaProvBE = odontograma.pla[indiceNumero].ubicaciones[0].tipoMarca[14].valor === "SI" ? "click-probuen" : "";
                            arribaProvME = odontograma.pla[indiceNumero].ubicaciones[0].tipoMarca[16].valor === "SI" ? "click-promal" : "";
                            arribaNucleoBE = odontograma.pla[indiceNumero].ubicaciones[0].tipoMarca[16].valor === "SI" ? "click-nuclebuen" : "";
                            arribaNucleoME = odontograma.pla[indiceNumero].ubicaciones[0].tipoMarca[17].valor === "SI" ? "click-nuclemal" : "";
                            arribaRemovibleBE = odontograma.pla[indiceNumero].ubicaciones[0].tipoMarca[18].valor === "SI" ? "click-remobuen" : "";
                            arribaRemovibleME = odontograma.pla[indiceNumero].ubicaciones[0].tipoMarca[19].valor === "SI" ? "click-remomal" : "";
                            arribaImplante = odontograma.pla[indiceNumero].ubicaciones[0].tipoMarca[20].valor === "SI" ? "click-implante" : "";
                            arribaPlaca = odontograma.pla[indiceNumero].ubicaciones[0].tipoMarca[21].valor === "SI" ? "click-green" : "";

                            //abajo
                            abajoCariado = odontograma.pla[indiceNumero].ubicaciones[1].tipoMarca[0].valor === "SI" ? "click-red" : "";                                                                       
                            abajoObturado = odontograma.pla[indiceNumero].ubicaciones[1].tipoMarca[1].valor === "SI" ? "click-blue" : "";
                            abajoExoRealizada = odontograma.pla[indiceNumero].ubicaciones[1].tipoMarca[2].valor === "SI" ? "click-gray" : "";
                            abajoExoSimple = odontograma.pla[indiceNumero].ubicaciones[1].tipoMarca[3].valor === "SI" ? "click-blue-border" : "";
                            abajoExoQuirurgica = odontograma.pla[indiceNumero].ubicaciones[1].tipoMarca[4].valor === "SI" ? "click-red-border" : "";
                            abajoSinErupcionar = odontograma.pla[indiceNumero].ubicaciones[1].tipoMarca[5].valor === "SI" ? "click-erupcionar" : "";
                            abajoEndoRealizada = odontograma.pla[indiceNumero].ubicaciones[1].tipoMarca[6].valor === "SI" ? "click-endo" : "";
                            abajoEndoIndicada = odontograma.pla[indiceNumero].ubicaciones[1].tipoMarca[7].valor === "SI" ? "click-marron-border" : "";
                            abajoSellantePresente = odontograma.pla[indiceNumero].ubicaciones[1].tipoMarca[8].valor === "SI" ? "click-sellantep" : "";
                            abajoSellanteIndicado = odontograma.pla[indiceNumero].ubicaciones[1].tipoMarca[9].valor === "SI" ? "click-sellantei" : "";
                            abajoErosion = odontograma.pla[indiceNumero].ubicaciones[1].tipoMarca[10].valor === "SI" ? "click-erosion" : "";
                            abajoProceRealizado = odontograma.pla[indiceNumero].ubicaciones[1].tipoMarca[11].valor === "SI" ? "click-proce" : "";
                            abajoCoronaBE = odontograma.pla[indiceNumero].ubicaciones[1].tipoMarca[12].valor === "SI" ? "click-corobuen" : "";
                            abajoCoronaME = odontograma.pla[indiceNumero].ubicaciones[1].tipoMarca[13].valor === "SI" ? "click-coromal" : "";
                            abajoProvBE = odontograma.pla[indiceNumero].ubicaciones[1].tipoMarca[14].valor === "SI" ? "click-probuen" : "";
                            abajoProvME = odontograma.pla[indiceNumero].ubicaciones[1].tipoMarca[16].valor === "SI" ? "click-promal" : "";
                            abajoNucleoBE = odontograma.pla[indiceNumero].ubicaciones[1].tipoMarca[16].valor === "SI" ? "click-nuclebuen" : "";
                            abajoNucleoME = odontograma.pla[indiceNumero].ubicaciones[1].tipoMarca[17].valor === "SI" ? "click-nuclemal" : "";
                            abajoRemovibleBE = odontograma.pla[indiceNumero].ubicaciones[1].tipoMarca[18].valor === "SI" ? "click-remobuen" : "";
                            abajoRemovibleME = odontograma.pla[indiceNumero].ubicaciones[1].tipoMarca[19].valor === "SI" ? "click-remomal" : "";
                            abajoImplante = odontograma.pla[indiceNumero].ubicaciones[1].tipoMarca[20].valor === "SI" ? "click-implante" : "";
                            abajoPlaca = odontograma.pla[indiceNumero].ubicaciones[1].tipoMarca[21].valor === "SI" ? "click-green" : "";

                            //izquierda
                            izquierdaCariado = odontograma.pla[indiceNumero].ubicaciones[2].tipoMarca[0].valor === "SI" ? "click-red" : "";                                                                       
                            izquierdaObturado = odontograma.pla[indiceNumero].ubicaciones[2].tipoMarca[1].valor === "SI" ? "click-blue" : "";
                            izquierdaExoRealizada = odontograma.pla[indiceNumero].ubicaciones[2].tipoMarca[2].valor === "SI" ? "click-gray" : "";
                            izquierdaExoSimple = odontograma.pla[indiceNumero].ubicaciones[2].tipoMarca[3].valor === "SI" ? "click-blue-border" : "";
                            izquierdaExoQuirurgica = odontograma.pla[indiceNumero].ubicaciones[2].tipoMarca[4].valor === "SI" ? "click-red-border" : "";
                            izquierdaSinErupcionar = odontograma.pla[indiceNumero].ubicaciones[2].tipoMarca[5].valor === "SI" ? "click-erupcionar" : "";
                            izquierdaEndoRealizada = odontograma.pla[indiceNumero].ubicaciones[2].tipoMarca[6].valor === "SI" ? "click-endo" : "";
                            izquierdaEndoIndicada = odontograma.pla[indiceNumero].ubicaciones[2].tipoMarca[7].valor === "SI" ? "click-marron-border" : "";
                            izquierdaSellantePresente = odontograma.pla[indiceNumero].ubicaciones[2].tipoMarca[8].valor === "SI" ? "click-sellantep" : "";
                            izquierdaSellanteIndicado = odontograma.pla[indiceNumero].ubicaciones[2].tipoMarca[9].valor === "SI" ? "click-sellantei" : "";
                            izquierdaErosion = odontograma.pla[indiceNumero].ubicaciones[2].tipoMarca[10].valor === "SI" ? "click-erosion" : "";
                            izquierdaProceRealizado = odontograma.pla[indiceNumero].ubicaciones[2].tipoMarca[11].valor === "SI" ? "click-proce" : "";
                            izquierdaCoronaBE = odontograma.pla[indiceNumero].ubicaciones[2].tipoMarca[12].valor === "SI" ? "click-corobuen" : "";
                            izquierdaCoronaME = odontograma.pla[indiceNumero].ubicaciones[2].tipoMarca[13].valor === "SI" ? "click-coromal" : "";
                            izquierdaProvBE = odontograma.pla[indiceNumero].ubicaciones[2].tipoMarca[14].valor === "SI" ? "click-probuen" : "";
                            izquierdaProvME = odontograma.pla[indiceNumero].ubicaciones[2].tipoMarca[16].valor === "SI" ? "click-promal" : "";
                            izquierdaNucleoBE = odontograma.pla[indiceNumero].ubicaciones[2].tipoMarca[16].valor === "SI" ? "click-nuclebuen" : "";
                            izquierdaNucleoME = odontograma.pla[indiceNumero].ubicaciones[2].tipoMarca[17].valor === "SI" ? "click-nuclemal" : "";
                            izquierdaRemovibleBE = odontograma.pla[indiceNumero].ubicaciones[2].tipoMarca[18].valor === "SI" ? "click-remobuen" : "";
                            izquierdaRemovibleME = odontograma.pla[indiceNumero].ubicaciones[2].tipoMarca[19].valor === "SI" ? "click-remomal" : "";
                            izquierdaImplante = odontograma.pla[indiceNumero].ubicaciones[2].tipoMarca[20].valor === "SI" ? "click-implante" : "";
                            izquierdaPlaca = odontograma.pla[indiceNumero].ubicaciones[2].tipoMarca[21].valor === "SI" ? "click-green" : "";

                            //derecha
                            derechaCariado = odontograma.pla[indiceNumero].ubicaciones[3].tipoMarca[0].valor === "SI" ? "click-red" : "";                                                                       
                            derechaObturado = odontograma.pla[indiceNumero].ubicaciones[3].tipoMarca[1].valor === "SI" ? "click-blue" : "";
                            derechaExoRealizada = odontograma.pla[indiceNumero].ubicaciones[3].tipoMarca[2].valor === "SI" ? "click-gray" : "";
                            derechaExoSimple = odontograma.pla[indiceNumero].ubicaciones[3].tipoMarca[3].valor === "SI" ? "click-blue-border" : "";
                            derechaExoQuirurgica = odontograma.pla[indiceNumero].ubicaciones[3].tipoMarca[4].valor === "SI" ? "click-red-border" : "";
                            derechaSinErupcionar = odontograma.pla[indiceNumero].ubicaciones[3].tipoMarca[5].valor === "SI" ? "click-erupcionar" : "";
                            derechaEndoRealizada = odontograma.pla[indiceNumero].ubicaciones[3].tipoMarca[6].valor === "SI" ? "click-endo" : "";
                            derechaEndoIndicada = odontograma.pla[indiceNumero].ubicaciones[3].tipoMarca[7].valor === "SI" ? "click-marron-border" : "";
                            derechaSellantePresente = odontograma.pla[indiceNumero].ubicaciones[3].tipoMarca[8].valor === "SI" ? "click-sellantep" : "";
                            derechaSellanteIndicado = odontograma.pla[indiceNumero].ubicaciones[3].tipoMarca[9].valor === "SI" ? "click-sellantei" : "";
                            derechaErosion = odontograma.pla[indiceNumero].ubicaciones[3].tipoMarca[10].valor === "SI" ? "click-erosion" : "";
                            derechaProceRealizado = odontograma.pla[indiceNumero].ubicaciones[3].tipoMarca[11].valor === "SI" ? "click-proce" : "";
                            derechaCoronaBE = odontograma.pla[indiceNumero].ubicaciones[3].tipoMarca[12].valor === "SI" ? "click-corobuen" : "";
                            derechaCoronaME = odontograma.pla[indiceNumero].ubicaciones[3].tipoMarca[13].valor === "SI" ? "click-coromal" : "";
                            derechaProvBE = odontograma.pla[indiceNumero].ubicaciones[3].tipoMarca[14].valor === "SI" ? "click-probuen" : "";
                            derechaProvME = odontograma.pla[indiceNumero].ubicaciones[3].tipoMarca[16].valor === "SI" ? "click-promal" : "";
                            derechaNucleoBE = odontograma.pla[indiceNumero].ubicaciones[3].tipoMarca[16].valor === "SI" ? "click-nuclebuen" : "";
                            derechaNucleoME = odontograma.pla[indiceNumero].ubicaciones[3].tipoMarca[17].valor === "SI" ? "click-nuclemal" : "";
                            derechaRemovibleBE = odontograma.pla[indiceNumero].ubicaciones[3].tipoMarca[18].valor === "SI" ? "click-remobuen" : "";
                            derechaRemovibleME = odontograma.pla[indiceNumero].ubicaciones[3].tipoMarca[19].valor === "SI" ? "click-remomal" : "";
                            derechaImplante = odontograma.pla[indiceNumero].ubicaciones[3].tipoMarca[20].valor === "SI" ? "click-implante" : "";
                            derechaPlaca = odontograma.pla[indiceNumero].ubicaciones[3].tipoMarca[21].valor === "SI" ? "click-green" : "";

                            //centro
                            centroCariado = odontograma.pla[indiceNumero].ubicaciones[4].tipoMarca[0].valor === "SI" ? "click-red" : "";                                                                       
                            centroObturado = odontograma.pla[indiceNumero].ubicaciones[4].tipoMarca[1].valor === "SI" ? "click-blue" : "";
                            centroExoRealizada = odontograma.pla[indiceNumero].ubicaciones[4].tipoMarca[2].valor === "SI" ? "click-gray" : "";
                            centroExoSimple = odontograma.pla[indiceNumero].ubicaciones[4].tipoMarca[3].valor === "SI" ? "click-blue-border" : "";
                            centroExoQuirurgica = odontograma.pla[indiceNumero].ubicaciones[4].tipoMarca[4].valor === "SI" ? "click-red-border" : "";
                            centroSinErupcionar = odontograma.pla[indiceNumero].ubicaciones[4].tipoMarca[5].valor === "SI" ? "click-erupcionar" : "";
                            centroEndoRealizada = odontograma.pla[indiceNumero].ubicaciones[4].tipoMarca[6].valor === "SI" ? "click-endo" : "";
                            centroEndoIndicada = odontograma.pla[indiceNumero].ubicaciones[4].tipoMarca[7].valor === "SI" ? "click-marron-border" : "";
                            centroSellantePresente = odontograma.pla[indiceNumero].ubicaciones[4].tipoMarca[8].valor === "SI" ? "click-sellantep" : "";
                            centroSellanteIndicado = odontograma.pla[indiceNumero].ubicaciones[4].tipoMarca[9].valor === "SI" ? "click-sellantei" : "";
                            centroErosion = odontograma.pla[indiceNumero].ubicaciones[4].tipoMarca[10].valor === "SI" ? "click-erosion" : "";
                            centroProceRealizado = odontograma.pla[indiceNumero].ubicaciones[4].tipoMarca[11].valor === "SI" ? "click-proce" : "";
                            centroCoronaBE = odontograma.pla[indiceNumero].ubicaciones[4].tipoMarca[12].valor === "SI" ? "click-corobuen" : "";
                            centroCoronaME = odontograma.pla[indiceNumero].ubicaciones[4].tipoMarca[13].valor === "SI" ? "click-coromal" : "";
                            centroProvBE = odontograma.pla[indiceNumero].ubicaciones[4].tipoMarca[14].valor === "SI" ? "click-probuen" : "";
                            centroProvME = odontograma.pla[indiceNumero].ubicaciones[4].tipoMarca[16].valor === "SI" ? "click-promal" : "";
                            centroNucleoBE = odontograma.pla[indiceNumero].ubicaciones[4].tipoMarca[16].valor === "SI" ? "click-nuclebuen" : "";
                            centroNucleoME = odontograma.pla[indiceNumero].ubicaciones[4].tipoMarca[17].valor === "SI" ? "click-nuclemal" : "";
                            centroRemovibleBE = odontograma.pla[indiceNumero].ubicaciones[4].tipoMarca[18].valor === "SI" ? "click-remobuen" : "";
                            centroRemovibleME = odontograma.pla[indiceNumero].ubicaciones[4].tipoMarca[19].valor === "SI" ? "click-remomal" : "";
                            centroImplante = odontograma.pla[indiceNumero].ubicaciones[4].tipoMarca[20].valor === "SI" ? "click-implante" : "";
                            centroPlaca = odontograma.pla[indiceNumero].ubicaciones[4].tipoMarca[21].valor === "SI" ? "click-green" : "";
                        <%}%>
                        //Dientes Definitivos Cuandrante Izquierdo (Superior)
                        htmlLeft += '<div id="diente2' + a + '" class="diente">' +
                                '<span style="margin-left: -19px; margin-bottom:5px; display: inline-block !important; border-radius: 10px !important;" class="label label-info">2' + a + '</span>' +
                                '<div id="t2' + a + '" class="cuadro click ' +arribaCariado+ ' '+arribaObturado+' '+arribaExoRealizada+' '+arribaExoSimple+' '+arribaExoQuirurgica +
                                            ' '+arribaSinErupcionar+' '+arribaEndoRealizada+' '+arribaEndoIndicada+' '+arribaSellantePresente+' '+arribaSellanteIndicado+' '+arribaErosion+
                                            ' '+arribaProceRealizado+' '+arribaCoronaBE+' '+arribaCoronaME+' '+arribaProvBE+' '+arribaProvME+' '+arribaNucleoBE+' '+
                                            ' '+arribaNucleoME+' '+arribaRemovibleBE+' '+arribaRemovibleME+' '+arribaImplante+' '+ arribaPlaca +
                                            ' ">' +
                                    '<input type="hidden" id="arriba" value="2'+a+'"/>' +
                                '</div>' +
                                '<div id="l2' + a + '" class="cuadro izquierdo click ' + izquierdaCariado + ' '+izquierdaObturado+' '+izquierdaExoRealizada+' '+izquierdaExoSimple+' '+izquierdaExoQuirurgica +
                                            ' '+izquierdaSinErupcionar+' '+izquierdaEndoRealizada+' '+izquierdaEndoIndicada+' '+izquierdaSellantePresente+' '+izquierdaSellanteIndicado+' '+izquierdaErosion+
                                            ' '+izquierdaProceRealizado+' '+izquierdaCoronaBE+' '+izquierdaCoronaME+' '+izquierdaProvBE+' '+izquierdaProvME+' '+izquierdaNucleoBE+' '+
                                            ' '+izquierdaNucleoME+' '+izquierdaRemovibleBE+' '+izquierdaRemovibleME+' '+izquierdaImplante+' '+ izquierdaPlaca +
                                            ' ">' +
                                    '<input type="hidden" id="izquierda" value="2'+a+'"/>' +
                                '</div>' +
                                '<div id="b2' + a + '" class="cuadro debajo click ' + abajoCariado + ' '+abajoObturado+' '+abajoExoRealizada+' '+abajoExoSimple+' '+abajoExoQuirurgica +
                                            ' '+abajoSinErupcionar+' '+abajoEndoRealizada+' '+abajoEndoIndicada+' '+abajoSellantePresente+' '+abajoSellanteIndicado+' '+abajoErosion+
                                            ' '+abajoProceRealizado+' '+abajoCoronaBE+' '+abajoCoronaME+' '+abajoProvBE+' '+izquierdaProvME+' '+abajoNucleoBE+' '+
                                            ' '+abajoNucleoME+' '+abajoRemovibleBE+' '+abajoRemovibleME+' '+abajoImplante+' '+ abajoPlaca +
                                            ' ">' +
                                    '<input type="hidden" id="abajo" value="2'+a+'"/>' +
                                '</div>' +
                                '<div id="r2' + a + '" class="cuadro derecha click click ' + derechaCariado + ' '+derechaObturado+' '+derechaExoRealizada+' '+derechaExoSimple+' '+derechaExoQuirurgica +
                                            ' '+derechaSinErupcionar+' '+derechaEndoRealizada+' '+derechaEndoIndicada+' '+derechaSellantePresente+' '+derechaSellanteIndicado+' '+derechaErosion+
                                            ' '+derechaProceRealizado+' '+derechaCoronaBE+' '+derechaCoronaME+' '+derechaProvBE+' '+derechaProvME+' '+derechaNucleoBE+' '+
                                            ' '+derechaNucleoME+' '+derechaRemovibleBE+' '+derechaRemovibleME+' '+derechaImplante+' '+ derechaPlaca +
                                            ' ">' +
                                    '<input type="hidden" id="derecha" value="2'+a+'"/>' +
                                '</div>' +
                                '<div id="c2' + a + '" class="centro click ' + centroCariado + ' '+centroObturado+' '+centroExoRealizada+' '+centroExoSimple+' '+centroExoQuirurgica +
                                            ' '+centroSinErupcionar+' '+centroEndoRealizada+' '+centroEndoIndicada+' '+centroSellantePresente+' '+centroSellanteIndicado+' '+centroErosion+
                                            ' '+centroProceRealizado+' '+centroCoronaBE+' '+centroCoronaME+' '+centroProvBE+' '+centroProvME+' '+centroNucleoBE+' '+
                                            ' '+centroNucleoME+' '+centroRemovibleBE+' '+centroRemovibleME+' '+centroImplante+' '+ centroPlaca +
                                            ' ">' +
                                    '<input type="hidden" id="centro" value="2'+a+'"/>' +
                                '</div>' +
                                '</div>';

                        <%if (hcOdontologia != null && hcOdontologia.getG_odontograma() != null) {%>

                            indiceNumero = calcularIndiceNumero("3", a);                                                                                                                                                
                            arribaCariado = odontograma.pla[indiceNumero].ubicaciones[0].tipoMarca[0].valor === "SI" ? "click-red" : "";
                            arribaObturado = odontograma.pla[indiceNumero].ubicaciones[0].tipoMarca[1].valor === "SI" ? "click-blue" : "";
                            arribaExoRealizada = odontograma.pla[indiceNumero].ubicaciones[0].tipoMarca[2].valor === "SI" ? "click-gray" : "";
                            arribaExoSimple = odontograma.pla[indiceNumero].ubicaciones[0].tipoMarca[3].valor === "SI" ? "click-blue-border" : "";
                            arribaExoQuirurgica = odontograma.pla[indiceNumero].ubicaciones[0].tipoMarca[4].valor === "SI" ? "click-red-border" : "";
                            arribaSinErupcionar = odontograma.pla[indiceNumero].ubicaciones[0].tipoMarca[5].valor === "SI" ? "click-erupcionar" : "";
                            arribaEndoRealizada = odontograma.pla[indiceNumero].ubicaciones[0].tipoMarca[6].valor === "SI" ? "click-endo" : "";
                            arribaEndoIndicada = odontograma.pla[indiceNumero].ubicaciones[0].tipoMarca[7].valor === "SI" ? "click-marron-border" : "";
                            arribaSellantePresente = odontograma.pla[indiceNumero].ubicaciones[0].tipoMarca[8].valor === "SI" ? "click-sellantep" : "";
                            arribaSellanteIndicado = odontograma.pla[indiceNumero].ubicaciones[0].tipoMarca[9].valor === "SI" ? "click-sellantei" : "";
                            arribaErosion = odontograma.pla[indiceNumero].ubicaciones[0].tipoMarca[10].valor === "SI" ? "click-erosion" : "";
                            arribaProceRealizado = odontograma.pla[indiceNumero].ubicaciones[0].tipoMarca[11].valor === "SI" ? "click-proce" : "";
                            arribaCoronaBE = odontograma.pla[indiceNumero].ubicaciones[0].tipoMarca[12].valor === "SI" ? "click-corobuen" : "";
                            arribaCoronaME = odontograma.pla[indiceNumero].ubicaciones[0].tipoMarca[13].valor === "SI" ? "click-coromal" : "";
                            arribaProvBE = odontograma.pla[indiceNumero].ubicaciones[0].tipoMarca[14].valor === "SI" ? "click-probuen" : "";
                            arribaProvME = odontograma.pla[indiceNumero].ubicaciones[0].tipoMarca[16].valor === "SI" ? "click-promal" : "";
                            arribaNucleoBE = odontograma.pla[indiceNumero].ubicaciones[0].tipoMarca[16].valor === "SI" ? "click-nuclebuen" : "";
                            arribaNucleoME = odontograma.pla[indiceNumero].ubicaciones[0].tipoMarca[17].valor === "SI" ? "click-nuclemal" : "";
                            arribaRemovibleBE = odontograma.pla[indiceNumero].ubicaciones[0].tipoMarca[18].valor === "SI" ? "click-remobuen" : "";
                            arribaRemovibleME = odontograma.pla[indiceNumero].ubicaciones[0].tipoMarca[19].valor === "SI" ? "click-remomal" : "";
                            arribaImplante = odontograma.pla[indiceNumero].ubicaciones[0].tipoMarca[20].valor === "SI" ? "click-implante" : "";
                            arribaPlaca = odontograma.pla[indiceNumero].ubicaciones[0].tipoMarca[21].valor === "SI" ? "click-green" : "";

                            //abajo
                            abajoCariado = odontograma.pla[indiceNumero].ubicaciones[1].tipoMarca[0].valor === "SI" ? "click-red" : "";                                                                       
                            abajoObturado = odontograma.pla[indiceNumero].ubicaciones[1].tipoMarca[1].valor === "SI" ? "click-blue" : "";
                            abajoExoRealizada = odontograma.pla[indiceNumero].ubicaciones[1].tipoMarca[2].valor === "SI" ? "click-gray" : "";
                            abajoExoSimple = odontograma.pla[indiceNumero].ubicaciones[1].tipoMarca[3].valor === "SI" ? "click-blue-border" : "";
                            abajoExoQuirurgica = odontograma.pla[indiceNumero].ubicaciones[1].tipoMarca[4].valor === "SI" ? "click-red-border" : "";
                            abajoSinErupcionar = odontograma.pla[indiceNumero].ubicaciones[1].tipoMarca[5].valor === "SI" ? "click-erupcionar" : "";
                            abajoEndoRealizada = odontograma.pla[indiceNumero].ubicaciones[1].tipoMarca[6].valor === "SI" ? "click-endo" : "";
                            abajoEndoIndicada = odontograma.pla[indiceNumero].ubicaciones[1].tipoMarca[7].valor === "SI" ? "click-marron-border" : "";
                            abajoSellantePresente = odontograma.pla[indiceNumero].ubicaciones[1].tipoMarca[8].valor === "SI" ? "click-sellantep" : "";
                            abajoSellanteIndicado = odontograma.pla[indiceNumero].ubicaciones[1].tipoMarca[9].valor === "SI" ? "click-sellantei" : "";
                            abajoErosion = odontograma.pla[indiceNumero].ubicaciones[1].tipoMarca[10].valor === "SI" ? "click-erosion" : "";
                            abajoProceRealizado = odontograma.pla[indiceNumero].ubicaciones[1].tipoMarca[11].valor === "SI" ? "click-proce" : "";
                            abajoCoronaBE = odontograma.pla[indiceNumero].ubicaciones[1].tipoMarca[12].valor === "SI" ? "click-corobuen" : "";
                            abajoCoronaME = odontograma.pla[indiceNumero].ubicaciones[1].tipoMarca[13].valor === "SI" ? "click-coromal" : "";
                            abajoProvBE = odontograma.pla[indiceNumero].ubicaciones[1].tipoMarca[14].valor === "SI" ? "click-probuen" : "";
                            abajoProvME = odontograma.pla[indiceNumero].ubicaciones[1].tipoMarca[16].valor === "SI" ? "click-promal" : "";
                            abajoNucleoBE = odontograma.pla[indiceNumero].ubicaciones[1].tipoMarca[16].valor === "SI" ? "click-nuclebuen" : "";
                            abajoNucleoME = odontograma.pla[indiceNumero].ubicaciones[1].tipoMarca[17].valor === "SI" ? "click-nuclemal" : "";
                            abajoRemovibleBE = odontograma.pla[indiceNumero].ubicaciones[1].tipoMarca[18].valor === "SI" ? "click-remobuen" : "";
                            abajoRemovibleME = odontograma.pla[indiceNumero].ubicaciones[1].tipoMarca[19].valor === "SI" ? "click-remomal" : "";
                            abajoImplante = odontograma.pla[indiceNumero].ubicaciones[1].tipoMarca[20].valor === "SI" ? "click-implante" : "";
                            abajoPlaca = odontograma.pla[indiceNumero].ubicaciones[1].tipoMarca[21].valor === "SI" ? "click-green" : "";

                            //izquierda
                            izquierdaCariado = odontograma.pla[indiceNumero].ubicaciones[2].tipoMarca[0].valor === "SI" ? "click-red" : "";                                                                       
                            izquierdaObturado = odontograma.pla[indiceNumero].ubicaciones[2].tipoMarca[1].valor === "SI" ? "click-blue" : "";
                            izquierdaExoRealizada = odontograma.pla[indiceNumero].ubicaciones[2].tipoMarca[2].valor === "SI" ? "click-gray" : "";
                            izquierdaExoSimple = odontograma.pla[indiceNumero].ubicaciones[2].tipoMarca[3].valor === "SI" ? "click-blue-border" : "";
                            izquierdaExoQuirurgica = odontograma.pla[indiceNumero].ubicaciones[2].tipoMarca[4].valor === "SI" ? "click-red-border" : "";
                            izquierdaSinErupcionar = odontograma.pla[indiceNumero].ubicaciones[2].tipoMarca[5].valor === "SI" ? "click-erupcionar" : "";
                            izquierdaEndoRealizada = odontograma.pla[indiceNumero].ubicaciones[2].tipoMarca[6].valor === "SI" ? "click-endo" : "";
                            izquierdaEndoIndicada = odontograma.pla[indiceNumero].ubicaciones[2].tipoMarca[7].valor === "SI" ? "click-marron-border" : "";
                            izquierdaSellantePresente = odontograma.pla[indiceNumero].ubicaciones[2].tipoMarca[8].valor === "SI" ? "click-sellantep" : "";
                            izquierdaSellanteIndicado = odontograma.pla[indiceNumero].ubicaciones[2].tipoMarca[9].valor === "SI" ? "click-sellantei" : "";
                            izquierdaErosion = odontograma.pla[indiceNumero].ubicaciones[2].tipoMarca[10].valor === "SI" ? "click-erosion" : "";
                            izquierdaProceRealizado = odontograma.pla[indiceNumero].ubicaciones[2].tipoMarca[11].valor === "SI" ? "click-proce" : "";
                            izquierdaCoronaBE = odontograma.pla[indiceNumero].ubicaciones[2].tipoMarca[12].valor === "SI" ? "click-corobuen" : "";
                            izquierdaCoronaME = odontograma.pla[indiceNumero].ubicaciones[2].tipoMarca[13].valor === "SI" ? "click-coromal" : "";
                            izquierdaProvBE = odontograma.pla[indiceNumero].ubicaciones[2].tipoMarca[14].valor === "SI" ? "click-probuen" : "";
                            izquierdaProvME = odontograma.pla[indiceNumero].ubicaciones[2].tipoMarca[16].valor === "SI" ? "click-promal" : "";
                            izquierdaNucleoBE = odontograma.pla[indiceNumero].ubicaciones[2].tipoMarca[16].valor === "SI" ? "click-nuclebuen" : "";
                            izquierdaNucleoME = odontograma.pla[indiceNumero].ubicaciones[2].tipoMarca[17].valor === "SI" ? "click-nuclemal" : "";
                            izquierdaRemovibleBE = odontograma.pla[indiceNumero].ubicaciones[2].tipoMarca[18].valor === "SI" ? "click-remobuen" : "";
                            izquierdaRemovibleME = odontograma.pla[indiceNumero].ubicaciones[2].tipoMarca[19].valor === "SI" ? "click-remomal" : "";
                            izquierdaImplante = odontograma.pla[indiceNumero].ubicaciones[2].tipoMarca[20].valor === "SI" ? "click-implante" : "";
                            izquierdaPlaca = odontograma.pla[indiceNumero].ubicaciones[2].tipoMarca[21].valor === "SI" ? "click-green" : "";

                            //derecha
                            derechaCariado = odontograma.pla[indiceNumero].ubicaciones[3].tipoMarca[0].valor === "SI" ? "click-red" : "";                                                                       
                            derechaObturado = odontograma.pla[indiceNumero].ubicaciones[3].tipoMarca[1].valor === "SI" ? "click-blue" : "";
                            derechaExoRealizada = odontograma.pla[indiceNumero].ubicaciones[3].tipoMarca[2].valor === "SI" ? "click-gray" : "";
                            derechaExoSimple = odontograma.pla[indiceNumero].ubicaciones[3].tipoMarca[3].valor === "SI" ? "click-blue-border" : "";
                            derechaExoQuirurgica = odontograma.pla[indiceNumero].ubicaciones[3].tipoMarca[4].valor === "SI" ? "click-red-border" : "";
                            derechaSinErupcionar = odontograma.pla[indiceNumero].ubicaciones[3].tipoMarca[5].valor === "SI" ? "click-erupcionar" : "";
                            derechaEndoRealizada = odontograma.pla[indiceNumero].ubicaciones[3].tipoMarca[6].valor === "SI" ? "click-endo" : "";
                            derechaEndoIndicada = odontograma.pla[indiceNumero].ubicaciones[3].tipoMarca[7].valor === "SI" ? "click-marron-border" : "";
                            derechaSellantePresente = odontograma.pla[indiceNumero].ubicaciones[3].tipoMarca[8].valor === "SI" ? "click-sellantep" : "";
                            derechaSellanteIndicado = odontograma.pla[indiceNumero].ubicaciones[3].tipoMarca[9].valor === "SI" ? "click-sellantei" : "";
                            derechaErosion = odontograma.pla[indiceNumero].ubicaciones[3].tipoMarca[10].valor === "SI" ? "click-erosion" : "";
                            derechaProceRealizado = odontograma.pla[indiceNumero].ubicaciones[3].tipoMarca[11].valor === "SI" ? "click-proce" : "";
                            derechaCoronaBE = odontograma.pla[indiceNumero].ubicaciones[3].tipoMarca[12].valor === "SI" ? "click-corobuen" : "";
                            derechaCoronaME = odontograma.pla[indiceNumero].ubicaciones[3].tipoMarca[13].valor === "SI" ? "click-coromal" : "";
                            derechaProvBE = odontograma.pla[indiceNumero].ubicaciones[3].tipoMarca[14].valor === "SI" ? "click-probuen" : "";
                            derechaProvME = odontograma.pla[indiceNumero].ubicaciones[3].tipoMarca[16].valor === "SI" ? "click-promal" : "";
                            derechaNucleoBE = odontograma.pla[indiceNumero].ubicaciones[3].tipoMarca[16].valor === "SI" ? "click-nuclebuen" : "";
                            derechaNucleoME = odontograma.pla[indiceNumero].ubicaciones[3].tipoMarca[17].valor === "SI" ? "click-nuclemal" : "";
                            derechaRemovibleBE = odontograma.pla[indiceNumero].ubicaciones[3].tipoMarca[18].valor === "SI" ? "click-remobuen" : "";
                            derechaRemovibleME = odontograma.pla[indiceNumero].ubicaciones[3].tipoMarca[19].valor === "SI" ? "click-remomal" : "";
                            derechaImplante = odontograma.pla[indiceNumero].ubicaciones[3].tipoMarca[20].valor === "SI" ? "click-implante" : "";
                            derechaPlaca = odontograma.pla[indiceNumero].ubicaciones[3].tipoMarca[21].valor === "SI" ? "click-green" : "";

                            //centro
                            centroCariado = odontograma.pla[indiceNumero].ubicaciones[4].tipoMarca[0].valor === "SI" ? "click-red" : "";                                                                       
                            centroObturado = odontograma.pla[indiceNumero].ubicaciones[4].tipoMarca[1].valor === "SI" ? "click-blue" : "";
                            centroExoRealizada = odontograma.pla[indiceNumero].ubicaciones[4].tipoMarca[2].valor === "SI" ? "click-gray" : "";
                            centroExoSimple = odontograma.pla[indiceNumero].ubicaciones[4].tipoMarca[3].valor === "SI" ? "click-blue-border" : "";
                            centroExoQuirurgica = odontograma.pla[indiceNumero].ubicaciones[4].tipoMarca[4].valor === "SI" ? "click-red-border" : "";
                            centroSinErupcionar = odontograma.pla[indiceNumero].ubicaciones[4].tipoMarca[5].valor === "SI" ? "click-erupcionar" : "";
                            centroEndoRealizada = odontograma.pla[indiceNumero].ubicaciones[4].tipoMarca[6].valor === "SI" ? "click-endo" : "";
                            centroEndoIndicada = odontograma.pla[indiceNumero].ubicaciones[4].tipoMarca[7].valor === "SI" ? "click-marron-border" : "";
                            centroSellantePresente = odontograma.pla[indiceNumero].ubicaciones[4].tipoMarca[8].valor === "SI" ? "click-sellantep" : "";
                            centroSellanteIndicado = odontograma.pla[indiceNumero].ubicaciones[4].tipoMarca[9].valor === "SI" ? "click-sellantei" : "";
                            centroErosion = odontograma.pla[indiceNumero].ubicaciones[4].tipoMarca[10].valor === "SI" ? "click-erosion" : "";
                            centroProceRealizado = odontograma.pla[indiceNumero].ubicaciones[4].tipoMarca[11].valor === "SI" ? "click-proce" : "";
                            centroCoronaBE = odontograma.pla[indiceNumero].ubicaciones[4].tipoMarca[12].valor === "SI" ? "click-corobuen" : "";
                            centroCoronaME = odontograma.pla[indiceNumero].ubicaciones[4].tipoMarca[13].valor === "SI" ? "click-coromal" : "";
                            centroProvBE = odontograma.pla[indiceNumero].ubicaciones[4].tipoMarca[14].valor === "SI" ? "click-probuen" : "";
                            centroProvME = odontograma.pla[indiceNumero].ubicaciones[4].tipoMarca[16].valor === "SI" ? "click-promal" : "";
                            centroNucleoBE = odontograma.pla[indiceNumero].ubicaciones[4].tipoMarca[16].valor === "SI" ? "click-nuclebuen" : "";
                            centroNucleoME = odontograma.pla[indiceNumero].ubicaciones[4].tipoMarca[17].valor === "SI" ? "click-nuclemal" : "";
                            centroRemovibleBE = odontograma.pla[indiceNumero].ubicaciones[4].tipoMarca[18].valor === "SI" ? "click-remobuen" : "";
                            centroRemovibleME = odontograma.pla[indiceNumero].ubicaciones[4].tipoMarca[19].valor === "SI" ? "click-remomal" : "";
                            centroImplante = odontograma.pla[indiceNumero].ubicaciones[4].tipoMarca[20].valor === "SI" ? "click-implante" : "";
                            centroPlaca = odontograma.pla[indiceNumero].ubicaciones[4].tipoMarca[21].valor === "SI" ? "click-green" : "";
                        <%}%>
                        //Dientes Definitivos Cuandrante Izquierdo (Superior)
                        htmlLeft2 += '<div id="diente3' + a + '" class="diente">' +
                                '<span style="margin-left: -19px; margin-bottom:5px; display: inline-block !important; border-radius: 10px !important;" class="label label-info">3' + a + '</span>' +
                                '<div id="t3' + a + '" class="cuadro click ' +arribaCariado+ ' '+arribaObturado+' '+arribaExoRealizada+' '+arribaExoSimple+' '+arribaExoQuirurgica +
                                            ' '+arribaSinErupcionar+' '+arribaEndoRealizada+' '+arribaEndoIndicada+' '+arribaSellantePresente+' '+arribaSellanteIndicado+' '+arribaErosion+
                                            ' '+arribaProceRealizado+' '+arribaCoronaBE+' '+arribaCoronaME+' '+arribaProvBE+' '+arribaProvME+' '+arribaNucleoBE+' '+
                                            ' '+arribaNucleoME+' '+arribaRemovibleBE+' '+arribaRemovibleME+' '+arribaImplante+' '+ arribaPlaca +
                                            ' ">' +
                                    '<input type="hidden" id="arriba" value="3'+a+'"/>' +
                                '</div>' +
                                '<div id="l3' + a + '" class="cuadro izquierdo click ' + izquierdaCariado + ' '+izquierdaObturado+' '+izquierdaExoRealizada+' '+izquierdaExoSimple+' '+izquierdaExoQuirurgica +
                                            ' '+izquierdaSinErupcionar+' '+izquierdaEndoRealizada+' '+izquierdaEndoIndicada+' '+izquierdaSellantePresente+' '+izquierdaSellanteIndicado+' '+izquierdaErosion+
                                            ' '+izquierdaProceRealizado+' '+izquierdaCoronaBE+' '+izquierdaCoronaME+' '+izquierdaProvBE+' '+izquierdaProvME+' '+izquierdaNucleoBE+' '+
                                            ' '+izquierdaNucleoME+' '+izquierdaRemovibleBE+' '+izquierdaRemovibleME+' '+izquierdaImplante+' '+ izquierdaPlaca +
                                            ' ">' +
                                    '<input type="hidden" id="izquierda" value="3'+a+'"/>' +
                                '</div>' +
                                '<div id="b3' + a + '" class="cuadro debajo click ' + abajoCariado + ' '+abajoObturado+' '+abajoExoRealizada+' '+abajoExoSimple+' '+abajoExoQuirurgica +
                                            ' '+abajoSinErupcionar+' '+abajoEndoRealizada+' '+abajoEndoIndicada+' '+abajoSellantePresente+' '+abajoSellanteIndicado+' '+abajoErosion+
                                            ' '+abajoProceRealizado+' '+abajoCoronaBE+' '+abajoCoronaME+' '+abajoProvBE+' '+izquierdaProvME+' '+abajoNucleoBE+' '+
                                            ' '+abajoNucleoME+' '+abajoRemovibleBE+' '+abajoRemovibleME+' '+abajoImplante+' '+ abajoPlaca +
                                            ' ">' +
                                    '<input type="hidden" id="abajo" value="3'+a+'"/>' +
                                '</div>' +
                                '<div id="r3' + a + '" class="cuadro derecha click click ' + derechaCariado + ' '+derechaObturado+' '+derechaExoRealizada+' '+derechaExoSimple+' '+derechaExoQuirurgica +
                                            ' '+derechaSinErupcionar+' '+derechaEndoRealizada+' '+derechaEndoIndicada+' '+derechaSellantePresente+' '+derechaSellanteIndicado+' '+derechaErosion+
                                            ' '+derechaProceRealizado+' '+derechaCoronaBE+' '+derechaCoronaME+' '+derechaProvBE+' '+derechaProvME+' '+derechaNucleoBE+' '+
                                            ' '+derechaNucleoME+' '+derechaRemovibleBE+' '+derechaRemovibleME+' '+derechaImplante+' '+ derechaPlaca +
                                            ' ">' +
                                    '<input type="hidden" id="derecha" value="3'+a+'"/>' +
                                '</div>' +
                                '<div id="c3' + a + '" class="centro click ' + centroCariado + ' '+centroObturado+' '+centroExoRealizada+' '+centroExoSimple+' '+centroExoQuirurgica +
                                            ' '+centroSinErupcionar+' '+centroEndoRealizada+' '+centroEndoIndicada+' '+centroSellantePresente+' '+centroSellanteIndicado+' '+centroErosion+
                                            ' '+centroProceRealizado+' '+centroCoronaBE+' '+centroCoronaME+' '+centroProvBE+' '+centroProvME+' '+centroNucleoBE+' '+
                                            ' '+centroNucleoME+' '+centroRemovibleBE+' '+centroRemovibleME+' '+centroImplante+' '+ centroPlaca +
                                            ' ">' +
                                    '<input type="hidden" id="centro" value="3'+a+'"/>' +
                                '</div>' +
                                '</div>';

                        if (i <= 5) {

                            <%if (hcOdontologia != null && hcOdontologia.getG_odontograma() != null) {%>

                                indiceNumero = calcularIndiceNumero("5", i);
                                arribaCariado = odontograma.pla[indiceNumero].ubicaciones[0].tipoMarca[0].valor === "SI" ? "click-red" : "";
                                arribaObturado = odontograma.pla[indiceNumero].ubicaciones[0].tipoMarca[1].valor === "SI" ? "click-blue" : "";
                                arribaExoRealizada = odontograma.pla[indiceNumero].ubicaciones[0].tipoMarca[2].valor === "SI" ? "click-gray" : "";
                                arribaExoSimple = odontograma.pla[indiceNumero].ubicaciones[0].tipoMarca[3].valor === "SI" ? "click-blue-border" : "";
                                arribaExoQuirurgica = odontograma.pla[indiceNumero].ubicaciones[0].tipoMarca[4].valor === "SI" ? "click-red-border" : "";
                                arribaSinErupcionar = odontograma.pla[indiceNumero].ubicaciones[0].tipoMarca[5].valor === "SI" ? "click-erupcionar" : "";
                                arribaEndoRealizada = odontograma.pla[indiceNumero].ubicaciones[0].tipoMarca[6].valor === "SI" ? "click-endo" : "";
                                arribaEndoIndicada = odontograma.pla[indiceNumero].ubicaciones[0].tipoMarca[7].valor === "SI" ? "click-marron-border" : "";
                                arribaSellantePresente = odontograma.pla[indiceNumero].ubicaciones[0].tipoMarca[8].valor === "SI" ? "click-sellantep" : "";
                                arribaSellanteIndicado = odontograma.pla[indiceNumero].ubicaciones[0].tipoMarca[9].valor === "SI" ? "click-sellantei" : "";
                                arribaErosion = odontograma.pla[indiceNumero].ubicaciones[0].tipoMarca[10].valor === "SI" ? "click-erosion" : "";
                                arribaProceRealizado = odontograma.pla[indiceNumero].ubicaciones[0].tipoMarca[11].valor === "SI" ? "click-proce" : "";
                                arribaCoronaBE = odontograma.pla[indiceNumero].ubicaciones[0].tipoMarca[12].valor === "SI" ? "click-corobuen" : "";
                                arribaCoronaME = odontograma.pla[indiceNumero].ubicaciones[0].tipoMarca[13].valor === "SI" ? "click-coromal" : "";
                                arribaProvBE = odontograma.pla[indiceNumero].ubicaciones[0].tipoMarca[14].valor === "SI" ? "click-probuen" : "";
                                arribaProvME = odontograma.pla[indiceNumero].ubicaciones[0].tipoMarca[16].valor === "SI" ? "click-promal" : "";
                                arribaNucleoBE = odontograma.pla[indiceNumero].ubicaciones[0].tipoMarca[16].valor === "SI" ? "click-nuclebuen" : "";
                                arribaNucleoME = odontograma.pla[indiceNumero].ubicaciones[0].tipoMarca[17].valor === "SI" ? "click-nuclemal" : "";
                                arribaRemovibleBE = odontograma.pla[indiceNumero].ubicaciones[0].tipoMarca[18].valor === "SI" ? "click-remobuen" : "";
                                arribaRemovibleME = odontograma.pla[indiceNumero].ubicaciones[0].tipoMarca[19].valor === "SI" ? "click-remomal" : "";
                                arribaImplante = odontograma.pla[indiceNumero].ubicaciones[0].tipoMarca[20].valor === "SI" ? "click-implante" : "";
                                arribaPlaca = odontograma.pla[indiceNumero].ubicaciones[0].tipoMarca[21].valor === "SI" ? "click-green" : "";

                                //abajo
                                abajoCariado = odontograma.pla[indiceNumero].ubicaciones[1].tipoMarca[0].valor === "SI" ? "click-red" : "";                                                                       
                                abajoObturado = odontograma.pla[indiceNumero].ubicaciones[1].tipoMarca[1].valor === "SI" ? "click-blue" : "";
                                abajoExoRealizada = odontograma.pla[indiceNumero].ubicaciones[1].tipoMarca[2].valor === "SI" ? "click-gray" : "";
                                abajoExoSimple = odontograma.pla[indiceNumero].ubicaciones[1].tipoMarca[3].valor === "SI" ? "click-blue-border" : "";
                                abajoExoQuirurgica = odontograma.pla[indiceNumero].ubicaciones[1].tipoMarca[4].valor === "SI" ? "click-red-border" : "";
                                abajoSinErupcionar = odontograma.pla[indiceNumero].ubicaciones[1].tipoMarca[5].valor === "SI" ? "click-erupcionar" : "";
                                abajoEndoRealizada = odontograma.pla[indiceNumero].ubicaciones[1].tipoMarca[6].valor === "SI" ? "click-endo" : "";
                                abajoEndoIndicada = odontograma.pla[indiceNumero].ubicaciones[1].tipoMarca[7].valor === "SI" ? "click-marron-border" : "";
                                abajoSellantePresente = odontograma.pla[indiceNumero].ubicaciones[1].tipoMarca[8].valor === "SI" ? "click-sellantep" : "";
                                abajoSellanteIndicado = odontograma.pla[indiceNumero].ubicaciones[1].tipoMarca[9].valor === "SI" ? "click-sellantei" : "";
                                abajoErosion = odontograma.pla[indiceNumero].ubicaciones[1].tipoMarca[10].valor === "SI" ? "click-erosion" : "";
                                abajoProceRealizado = odontograma.pla[indiceNumero].ubicaciones[1].tipoMarca[11].valor === "SI" ? "click-proce" : "";
                                abajoCoronaBE = odontograma.pla[indiceNumero].ubicaciones[1].tipoMarca[12].valor === "SI" ? "click-corobuen" : "";
                                abajoCoronaME = odontograma.pla[indiceNumero].ubicaciones[1].tipoMarca[13].valor === "SI" ? "click-coromal" : "";
                                abajoProvBE = odontograma.pla[indiceNumero].ubicaciones[1].tipoMarca[14].valor === "SI" ? "click-probuen" : "";
                                abajoProvME = odontograma.pla[indiceNumero].ubicaciones[1].tipoMarca[16].valor === "SI" ? "click-promal" : "";
                                abajoNucleoBE = odontograma.pla[indiceNumero].ubicaciones[1].tipoMarca[16].valor === "SI" ? "click-nuclebuen" : "";
                                abajoNucleoME = odontograma.pla[indiceNumero].ubicaciones[1].tipoMarca[17].valor === "SI" ? "click-nuclemal" : "";
                                abajoRemovibleBE = odontograma.pla[indiceNumero].ubicaciones[1].tipoMarca[18].valor === "SI" ? "click-remobuen" : "";
                                abajoRemovibleME = odontograma.pla[indiceNumero].ubicaciones[1].tipoMarca[19].valor === "SI" ? "click-remomal" : "";
                                abajoImplante = odontograma.pla[indiceNumero].ubicaciones[1].tipoMarca[20].valor === "SI" ? "click-implante" : "";
                                abajoPlaca = odontograma.pla[indiceNumero].ubicaciones[1].tipoMarca[21].valor === "SI" ? "click-green" : "";

                                //izquierda
                                izquierdaCariado = odontograma.pla[indiceNumero].ubicaciones[2].tipoMarca[0].valor === "SI" ? "click-red" : "";                                                                       
                                izquierdaObturado = odontograma.pla[indiceNumero].ubicaciones[2].tipoMarca[1].valor === "SI" ? "click-blue" : "";
                                izquierdaExoRealizada = odontograma.pla[indiceNumero].ubicaciones[2].tipoMarca[2].valor === "SI" ? "click-gray" : "";
                                izquierdaExoSimple = odontograma.pla[indiceNumero].ubicaciones[2].tipoMarca[3].valor === "SI" ? "click-blue-border" : "";
                                izquierdaExoQuirurgica = odontograma.pla[indiceNumero].ubicaciones[2].tipoMarca[4].valor === "SI" ? "click-red-border" : "";
                                izquierdaSinErupcionar = odontograma.pla[indiceNumero].ubicaciones[2].tipoMarca[5].valor === "SI" ? "click-erupcionar" : "";
                                izquierdaEndoRealizada = odontograma.pla[indiceNumero].ubicaciones[2].tipoMarca[6].valor === "SI" ? "click-endo" : "";
                                izquierdaEndoIndicada = odontograma.pla[indiceNumero].ubicaciones[2].tipoMarca[7].valor === "SI" ? "click-marron-border" : "";
                                izquierdaSellantePresente = odontograma.pla[indiceNumero].ubicaciones[2].tipoMarca[8].valor === "SI" ? "click-sellantep" : "";
                                izquierdaSellanteIndicado = odontograma.pla[indiceNumero].ubicaciones[2].tipoMarca[9].valor === "SI" ? "click-sellantei" : "";
                                izquierdaErosion = odontograma.pla[indiceNumero].ubicaciones[2].tipoMarca[10].valor === "SI" ? "click-erosion" : "";
                                izquierdaProceRealizado = odontograma.pla[indiceNumero].ubicaciones[2].tipoMarca[11].valor === "SI" ? "click-proce" : "";
                                izquierdaCoronaBE = odontograma.pla[indiceNumero].ubicaciones[2].tipoMarca[12].valor === "SI" ? "click-corobuen" : "";
                                izquierdaCoronaME = odontograma.pla[indiceNumero].ubicaciones[2].tipoMarca[13].valor === "SI" ? "click-coromal" : "";
                                izquierdaProvBE = odontograma.pla[indiceNumero].ubicaciones[2].tipoMarca[14].valor === "SI" ? "click-probuen" : "";
                                izquierdaProvME = odontograma.pla[indiceNumero].ubicaciones[2].tipoMarca[16].valor === "SI" ? "click-promal" : "";
                                izquierdaNucleoBE = odontograma.pla[indiceNumero].ubicaciones[2].tipoMarca[16].valor === "SI" ? "click-nuclebuen" : "";
                                izquierdaNucleoME = odontograma.pla[indiceNumero].ubicaciones[2].tipoMarca[17].valor === "SI" ? "click-nuclemal" : "";
                                izquierdaRemovibleBE = odontograma.pla[indiceNumero].ubicaciones[2].tipoMarca[18].valor === "SI" ? "click-remobuen" : "";
                                izquierdaRemovibleME = odontograma.pla[indiceNumero].ubicaciones[2].tipoMarca[19].valor === "SI" ? "click-remomal" : "";
                                izquierdaImplante = odontograma.pla[indiceNumero].ubicaciones[2].tipoMarca[20].valor === "SI" ? "click-implante" : "";
                                izquierdaPlaca = odontograma.pla[indiceNumero].ubicaciones[2].tipoMarca[21].valor === "SI" ? "click-green" : "";

                                //derecha
                                derechaCariado = odontograma.pla[indiceNumero].ubicaciones[3].tipoMarca[0].valor === "SI" ? "click-red" : "";                                                                       
                                derechaObturado = odontograma.pla[indiceNumero].ubicaciones[3].tipoMarca[1].valor === "SI" ? "click-blue" : "";
                                derechaExoRealizada = odontograma.pla[indiceNumero].ubicaciones[3].tipoMarca[2].valor === "SI" ? "click-gray" : "";
                                derechaExoSimple = odontograma.pla[indiceNumero].ubicaciones[3].tipoMarca[3].valor === "SI" ? "click-blue-border" : "";
                                derechaExoQuirurgica = odontograma.pla[indiceNumero].ubicaciones[3].tipoMarca[4].valor === "SI" ? "click-red-border" : "";
                                derechaSinErupcionar = odontograma.pla[indiceNumero].ubicaciones[3].tipoMarca[5].valor === "SI" ? "click-erupcionar" : "";
                                derechaEndoRealizada = odontograma.pla[indiceNumero].ubicaciones[3].tipoMarca[6].valor === "SI" ? "click-endo" : "";
                                derechaEndoIndicada = odontograma.pla[indiceNumero].ubicaciones[3].tipoMarca[7].valor === "SI" ? "click-marron-border" : "";
                                derechaSellantePresente = odontograma.pla[indiceNumero].ubicaciones[3].tipoMarca[8].valor === "SI" ? "click-sellantep" : "";
                                derechaSellanteIndicado = odontograma.pla[indiceNumero].ubicaciones[3].tipoMarca[9].valor === "SI" ? "click-sellantei" : "";
                                derechaErosion = odontograma.pla[indiceNumero].ubicaciones[3].tipoMarca[10].valor === "SI" ? "click-erosion" : "";
                                derechaProceRealizado = odontograma.pla[indiceNumero].ubicaciones[3].tipoMarca[11].valor === "SI" ? "click-proce" : "";
                                derechaCoronaBE = odontograma.pla[indiceNumero].ubicaciones[3].tipoMarca[12].valor === "SI" ? "click-corobuen" : "";
                                derechaCoronaME = odontograma.pla[indiceNumero].ubicaciones[3].tipoMarca[13].valor === "SI" ? "click-coromal" : "";
                                derechaProvBE = odontograma.pla[indiceNumero].ubicaciones[3].tipoMarca[14].valor === "SI" ? "click-probuen" : "";
                                derechaProvME = odontograma.pla[indiceNumero].ubicaciones[3].tipoMarca[16].valor === "SI" ? "click-promal" : "";
                                derechaNucleoBE = odontograma.pla[indiceNumero].ubicaciones[3].tipoMarca[16].valor === "SI" ? "click-nuclebuen" : "";
                                derechaNucleoME = odontograma.pla[indiceNumero].ubicaciones[3].tipoMarca[17].valor === "SI" ? "click-nuclemal" : "";
                                derechaRemovibleBE = odontograma.pla[indiceNumero].ubicaciones[3].tipoMarca[18].valor === "SI" ? "click-remobuen" : "";
                                derechaRemovibleME = odontograma.pla[indiceNumero].ubicaciones[3].tipoMarca[19].valor === "SI" ? "click-remomal" : "";
                                derechaImplante = odontograma.pla[indiceNumero].ubicaciones[3].tipoMarca[20].valor === "SI" ? "click-implante" : "";
                                derechaPlaca = odontograma.pla[indiceNumero].ubicaciones[3].tipoMarca[21].valor === "SI" ? "click-green" : "";

                                //centro
                                centroCariado = odontograma.pla[indiceNumero].ubicaciones[4].tipoMarca[0].valor === "SI" ? "click-red" : "";                                                                       
                                centroObturado = odontograma.pla[indiceNumero].ubicaciones[4].tipoMarca[1].valor === "SI" ? "click-blue" : "";
                                centroExoRealizada = odontograma.pla[indiceNumero].ubicaciones[4].tipoMarca[2].valor === "SI" ? "click-gray" : "";
                                centroExoSimple = odontograma.pla[indiceNumero].ubicaciones[4].tipoMarca[3].valor === "SI" ? "click-blue-border" : "";
                                centroExoQuirurgica = odontograma.pla[indiceNumero].ubicaciones[4].tipoMarca[4].valor === "SI" ? "click-red-border" : "";
                                centroSinErupcionar = odontograma.pla[indiceNumero].ubicaciones[4].tipoMarca[5].valor === "SI" ? "click-erupcionar" : "";
                                centroEndoRealizada = odontograma.pla[indiceNumero].ubicaciones[4].tipoMarca[6].valor === "SI" ? "click-endo" : "";
                                centroEndoIndicada = odontograma.pla[indiceNumero].ubicaciones[4].tipoMarca[7].valor === "SI" ? "click-marron-border" : "";
                                centroSellantePresente = odontograma.pla[indiceNumero].ubicaciones[4].tipoMarca[8].valor === "SI" ? "click-sellantep" : "";
                                centroSellanteIndicado = odontograma.pla[indiceNumero].ubicaciones[4].tipoMarca[9].valor === "SI" ? "click-sellantei" : "";
                                centroErosion = odontograma.pla[indiceNumero].ubicaciones[4].tipoMarca[10].valor === "SI" ? "click-erosion" : "";
                                centroProceRealizado = odontograma.pla[indiceNumero].ubicaciones[4].tipoMarca[11].valor === "SI" ? "click-proce" : "";
                                centroCoronaBE = odontograma.pla[indiceNumero].ubicaciones[4].tipoMarca[12].valor === "SI" ? "click-corobuen" : "";
                                centroCoronaME = odontograma.pla[indiceNumero].ubicaciones[4].tipoMarca[13].valor === "SI" ? "click-coromal" : "";
                                centroProvBE = odontograma.pla[indiceNumero].ubicaciones[4].tipoMarca[14].valor === "SI" ? "click-probuen" : "";
                                centroProvME = odontograma.pla[indiceNumero].ubicaciones[4].tipoMarca[16].valor === "SI" ? "click-promal" : "";
                                centroNucleoBE = odontograma.pla[indiceNumero].ubicaciones[4].tipoMarca[16].valor === "SI" ? "click-nuclebuen" : "";
                                centroNucleoME = odontograma.pla[indiceNumero].ubicaciones[4].tipoMarca[17].valor === "SI" ? "click-nuclemal" : "";
                                centroRemovibleBE = odontograma.pla[indiceNumero].ubicaciones[4].tipoMarca[18].valor === "SI" ? "click-remobuen" : "";
                                centroRemovibleME = odontograma.pla[indiceNumero].ubicaciones[4].tipoMarca[19].valor === "SI" ? "click-remomal" : "";
                                centroImplante = odontograma.pla[indiceNumero].ubicaciones[4].tipoMarca[20].valor === "SI" ? "click-implante" : "";
                                centroPlaca = odontograma.pla[indiceNumero].ubicaciones[4].tipoMarca[21].valor === "SI" ? "click-green" : "";
                            <%}%>
                            //Dientes Temporales Cuandrante Derecho (Superior/Inferior)
                            htmlLecheRight += '<div id="dienteL5' + i + '" style="left: -25%;" class="diente-leche">' +
                                    '<span style="margin-left: -19px; margin-bottom:5px; display: inline-block !important; border-radius: 10px !important;" class="label label-primary">5' + i + '</span>' +
                                    '<div id="tleche5' + i + '" class="cuadro-leche top-leche click ' +arribaCariado+ ' '+arribaObturado+' '+arribaExoRealizada+' '+arribaExoSimple+' '+arribaExoQuirurgica +
                                            ' '+arribaSinErupcionar+' '+arribaEndoRealizada+' '+arribaEndoIndicada+' '+arribaSellantePresente+' '+arribaSellanteIndicado+' '+arribaErosion+
                                            ' '+arribaProceRealizado+' '+arribaCoronaBE+' '+arribaCoronaME+' '+arribaProvBE+' '+arribaProvME+' '+arribaNucleoBE+' '+
                                            ' '+arribaNucleoME+' '+arribaRemovibleBE+' '+arribaRemovibleME+' '+arribaImplante+' '+ arribaPlaca +
                                            ' ">' +
                                        '<input type="hidden" id="arriba" value="5'+i+'"/>' +
                                    '</div>' +
                                    '<div id="lleche5' + i + '" class="cuadro-leche izquierdo-leche click ' + izquierdaCariado + ' '+izquierdaObturado+' '+izquierdaExoRealizada+' '+izquierdaExoSimple+' '+izquierdaExoQuirurgica +
                                            ' '+izquierdaSinErupcionar+' '+izquierdaEndoRealizada+' '+izquierdaEndoIndicada+' '+izquierdaSellantePresente+' '+izquierdaSellanteIndicado+' '+izquierdaErosion+
                                            ' '+izquierdaProceRealizado+' '+izquierdaCoronaBE+' '+izquierdaCoronaME+' '+izquierdaProvBE+' '+izquierdaProvME+' '+izquierdaNucleoBE+' '+
                                            ' '+izquierdaNucleoME+' '+izquierdaRemovibleBE+' '+izquierdaRemovibleME+' '+izquierdaImplante+' '+ izquierdaPlaca +
                                            ' ">' +
                                        '<input type="hidden" id="izquierda" value="5'+i+'"/>' +
                                    '</div>' +
                                    '<div id="bleche5' + i + '" class="cuadro-leche debajo-leche click ' + abajoCariado + ' '+abajoObturado+' '+abajoExoRealizada+' '+abajoExoSimple+' '+abajoExoQuirurgica +
                                            ' '+abajoSinErupcionar+' '+abajoEndoRealizada+' '+abajoEndoIndicada+' '+abajoSellantePresente+' '+abajoSellanteIndicado+' '+abajoErosion+
                                            ' '+abajoProceRealizado+' '+abajoCoronaBE+' '+abajoCoronaME+' '+abajoProvBE+' '+izquierdaProvME+' '+abajoNucleoBE+' '+
                                            ' '+abajoNucleoME+' '+abajoRemovibleBE+' '+abajoRemovibleME+' '+abajoImplante+' '+ abajoPlaca +
                                            ' ">' +
                                        '<input type="hidden" id="abajo" value="5'+i+'"/>' +
                                    '</div>' +
                                    '<div id="rleche5' + i + '" class="cuadro-leche derecha-leche click click ' + derechaCariado + ' '+derechaObturado+' '+derechaExoRealizada+' '+derechaExoSimple+' '+derechaExoQuirurgica +
                                            ' '+derechaSinErupcionar+' '+derechaEndoRealizada+' '+derechaEndoIndicada+' '+derechaSellantePresente+' '+derechaSellanteIndicado+' '+derechaErosion+
                                            ' '+derechaProceRealizado+' '+derechaCoronaBE+' '+derechaCoronaME+' '+derechaProvBE+' '+derechaProvME+' '+derechaNucleoBE+' '+
                                            ' '+derechaNucleoME+' '+derechaRemovibleBE+' '+derechaRemovibleME+' '+derechaImplante+' '+ derechaPlaca +
                                            ' ">' +
                                        '<input type="hidden" id="derecha" value="5'+i+'"/>' +
                                    '</div>' +
                                    '<div id="cleche5' + i + '" class="centro-leche click ' + centroCariado + ' '+centroObturado+' '+centroExoRealizada+' '+centroExoSimple+' '+centroExoQuirurgica +
                                            ' '+centroSinErupcionar+' '+centroEndoRealizada+' '+centroEndoIndicada+' '+centroSellantePresente+' '+centroSellanteIndicado+' '+centroErosion+
                                            ' '+centroProceRealizado+' '+centroCoronaBE+' '+centroCoronaME+' '+centroProvBE+' '+centroProvME+' '+centroNucleoBE+' '+
                                            ' '+centroNucleoME+' '+centroRemovibleBE+' '+centroRemovibleME+' '+centroImplante+' '+ centroPlaca +
                                            ' ">' +
                                        '<input type="hidden" id="centro" value="5'+i+'"/>' +
                                    '</div>' +
                                    '</div>';

                            <%if (hcOdontologia != null && hcOdontologia.getG_odontograma() != null) {%>

                                indiceNumero = calcularIndiceNumero("8", i);
                                arribaCariado = odontograma.pla[indiceNumero].ubicaciones[0].tipoMarca[0].valor === "SI" ? "click-red" : "";
                                arribaObturado = odontograma.pla[indiceNumero].ubicaciones[0].tipoMarca[1].valor === "SI" ? "click-blue" : "";
                                arribaExoRealizada = odontograma.pla[indiceNumero].ubicaciones[0].tipoMarca[2].valor === "SI" ? "click-gray" : "";
                                arribaExoSimple = odontograma.pla[indiceNumero].ubicaciones[0].tipoMarca[3].valor === "SI" ? "click-blue-border" : "";
                                arribaExoQuirurgica = odontograma.pla[indiceNumero].ubicaciones[0].tipoMarca[4].valor === "SI" ? "click-red-border" : "";
                                arribaSinErupcionar = odontograma.pla[indiceNumero].ubicaciones[0].tipoMarca[5].valor === "SI" ? "click-erupcionar" : "";
                                arribaEndoRealizada = odontograma.pla[indiceNumero].ubicaciones[0].tipoMarca[6].valor === "SI" ? "click-endo" : "";
                                arribaEndoIndicada = odontograma.pla[indiceNumero].ubicaciones[0].tipoMarca[7].valor === "SI" ? "click-marron-border" : "";
                                arribaSellantePresente = odontograma.pla[indiceNumero].ubicaciones[0].tipoMarca[8].valor === "SI" ? "click-sellantep" : "";
                                arribaSellanteIndicado = odontograma.pla[indiceNumero].ubicaciones[0].tipoMarca[9].valor === "SI" ? "click-sellantei" : "";
                                arribaErosion = odontograma.pla[indiceNumero].ubicaciones[0].tipoMarca[10].valor === "SI" ? "click-erosion" : "";
                                arribaProceRealizado = odontograma.pla[indiceNumero].ubicaciones[0].tipoMarca[11].valor === "SI" ? "click-proce" : "";
                                arribaCoronaBE = odontograma.pla[indiceNumero].ubicaciones[0].tipoMarca[12].valor === "SI" ? "click-corobuen" : "";
                                arribaCoronaME = odontograma.pla[indiceNumero].ubicaciones[0].tipoMarca[13].valor === "SI" ? "click-coromal" : "";
                                arribaProvBE = odontograma.pla[indiceNumero].ubicaciones[0].tipoMarca[14].valor === "SI" ? "click-probuen" : "";
                                arribaProvME = odontograma.pla[indiceNumero].ubicaciones[0].tipoMarca[16].valor === "SI" ? "click-promal" : "";
                                arribaNucleoBE = odontograma.pla[indiceNumero].ubicaciones[0].tipoMarca[16].valor === "SI" ? "click-nuclebuen" : "";
                                arribaNucleoME = odontograma.pla[indiceNumero].ubicaciones[0].tipoMarca[17].valor === "SI" ? "click-nuclemal" : "";
                                arribaRemovibleBE = odontograma.pla[indiceNumero].ubicaciones[0].tipoMarca[18].valor === "SI" ? "click-remobuen" : "";
                                arribaRemovibleME = odontograma.pla[indiceNumero].ubicaciones[0].tipoMarca[19].valor === "SI" ? "click-remomal" : "";
                                arribaImplante = odontograma.pla[indiceNumero].ubicaciones[0].tipoMarca[20].valor === "SI" ? "click-implante" : "";
                                arribaPlaca = odontograma.pla[indiceNumero].ubicaciones[0].tipoMarca[21].valor === "SI" ? "click-green" : "";

                                //abajo
                                abajoCariado = odontograma.pla[indiceNumero].ubicaciones[1].tipoMarca[0].valor === "SI" ? "click-red" : "";                                                                       
                                abajoObturado = odontograma.pla[indiceNumero].ubicaciones[1].tipoMarca[1].valor === "SI" ? "click-blue" : "";
                                abajoExoRealizada = odontograma.pla[indiceNumero].ubicaciones[1].tipoMarca[2].valor === "SI" ? "click-gray" : "";
                                abajoExoSimple = odontograma.pla[indiceNumero].ubicaciones[1].tipoMarca[3].valor === "SI" ? "click-blue-border" : "";
                                abajoExoQuirurgica = odontograma.pla[indiceNumero].ubicaciones[1].tipoMarca[4].valor === "SI" ? "click-red-border" : "";
                                abajoSinErupcionar = odontograma.pla[indiceNumero].ubicaciones[1].tipoMarca[5].valor === "SI" ? "click-erupcionar" : "";
                                abajoEndoRealizada = odontograma.pla[indiceNumero].ubicaciones[1].tipoMarca[6].valor === "SI" ? "click-endo" : "";
                                abajoEndoIndicada = odontograma.pla[indiceNumero].ubicaciones[1].tipoMarca[7].valor === "SI" ? "click-marron-border" : "";
                                abajoSellantePresente = odontograma.pla[indiceNumero].ubicaciones[1].tipoMarca[8].valor === "SI" ? "click-sellantep" : "";
                                abajoSellanteIndicado = odontograma.pla[indiceNumero].ubicaciones[1].tipoMarca[9].valor === "SI" ? "click-sellantei" : "";
                                abajoErosion = odontograma.pla[indiceNumero].ubicaciones[1].tipoMarca[10].valor === "SI" ? "click-erosion" : "";
                                abajoProceRealizado = odontograma.pla[indiceNumero].ubicaciones[1].tipoMarca[11].valor === "SI" ? "click-proce" : "";
                                abajoCoronaBE = odontograma.pla[indiceNumero].ubicaciones[1].tipoMarca[12].valor === "SI" ? "click-corobuen" : "";
                                abajoCoronaME = odontograma.pla[indiceNumero].ubicaciones[1].tipoMarca[13].valor === "SI" ? "click-coromal" : "";
                                abajoProvBE = odontograma.pla[indiceNumero].ubicaciones[1].tipoMarca[14].valor === "SI" ? "click-probuen" : "";
                                abajoProvME = odontograma.pla[indiceNumero].ubicaciones[1].tipoMarca[16].valor === "SI" ? "click-promal" : "";
                                abajoNucleoBE = odontograma.pla[indiceNumero].ubicaciones[1].tipoMarca[16].valor === "SI" ? "click-nuclebuen" : "";
                                abajoNucleoME = odontograma.pla[indiceNumero].ubicaciones[1].tipoMarca[17].valor === "SI" ? "click-nuclemal" : "";
                                abajoRemovibleBE = odontograma.pla[indiceNumero].ubicaciones[1].tipoMarca[18].valor === "SI" ? "click-remobuen" : "";
                                abajoRemovibleME = odontograma.pla[indiceNumero].ubicaciones[1].tipoMarca[19].valor === "SI" ? "click-remomal" : "";
                                abajoImplante = odontograma.pla[indiceNumero].ubicaciones[1].tipoMarca[20].valor === "SI" ? "click-implante" : "";
                                abajoPlaca = odontograma.pla[indiceNumero].ubicaciones[1].tipoMarca[21].valor === "SI" ? "click-green" : "";

                                //izquierda
                                izquierdaCariado = odontograma.pla[indiceNumero].ubicaciones[2].tipoMarca[0].valor === "SI" ? "click-red" : "";                                                                       
                                izquierdaObturado = odontograma.pla[indiceNumero].ubicaciones[2].tipoMarca[1].valor === "SI" ? "click-blue" : "";
                                izquierdaExoRealizada = odontograma.pla[indiceNumero].ubicaciones[2].tipoMarca[2].valor === "SI" ? "click-gray" : "";
                                izquierdaExoSimple = odontograma.pla[indiceNumero].ubicaciones[2].tipoMarca[3].valor === "SI" ? "click-blue-border" : "";
                                izquierdaExoQuirurgica = odontograma.pla[indiceNumero].ubicaciones[2].tipoMarca[4].valor === "SI" ? "click-red-border" : "";
                                izquierdaSinErupcionar = odontograma.pla[indiceNumero].ubicaciones[2].tipoMarca[5].valor === "SI" ? "click-erupcionar" : "";
                                izquierdaEndoRealizada = odontograma.pla[indiceNumero].ubicaciones[2].tipoMarca[6].valor === "SI" ? "click-endo" : "";
                                izquierdaEndoIndicada = odontograma.pla[indiceNumero].ubicaciones[2].tipoMarca[7].valor === "SI" ? "click-marron-border" : "";
                                izquierdaSellantePresente = odontograma.pla[indiceNumero].ubicaciones[2].tipoMarca[8].valor === "SI" ? "click-sellantep" : "";
                                izquierdaSellanteIndicado = odontograma.pla[indiceNumero].ubicaciones[2].tipoMarca[9].valor === "SI" ? "click-sellantei" : "";
                                izquierdaErosion = odontograma.pla[indiceNumero].ubicaciones[2].tipoMarca[10].valor === "SI" ? "click-erosion" : "";
                                izquierdaProceRealizado = odontograma.pla[indiceNumero].ubicaciones[2].tipoMarca[11].valor === "SI" ? "click-proce" : "";
                                izquierdaCoronaBE = odontograma.pla[indiceNumero].ubicaciones[2].tipoMarca[12].valor === "SI" ? "click-corobuen" : "";
                                izquierdaCoronaME = odontograma.pla[indiceNumero].ubicaciones[2].tipoMarca[13].valor === "SI" ? "click-coromal" : "";
                                izquierdaProvBE = odontograma.pla[indiceNumero].ubicaciones[2].tipoMarca[14].valor === "SI" ? "click-probuen" : "";
                                izquierdaProvME = odontograma.pla[indiceNumero].ubicaciones[2].tipoMarca[16].valor === "SI" ? "click-promal" : "";
                                izquierdaNucleoBE = odontograma.pla[indiceNumero].ubicaciones[2].tipoMarca[16].valor === "SI" ? "click-nuclebuen" : "";
                                izquierdaNucleoME = odontograma.pla[indiceNumero].ubicaciones[2].tipoMarca[17].valor === "SI" ? "click-nuclemal" : "";
                                izquierdaRemovibleBE = odontograma.pla[indiceNumero].ubicaciones[2].tipoMarca[18].valor === "SI" ? "click-remobuen" : "";
                                izquierdaRemovibleME = odontograma.pla[indiceNumero].ubicaciones[2].tipoMarca[19].valor === "SI" ? "click-remomal" : "";
                                izquierdaImplante = odontograma.pla[indiceNumero].ubicaciones[2].tipoMarca[20].valor === "SI" ? "click-implante" : "";
                                izquierdaPlaca = odontograma.pla[indiceNumero].ubicaciones[2].tipoMarca[21].valor === "SI" ? "click-green" : "";

                                //derecha
                                derechaCariado = odontograma.pla[indiceNumero].ubicaciones[3].tipoMarca[0].valor === "SI" ? "click-red" : "";                                                                       
                                derechaObturado = odontograma.pla[indiceNumero].ubicaciones[3].tipoMarca[1].valor === "SI" ? "click-blue" : "";
                                derechaExoRealizada = odontograma.pla[indiceNumero].ubicaciones[3].tipoMarca[2].valor === "SI" ? "click-gray" : "";
                                derechaExoSimple = odontograma.pla[indiceNumero].ubicaciones[3].tipoMarca[3].valor === "SI" ? "click-blue-border" : "";
                                derechaExoQuirurgica = odontograma.pla[indiceNumero].ubicaciones[3].tipoMarca[4].valor === "SI" ? "click-red-border" : "";
                                derechaSinErupcionar = odontograma.pla[indiceNumero].ubicaciones[3].tipoMarca[5].valor === "SI" ? "click-erupcionar" : "";
                                derechaEndoRealizada = odontograma.pla[indiceNumero].ubicaciones[3].tipoMarca[6].valor === "SI" ? "click-endo" : "";
                                derechaEndoIndicada = odontograma.pla[indiceNumero].ubicaciones[3].tipoMarca[7].valor === "SI" ? "click-marron-border" : "";
                                derechaSellantePresente = odontograma.pla[indiceNumero].ubicaciones[3].tipoMarca[8].valor === "SI" ? "click-sellantep" : "";
                                derechaSellanteIndicado = odontograma.pla[indiceNumero].ubicaciones[3].tipoMarca[9].valor === "SI" ? "click-sellantei" : "";
                                derechaErosion = odontograma.pla[indiceNumero].ubicaciones[3].tipoMarca[10].valor === "SI" ? "click-erosion" : "";
                                derechaProceRealizado = odontograma.pla[indiceNumero].ubicaciones[3].tipoMarca[11].valor === "SI" ? "click-proce" : "";
                                derechaCoronaBE = odontograma.pla[indiceNumero].ubicaciones[3].tipoMarca[12].valor === "SI" ? "click-corobuen" : "";
                                derechaCoronaME = odontograma.pla[indiceNumero].ubicaciones[3].tipoMarca[13].valor === "SI" ? "click-coromal" : "";
                                derechaProvBE = odontograma.pla[indiceNumero].ubicaciones[3].tipoMarca[14].valor === "SI" ? "click-probuen" : "";
                                derechaProvME = odontograma.pla[indiceNumero].ubicaciones[3].tipoMarca[16].valor === "SI" ? "click-promal" : "";
                                derechaNucleoBE = odontograma.pla[indiceNumero].ubicaciones[3].tipoMarca[16].valor === "SI" ? "click-nuclebuen" : "";
                                derechaNucleoME = odontograma.pla[indiceNumero].ubicaciones[3].tipoMarca[17].valor === "SI" ? "click-nuclemal" : "";
                                derechaRemovibleBE = odontograma.pla[indiceNumero].ubicaciones[3].tipoMarca[18].valor === "SI" ? "click-remobuen" : "";
                                derechaRemovibleME = odontograma.pla[indiceNumero].ubicaciones[3].tipoMarca[19].valor === "SI" ? "click-remomal" : "";
                                derechaImplante = odontograma.pla[indiceNumero].ubicaciones[3].tipoMarca[20].valor === "SI" ? "click-implante" : "";
                                derechaPlaca = odontograma.pla[indiceNumero].ubicaciones[3].tipoMarca[21].valor === "SI" ? "click-green" : "";

                                //centro
                                centroCariado = odontograma.pla[indiceNumero].ubicaciones[4].tipoMarca[0].valor === "SI" ? "click-red" : "";                                                                       
                                centroObturado = odontograma.pla[indiceNumero].ubicaciones[4].tipoMarca[1].valor === "SI" ? "click-blue" : "";
                                centroExoRealizada = odontograma.pla[indiceNumero].ubicaciones[4].tipoMarca[2].valor === "SI" ? "click-gray" : "";
                                centroExoSimple = odontograma.pla[indiceNumero].ubicaciones[4].tipoMarca[3].valor === "SI" ? "click-blue-border" : "";
                                centroExoQuirurgica = odontograma.pla[indiceNumero].ubicaciones[4].tipoMarca[4].valor === "SI" ? "click-red-border" : "";
                                centroSinErupcionar = odontograma.pla[indiceNumero].ubicaciones[4].tipoMarca[5].valor === "SI" ? "click-erupcionar" : "";
                                centroEndoRealizada = odontograma.pla[indiceNumero].ubicaciones[4].tipoMarca[6].valor === "SI" ? "click-endo" : "";
                                centroEndoIndicada = odontograma.pla[indiceNumero].ubicaciones[4].tipoMarca[7].valor === "SI" ? "click-marron-border" : "";
                                centroSellantePresente = odontograma.pla[indiceNumero].ubicaciones[4].tipoMarca[8].valor === "SI" ? "click-sellantep" : "";
                                centroSellanteIndicado = odontograma.pla[indiceNumero].ubicaciones[4].tipoMarca[9].valor === "SI" ? "click-sellantei" : "";
                                centroErosion = odontograma.pla[indiceNumero].ubicaciones[4].tipoMarca[10].valor === "SI" ? "click-erosion" : "";
                                centroProceRealizado = odontograma.pla[indiceNumero].ubicaciones[4].tipoMarca[11].valor === "SI" ? "click-proce" : "";
                                centroCoronaBE = odontograma.pla[indiceNumero].ubicaciones[4].tipoMarca[12].valor === "SI" ? "click-corobuen" : "";
                                centroCoronaME = odontograma.pla[indiceNumero].ubicaciones[4].tipoMarca[13].valor === "SI" ? "click-coromal" : "";
                                centroProvBE = odontograma.pla[indiceNumero].ubicaciones[4].tipoMarca[14].valor === "SI" ? "click-probuen" : "";
                                centroProvME = odontograma.pla[indiceNumero].ubicaciones[4].tipoMarca[16].valor === "SI" ? "click-promal" : "";
                                centroNucleoBE = odontograma.pla[indiceNumero].ubicaciones[4].tipoMarca[16].valor === "SI" ? "click-nuclebuen" : "";
                                centroNucleoME = odontograma.pla[indiceNumero].ubicaciones[4].tipoMarca[17].valor === "SI" ? "click-nuclemal" : "";
                                centroRemovibleBE = odontograma.pla[indiceNumero].ubicaciones[4].tipoMarca[18].valor === "SI" ? "click-remobuen" : "";
                                centroRemovibleME = odontograma.pla[indiceNumero].ubicaciones[4].tipoMarca[19].valor === "SI" ? "click-remomal" : "";
                                centroImplante = odontograma.pla[indiceNumero].ubicaciones[4].tipoMarca[20].valor === "SI" ? "click-implante" : "";
                                centroPlaca = odontograma.pla[indiceNumero].ubicaciones[4].tipoMarca[21].valor === "SI" ? "click-green" : "";
                            <%}%>

                            htmlLecheRight2 += '<div id="dienteL8' + i + '" style="left: -25%;" class="diente-leche">' +
                                    '<span style="margin-left: -19px; margin-bottom:5px; display: inline-block !important; border-radius: 10px !important;" class="label label-primary">8' + i + '</span>' +
                                    '<div id="tleche8' + i + '" class="cuadro-leche top-leche click ' + arribaCariado + ' '+arribaObturado+' '+arribaExoRealizada+' '+arribaExoSimple+' '+arribaExoQuirurgica +
                                            ' '+arribaSinErupcionar+' '+arribaEndoRealizada+' '+arribaEndoIndicada+' '+arribaSellantePresente+' '+arribaSellanteIndicado+' '+arribaErosion+
                                            ' '+arribaProceRealizado+' '+arribaCoronaBE+' '+arribaCoronaME+' '+arribaProvBE+' '+arribaProvME+' '+arribaNucleoBE+' '+
                                            ' '+arribaNucleoME+' '+arribaRemovibleBE+' '+arribaRemovibleME+' '+arribaImplante+' '+ arribaPlaca +
                                            ' ">' +
                                        '<input type="hidden" id="arriba" value="8'+i+'"/>' +
                                    '</div>' +
                                    '<div id="lleche8' + i + '" class="cuadro-leche izquierdo-leche click ' + izquierdaCariado + ' '+izquierdaObturado+' '+izquierdaExoRealizada+' '+izquierdaExoSimple+' '+izquierdaExoQuirurgica +
                                            ' '+izquierdaSinErupcionar+' '+izquierdaEndoRealizada+' '+izquierdaEndoIndicada+' '+izquierdaSellantePresente+' '+izquierdaSellanteIndicado+' '+izquierdaErosion+
                                            ' '+izquierdaProceRealizado+' '+izquierdaCoronaBE+' '+izquierdaCoronaME+' '+izquierdaProvBE+' '+izquierdaProvME+' '+izquierdaNucleoBE+' '+
                                            ' '+izquierdaNucleoME+' '+izquierdaRemovibleBE+' '+izquierdaRemovibleME+' '+izquierdaImplante+' '+ izquierdaPlaca +
                                            ' ">' +
                                        '<input type="hidden" id="izquierda" value="8'+i+'"/>' +
                                    '</div>' +
                                    '<div id="bleche8' + i + '" class="cuadro-leche debajo-leche click ' + abajoCariado + ' '+abajoObturado+' '+abajoExoRealizada+' '+abajoExoSimple+' '+abajoExoQuirurgica +
                                            ' '+abajoSinErupcionar+' '+abajoEndoRealizada+' '+abajoEndoIndicada+' '+abajoSellantePresente+' '+abajoSellanteIndicado+' '+abajoErosion+
                                            ' '+abajoProceRealizado+' '+abajoCoronaBE+' '+abajoCoronaME+' '+abajoProvBE+' '+izquierdaProvME+' '+abajoNucleoBE+' '+
                                            ' '+abajoNucleoME+' '+abajoRemovibleBE+' '+abajoRemovibleME+' '+abajoImplante+' '+ abajoPlaca +
                                            ' ">' +
                                        '<input type="hidden" id="abajo" value="8'+i+'"/>' +
                                    '</div>' +
                                    '<div id="rleche8' + i + '" class="cuadro-leche derecha-leche click click ' + derechaCariado + ' '+derechaObturado+' '+derechaExoRealizada+' '+derechaExoSimple+' '+derechaExoQuirurgica +
                                            ' '+derechaSinErupcionar+' '+derechaEndoRealizada+' '+derechaEndoIndicada+' '+derechaSellantePresente+' '+derechaSellanteIndicado+' '+derechaErosion+
                                            ' '+derechaProceRealizado+' '+derechaCoronaBE+' '+derechaCoronaME+' '+derechaProvBE+' '+derechaProvME+' '+derechaNucleoBE+' '+
                                            ' '+derechaNucleoME+' '+derechaRemovibleBE+' '+derechaRemovibleME+' '+derechaImplante+' '+ derechaPlaca +
                                            ' ">' +
                                        '<input type="hidden" id="derecha" value="8'+i+'"/>' +
                                    '</div>' +
                                    '<div id="cleche8' + i + '" class="centro-leche click ' + centroCariado + ' '+centroObturado+' '+centroExoRealizada+' '+centroExoSimple+' '+centroExoQuirurgica +
                                            ' '+centroSinErupcionar+' '+centroEndoRealizada+' '+centroEndoIndicada+' '+centroSellantePresente+' '+centroSellanteIndicado+' '+centroErosion+
                                            ' '+centroProceRealizado+' '+centroCoronaBE+' '+centroCoronaME+' '+centroProvBE+' '+centroProvME+' '+centroNucleoBE+' '+
                                            ' '+centroNucleoME+' '+centroRemovibleBE+' '+centroRemovibleME+' '+centroImplante+' '+ centroPlaca +
                                            ' ">' +
                                        '<input type="hidden" id="centro" value="8'+i+'"/>' +
                                    '</div>' +
                                    '</div>';
                        }
                        if (a < 6) {

                            <%if (hcOdontologia != null && hcOdontologia.getG_odontograma() != null) {%>

                                indiceNumero = calcularIndiceNumero("6", a);
                                arribaCariado = odontograma.pla[indiceNumero].ubicaciones[0].tipoMarca[0].valor === "SI" ? "click-red" : "";
                                arribaObturado = odontograma.pla[indiceNumero].ubicaciones[0].tipoMarca[1].valor === "SI" ? "click-blue" : "";
                                arribaExoRealizada = odontograma.pla[indiceNumero].ubicaciones[0].tipoMarca[2].valor === "SI" ? "click-gray" : "";
                                arribaExoSimple = odontograma.pla[indiceNumero].ubicaciones[0].tipoMarca[3].valor === "SI" ? "click-blue-border" : "";
                                arribaExoQuirurgica = odontograma.pla[indiceNumero].ubicaciones[0].tipoMarca[4].valor === "SI" ? "click-red-border" : "";
                                arribaSinErupcionar = odontograma.pla[indiceNumero].ubicaciones[0].tipoMarca[5].valor === "SI" ? "click-erupcionar" : "";
                                arribaEndoRealizada = odontograma.pla[indiceNumero].ubicaciones[0].tipoMarca[6].valor === "SI" ? "click-endo" : "";
                                arribaEndoIndicada = odontograma.pla[indiceNumero].ubicaciones[0].tipoMarca[7].valor === "SI" ? "click-marron-border" : "";
                                arribaSellantePresente = odontograma.pla[indiceNumero].ubicaciones[0].tipoMarca[8].valor === "SI" ? "click-sellantep" : "";
                                arribaSellanteIndicado = odontograma.pla[indiceNumero].ubicaciones[0].tipoMarca[9].valor === "SI" ? "click-sellantei" : "";
                                arribaErosion = odontograma.pla[indiceNumero].ubicaciones[0].tipoMarca[10].valor === "SI" ? "click-erosion" : "";
                                arribaProceRealizado = odontograma.pla[indiceNumero].ubicaciones[0].tipoMarca[11].valor === "SI" ? "click-proce" : "";
                                arribaCoronaBE = odontograma.pla[indiceNumero].ubicaciones[0].tipoMarca[12].valor === "SI" ? "click-corobuen" : "";
                                arribaCoronaME = odontograma.pla[indiceNumero].ubicaciones[0].tipoMarca[13].valor === "SI" ? "click-coromal" : "";
                                arribaProvBE = odontograma.pla[indiceNumero].ubicaciones[0].tipoMarca[14].valor === "SI" ? "click-probuen" : "";
                                arribaProvME = odontograma.pla[indiceNumero].ubicaciones[0].tipoMarca[16].valor === "SI" ? "click-promal" : "";
                                arribaNucleoBE = odontograma.pla[indiceNumero].ubicaciones[0].tipoMarca[16].valor === "SI" ? "click-nuclebuen" : "";
                                arribaNucleoME = odontograma.pla[indiceNumero].ubicaciones[0].tipoMarca[17].valor === "SI" ? "click-nuclemal" : "";
                                arribaRemovibleBE = odontograma.pla[indiceNumero].ubicaciones[0].tipoMarca[18].valor === "SI" ? "click-remobuen" : "";
                                arribaRemovibleME = odontograma.pla[indiceNumero].ubicaciones[0].tipoMarca[19].valor === "SI" ? "click-remomal" : "";
                                arribaImplante = odontograma.pla[indiceNumero].ubicaciones[0].tipoMarca[20].valor === "SI" ? "click-implante" : "";
                                arribaPlaca = odontograma.pla[indiceNumero].ubicaciones[0].tipoMarca[21].valor === "SI" ? "click-green" : "";

                                //abajo
                                abajoCariado = odontograma.pla[indiceNumero].ubicaciones[1].tipoMarca[0].valor === "SI" ? "click-red" : "";                                                                       
                                abajoObturado = odontograma.pla[indiceNumero].ubicaciones[1].tipoMarca[1].valor === "SI" ? "click-blue" : "";
                                abajoExoRealizada = odontograma.pla[indiceNumero].ubicaciones[1].tipoMarca[2].valor === "SI" ? "click-gray" : "";
                                abajoExoSimple = odontograma.pla[indiceNumero].ubicaciones[1].tipoMarca[3].valor === "SI" ? "click-blue-border" : "";
                                abajoExoQuirurgica = odontograma.pla[indiceNumero].ubicaciones[1].tipoMarca[4].valor === "SI" ? "click-red-border" : "";
                                abajoSinErupcionar = odontograma.pla[indiceNumero].ubicaciones[1].tipoMarca[5].valor === "SI" ? "click-erupcionar" : "";
                                abajoEndoRealizada = odontograma.pla[indiceNumero].ubicaciones[1].tipoMarca[6].valor === "SI" ? "click-endo" : "";
                                abajoEndoIndicada = odontograma.pla[indiceNumero].ubicaciones[1].tipoMarca[7].valor === "SI" ? "click-marron-border" : "";
                                abajoSellantePresente = odontograma.pla[indiceNumero].ubicaciones[1].tipoMarca[8].valor === "SI" ? "click-sellantep" : "";
                                abajoSellanteIndicado = odontograma.pla[indiceNumero].ubicaciones[1].tipoMarca[9].valor === "SI" ? "click-sellantei" : "";
                                abajoErosion = odontograma.pla[indiceNumero].ubicaciones[1].tipoMarca[10].valor === "SI" ? "click-erosion" : "";
                                abajoProceRealizado = odontograma.pla[indiceNumero].ubicaciones[1].tipoMarca[11].valor === "SI" ? "click-proce" : "";
                                abajoCoronaBE = odontograma.pla[indiceNumero].ubicaciones[1].tipoMarca[12].valor === "SI" ? "click-corobuen" : "";
                                abajoCoronaME = odontograma.pla[indiceNumero].ubicaciones[1].tipoMarca[13].valor === "SI" ? "click-coromal" : "";
                                abajoProvBE = odontograma.pla[indiceNumero].ubicaciones[1].tipoMarca[14].valor === "SI" ? "click-probuen" : "";
                                abajoProvME = odontograma.pla[indiceNumero].ubicaciones[1].tipoMarca[16].valor === "SI" ? "click-promal" : "";
                                abajoNucleoBE = odontograma.pla[indiceNumero].ubicaciones[1].tipoMarca[16].valor === "SI" ? "click-nuclebuen" : "";
                                abajoNucleoME = odontograma.pla[indiceNumero].ubicaciones[1].tipoMarca[17].valor === "SI" ? "click-nuclemal" : "";
                                abajoRemovibleBE = odontograma.pla[indiceNumero].ubicaciones[1].tipoMarca[18].valor === "SI" ? "click-remobuen" : "";
                                abajoRemovibleME = odontograma.pla[indiceNumero].ubicaciones[1].tipoMarca[19].valor === "SI" ? "click-remomal" : "";
                                abajoImplante = odontograma.pla[indiceNumero].ubicaciones[1].tipoMarca[20].valor === "SI" ? "click-implante" : "";
                                abajoPlaca = odontograma.pla[indiceNumero].ubicaciones[1].tipoMarca[21].valor === "SI" ? "click-green" : "";

                                //izquierda
                                izquierdaCariado = odontograma.pla[indiceNumero].ubicaciones[2].tipoMarca[0].valor === "SI" ? "click-red" : "";                                                                       
                                izquierdaObturado = odontograma.pla[indiceNumero].ubicaciones[2].tipoMarca[1].valor === "SI" ? "click-blue" : "";
                                izquierdaExoRealizada = odontograma.pla[indiceNumero].ubicaciones[2].tipoMarca[2].valor === "SI" ? "click-gray" : "";
                                izquierdaExoSimple = odontograma.pla[indiceNumero].ubicaciones[2].tipoMarca[3].valor === "SI" ? "click-blue-border" : "";
                                izquierdaExoQuirurgica = odontograma.pla[indiceNumero].ubicaciones[2].tipoMarca[4].valor === "SI" ? "click-red-border" : "";
                                izquierdaSinErupcionar = odontograma.pla[indiceNumero].ubicaciones[2].tipoMarca[5].valor === "SI" ? "click-erupcionar" : "";
                                izquierdaEndoRealizada = odontograma.pla[indiceNumero].ubicaciones[2].tipoMarca[6].valor === "SI" ? "click-endo" : "";
                                izquierdaEndoIndicada = odontograma.pla[indiceNumero].ubicaciones[2].tipoMarca[7].valor === "SI" ? "click-marron-border" : "";
                                izquierdaSellantePresente = odontograma.pla[indiceNumero].ubicaciones[2].tipoMarca[8].valor === "SI" ? "click-sellantep" : "";
                                izquierdaSellanteIndicado = odontograma.pla[indiceNumero].ubicaciones[2].tipoMarca[9].valor === "SI" ? "click-sellantei" : "";
                                izquierdaErosion = odontograma.pla[indiceNumero].ubicaciones[2].tipoMarca[10].valor === "SI" ? "click-erosion" : "";
                                izquierdaProceRealizado = odontograma.pla[indiceNumero].ubicaciones[2].tipoMarca[11].valor === "SI" ? "click-proce" : "";
                                izquierdaCoronaBE = odontograma.pla[indiceNumero].ubicaciones[2].tipoMarca[12].valor === "SI" ? "click-corobuen" : "";
                                izquierdaCoronaME = odontograma.pla[indiceNumero].ubicaciones[2].tipoMarca[13].valor === "SI" ? "click-coromal" : "";
                                izquierdaProvBE = odontograma.pla[indiceNumero].ubicaciones[2].tipoMarca[14].valor === "SI" ? "click-probuen" : "";
                                izquierdaProvME = odontograma.pla[indiceNumero].ubicaciones[2].tipoMarca[16].valor === "SI" ? "click-promal" : "";
                                izquierdaNucleoBE = odontograma.pla[indiceNumero].ubicaciones[2].tipoMarca[16].valor === "SI" ? "click-nuclebuen" : "";
                                izquierdaNucleoME = odontograma.pla[indiceNumero].ubicaciones[2].tipoMarca[17].valor === "SI" ? "click-nuclemal" : "";
                                izquierdaRemovibleBE = odontograma.pla[indiceNumero].ubicaciones[2].tipoMarca[18].valor === "SI" ? "click-remobuen" : "";
                                izquierdaRemovibleME = odontograma.pla[indiceNumero].ubicaciones[2].tipoMarca[19].valor === "SI" ? "click-remomal" : "";
                                izquierdaImplante = odontograma.pla[indiceNumero].ubicaciones[2].tipoMarca[20].valor === "SI" ? "click-implante" : "";
                                izquierdaPlaca = odontograma.pla[indiceNumero].ubicaciones[2].tipoMarca[21].valor === "SI" ? "click-green" : "";

                                //derecha
                                derechaCariado = odontograma.pla[indiceNumero].ubicaciones[3].tipoMarca[0].valor === "SI" ? "click-red" : "";                                                                       
                                derechaObturado = odontograma.pla[indiceNumero].ubicaciones[3].tipoMarca[1].valor === "SI" ? "click-blue" : "";
                                derechaExoRealizada = odontograma.pla[indiceNumero].ubicaciones[3].tipoMarca[2].valor === "SI" ? "click-gray" : "";
                                derechaExoSimple = odontograma.pla[indiceNumero].ubicaciones[3].tipoMarca[3].valor === "SI" ? "click-blue-border" : "";
                                derechaExoQuirurgica = odontograma.pla[indiceNumero].ubicaciones[3].tipoMarca[4].valor === "SI" ? "click-red-border" : "";
                                derechaSinErupcionar = odontograma.pla[indiceNumero].ubicaciones[3].tipoMarca[5].valor === "SI" ? "click-erupcionar" : "";
                                derechaEndoRealizada = odontograma.pla[indiceNumero].ubicaciones[3].tipoMarca[6].valor === "SI" ? "click-endo" : "";
                                derechaEndoIndicada = odontograma.pla[indiceNumero].ubicaciones[3].tipoMarca[7].valor === "SI" ? "click-marron-border" : "";
                                derechaSellantePresente = odontograma.pla[indiceNumero].ubicaciones[3].tipoMarca[8].valor === "SI" ? "click-sellantep" : "";
                                derechaSellanteIndicado = odontograma.pla[indiceNumero].ubicaciones[3].tipoMarca[9].valor === "SI" ? "click-sellantei" : "";
                                derechaErosion = odontograma.pla[indiceNumero].ubicaciones[3].tipoMarca[10].valor === "SI" ? "click-erosion" : "";
                                derechaProceRealizado = odontograma.pla[indiceNumero].ubicaciones[3].tipoMarca[11].valor === "SI" ? "click-proce" : "";
                                derechaCoronaBE = odontograma.pla[indiceNumero].ubicaciones[3].tipoMarca[12].valor === "SI" ? "click-corobuen" : "";
                                derechaCoronaME = odontograma.pla[indiceNumero].ubicaciones[3].tipoMarca[13].valor === "SI" ? "click-coromal" : "";
                                derechaProvBE = odontograma.pla[indiceNumero].ubicaciones[3].tipoMarca[14].valor === "SI" ? "click-probuen" : "";
                                derechaProvME = odontograma.pla[indiceNumero].ubicaciones[3].tipoMarca[16].valor === "SI" ? "click-promal" : "";
                                derechaNucleoBE = odontograma.pla[indiceNumero].ubicaciones[3].tipoMarca[16].valor === "SI" ? "click-nuclebuen" : "";
                                derechaNucleoME = odontograma.pla[indiceNumero].ubicaciones[3].tipoMarca[17].valor === "SI" ? "click-nuclemal" : "";
                                derechaRemovibleBE = odontograma.pla[indiceNumero].ubicaciones[3].tipoMarca[18].valor === "SI" ? "click-remobuen" : "";
                                derechaRemovibleME = odontograma.pla[indiceNumero].ubicaciones[3].tipoMarca[19].valor === "SI" ? "click-remomal" : "";
                                derechaImplante = odontograma.pla[indiceNumero].ubicaciones[3].tipoMarca[20].valor === "SI" ? "click-implante" : "";
                                derechaPlaca = odontograma.pla[indiceNumero].ubicaciones[3].tipoMarca[21].valor === "SI" ? "click-green" : "";

                                //centro
                                centroCariado = odontograma.pla[indiceNumero].ubicaciones[4].tipoMarca[0].valor === "SI" ? "click-red" : "";                                                                       
                                centroObturado = odontograma.pla[indiceNumero].ubicaciones[4].tipoMarca[1].valor === "SI" ? "click-blue" : "";
                                centroExoRealizada = odontograma.pla[indiceNumero].ubicaciones[4].tipoMarca[2].valor === "SI" ? "click-gray" : "";
                                centroExoSimple = odontograma.pla[indiceNumero].ubicaciones[4].tipoMarca[3].valor === "SI" ? "click-blue-border" : "";
                                centroExoQuirurgica = odontograma.pla[indiceNumero].ubicaciones[4].tipoMarca[4].valor === "SI" ? "click-red-border" : "";
                                centroSinErupcionar = odontograma.pla[indiceNumero].ubicaciones[4].tipoMarca[5].valor === "SI" ? "click-erupcionar" : "";
                                centroEndoRealizada = odontograma.pla[indiceNumero].ubicaciones[4].tipoMarca[6].valor === "SI" ? "click-endo" : "";
                                centroEndoIndicada = odontograma.pla[indiceNumero].ubicaciones[4].tipoMarca[7].valor === "SI" ? "click-marron-border" : "";
                                centroSellantePresente = odontograma.pla[indiceNumero].ubicaciones[4].tipoMarca[8].valor === "SI" ? "click-sellantep" : "";
                                centroSellanteIndicado = odontograma.pla[indiceNumero].ubicaciones[4].tipoMarca[9].valor === "SI" ? "click-sellantei" : "";
                                centroErosion = odontograma.pla[indiceNumero].ubicaciones[4].tipoMarca[10].valor === "SI" ? "click-erosion" : "";
                                centroProceRealizado = odontograma.pla[indiceNumero].ubicaciones[4].tipoMarca[11].valor === "SI" ? "click-proce" : "";
                                centroCoronaBE = odontograma.pla[indiceNumero].ubicaciones[4].tipoMarca[12].valor === "SI" ? "click-corobuen" : "";
                                centroCoronaME = odontograma.pla[indiceNumero].ubicaciones[4].tipoMarca[13].valor === "SI" ? "click-coromal" : "";
                                centroProvBE = odontograma.pla[indiceNumero].ubicaciones[4].tipoMarca[14].valor === "SI" ? "click-probuen" : "";
                                centroProvME = odontograma.pla[indiceNumero].ubicaciones[4].tipoMarca[16].valor === "SI" ? "click-promal" : "";
                                centroNucleoBE = odontograma.pla[indiceNumero].ubicaciones[4].tipoMarca[16].valor === "SI" ? "click-nuclebuen" : "";
                                centroNucleoME = odontograma.pla[indiceNumero].ubicaciones[4].tipoMarca[17].valor === "SI" ? "click-nuclemal" : "";
                                centroRemovibleBE = odontograma.pla[indiceNumero].ubicaciones[4].tipoMarca[18].valor === "SI" ? "click-remobuen" : "";
                                centroRemovibleME = odontograma.pla[indiceNumero].ubicaciones[4].tipoMarca[19].valor === "SI" ? "click-remomal" : "";
                                centroImplante = odontograma.pla[indiceNumero].ubicaciones[4].tipoMarca[20].valor === "SI" ? "click-implante" : "";
                                centroPlaca = odontograma.pla[indiceNumero].ubicaciones[4].tipoMarca[21].valor === "SI" ? "click-green" : "";
                            <%}%>
                            //Dientes Temporales Cuandrante Izquierdo (Superior/Inferior)
                            htmlLecheLeft += '<div id="dienteL6' + a + '" class="diente-leche">' +
                                    '<span style="margin-left: -25px; margin-bottom:5px; display: inline-block !important; border-radius: 10px !important;" class="label label-primary">6' + a + '</span>' +
                                    '<div id="tleche6' + a + '" class="cuadro-leche top-leche click ' +arribaCariado+ ' '+arribaObturado+' '+arribaExoRealizada+' '+arribaExoSimple+' '+arribaExoQuirurgica +
                                            ' '+arribaSinErupcionar+' '+arribaEndoRealizada+' '+arribaEndoIndicada+' '+arribaSellantePresente+' '+arribaSellanteIndicado+' '+arribaErosion+
                                            ' '+arribaProceRealizado+' '+arribaCoronaBE+' '+arribaCoronaME+' '+arribaProvBE+' '+arribaProvME+' '+arribaNucleoBE+' '+
                                            ' '+arribaNucleoME+' '+arribaRemovibleBE+' '+arribaRemovibleME+' '+arribaImplante+' '+ arribaPlaca +
                                            ' ">' +
                                        '<input type="hidden" id="arriba" value="6'+a+'"/>' +
                                    '</div>' +
                                    '<div id="lleche6' + a + '" class="cuadro-leche izquierdo-leche click ' + izquierdaCariado + ' '+izquierdaObturado+' '+izquierdaExoRealizada+' '+izquierdaExoSimple+' '+izquierdaExoQuirurgica +
                                            ' '+izquierdaSinErupcionar+' '+izquierdaEndoRealizada+' '+izquierdaEndoIndicada+' '+izquierdaSellantePresente+' '+izquierdaSellanteIndicado+' '+izquierdaErosion+
                                            ' '+izquierdaProceRealizado+' '+izquierdaCoronaBE+' '+izquierdaCoronaME+' '+izquierdaProvBE+' '+izquierdaProvME+' '+izquierdaNucleoBE+' '+
                                            ' '+izquierdaNucleoME+' '+izquierdaRemovibleBE+' '+izquierdaRemovibleME+' '+izquierdaImplante+' '+ izquierdaPlaca +
                                            ' ">' +
                                        '<input type="hidden" id="izquierda" value="6'+a+'"/>' +
                                    '</div>' +
                                    '<div id="bleche6' + a + '" class="cuadro-leche debajo-leche click ' + abajoCariado + ' '+abajoObturado+' '+abajoExoRealizada+' '+abajoExoSimple+' '+abajoExoQuirurgica +
                                            ' '+abajoSinErupcionar+' '+abajoEndoRealizada+' '+abajoEndoIndicada+' '+abajoSellantePresente+' '+abajoSellanteIndicado+' '+abajoErosion+
                                            ' '+abajoProceRealizado+' '+abajoCoronaBE+' '+abajoCoronaME+' '+abajoProvBE+' '+izquierdaProvME+' '+abajoNucleoBE+' '+
                                            ' '+abajoNucleoME+' '+abajoRemovibleBE+' '+abajoRemovibleME+' '+abajoImplante+' '+ abajoPlaca +
                                            ' ">' +
                                        '<input type="hidden" id="abajo" value="6'+a+'"/>' +
                                    '</div>' +
                                    '<div id="rleche6' + a + '" class="cuadro-leche derecha-leche click click ' + derechaCariado + ' '+derechaObturado+' '+derechaExoRealizada+' '+derechaExoSimple+' '+derechaExoQuirurgica +
                                            ' '+derechaSinErupcionar+' '+derechaEndoRealizada+' '+derechaEndoIndicada+' '+derechaSellantePresente+' '+derechaSellanteIndicado+' '+derechaErosion+
                                            ' '+derechaProceRealizado+' '+derechaCoronaBE+' '+derechaCoronaME+' '+derechaProvBE+' '+derechaProvME+' '+derechaNucleoBE+' '+
                                            ' '+derechaNucleoME+' '+derechaRemovibleBE+' '+derechaRemovibleME+' '+derechaImplante+' '+ derechaPlaca +
                                            ' ">' +
                                        '<input type="hidden" id="derecha" value="6'+a+'"/>' +
                                    '</div>' +
                                    '<div id="cleche6' + a + '" class="centro-leche click ' + centroCariado + ' '+centroObturado+' '+centroExoRealizada+' '+centroExoSimple+' '+centroExoQuirurgica +
                                            ' '+centroSinErupcionar+' '+centroEndoRealizada+' '+centroEndoIndicada+' '+centroSellantePresente+' '+centroSellanteIndicado+' '+centroErosion+
                                            ' '+centroProceRealizado+' '+centroCoronaBE+' '+centroCoronaME+' '+centroProvBE+' '+centroProvME+' '+centroNucleoBE+' '+
                                            ' '+centroNucleoME+' '+centroRemovibleBE+' '+centroRemovibleME+' '+centroImplante+' '+ centroPlaca +
                                            ' ">' +
                                        '<input type="hidden" id="centro" value="6'+a+'"/>' +
                                    '</div>' +
                                    '</div>';

                            <%if (hcOdontologia != null && hcOdontologia.getG_odontograma() != null) {%>

                                indiceNumero = calcularIndiceNumero("7", a);
                                arribaCariado = odontograma.pla[indiceNumero].ubicaciones[0].tipoMarca[0].valor === "SI" ? "click-red" : "";
                                arribaObturado = odontograma.pla[indiceNumero].ubicaciones[0].tipoMarca[1].valor === "SI" ? "click-blue" : "";
                                arribaExoRealizada = odontograma.pla[indiceNumero].ubicaciones[0].tipoMarca[2].valor === "SI" ? "click-gray" : "";
                                arribaExoSimple = odontograma.pla[indiceNumero].ubicaciones[0].tipoMarca[3].valor === "SI" ? "click-blue-border" : "";
                                arribaExoQuirurgica = odontograma.pla[indiceNumero].ubicaciones[0].tipoMarca[4].valor === "SI" ? "click-red-border" : "";
                                arribaSinErupcionar = odontograma.pla[indiceNumero].ubicaciones[0].tipoMarca[5].valor === "SI" ? "click-erupcionar" : "";
                                arribaEndoRealizada = odontograma.pla[indiceNumero].ubicaciones[0].tipoMarca[6].valor === "SI" ? "click-endo" : "";
                                arribaEndoIndicada = odontograma.pla[indiceNumero].ubicaciones[0].tipoMarca[7].valor === "SI" ? "click-marron-border" : "";
                                arribaSellantePresente = odontograma.pla[indiceNumero].ubicaciones[0].tipoMarca[8].valor === "SI" ? "click-sellantep" : "";
                                arribaSellanteIndicado = odontograma.pla[indiceNumero].ubicaciones[0].tipoMarca[9].valor === "SI" ? "click-sellantei" : "";
                                arribaErosion = odontograma.pla[indiceNumero].ubicaciones[0].tipoMarca[10].valor === "SI" ? "click-erosion" : "";
                                arribaProceRealizado = odontograma.pla[indiceNumero].ubicaciones[0].tipoMarca[11].valor === "SI" ? "click-proce" : "";
                                arribaCoronaBE = odontograma.pla[indiceNumero].ubicaciones[0].tipoMarca[12].valor === "SI" ? "click-corobuen" : "";
                                arribaCoronaME = odontograma.pla[indiceNumero].ubicaciones[0].tipoMarca[13].valor === "SI" ? "click-coromal" : "";
                                arribaProvBE = odontograma.pla[indiceNumero].ubicaciones[0].tipoMarca[14].valor === "SI" ? "click-probuen" : "";
                                arribaProvME = odontograma.pla[indiceNumero].ubicaciones[0].tipoMarca[16].valor === "SI" ? "click-promal" : "";
                                arribaNucleoBE = odontograma.pla[indiceNumero].ubicaciones[0].tipoMarca[16].valor === "SI" ? "click-nuclebuen" : "";
                                arribaNucleoME = odontograma.pla[indiceNumero].ubicaciones[0].tipoMarca[17].valor === "SI" ? "click-nuclemal" : "";
                                arribaRemovibleBE = odontograma.pla[indiceNumero].ubicaciones[0].tipoMarca[18].valor === "SI" ? "click-remobuen" : "";
                                arribaRemovibleME = odontograma.pla[indiceNumero].ubicaciones[0].tipoMarca[19].valor === "SI" ? "click-remomal" : "";
                                arribaImplante = odontograma.pla[indiceNumero].ubicaciones[0].tipoMarca[20].valor === "SI" ? "click-implante" : "";
                                arribaPlaca = odontograma.pla[indiceNumero].ubicaciones[0].tipoMarca[21].valor === "SI" ? "click-green" : "";

                                //abajo
                                abajoCariado = odontograma.pla[indiceNumero].ubicaciones[1].tipoMarca[0].valor === "SI" ? "click-red" : "";                                                                       
                                abajoObturado = odontograma.pla[indiceNumero].ubicaciones[1].tipoMarca[1].valor === "SI" ? "click-blue" : "";
                                abajoExoRealizada = odontograma.pla[indiceNumero].ubicaciones[1].tipoMarca[2].valor === "SI" ? "click-gray" : "";
                                abajoExoSimple = odontograma.pla[indiceNumero].ubicaciones[1].tipoMarca[3].valor === "SI" ? "click-blue-border" : "";
                                abajoExoQuirurgica = odontograma.pla[indiceNumero].ubicaciones[1].tipoMarca[4].valor === "SI" ? "click-red-border" : "";
                                abajoSinErupcionar = odontograma.pla[indiceNumero].ubicaciones[1].tipoMarca[5].valor === "SI" ? "click-erupcionar" : "";
                                abajoEndoRealizada = odontograma.pla[indiceNumero].ubicaciones[1].tipoMarca[6].valor === "SI" ? "click-endo" : "";
                                abajoEndoIndicada = odontograma.pla[indiceNumero].ubicaciones[1].tipoMarca[7].valor === "SI" ? "click-marron-border" : "";
                                abajoSellantePresente = odontograma.pla[indiceNumero].ubicaciones[1].tipoMarca[8].valor === "SI" ? "click-sellantep" : "";
                                abajoSellanteIndicado = odontograma.pla[indiceNumero].ubicaciones[1].tipoMarca[9].valor === "SI" ? "click-sellantei" : "";
                                abajoErosion = odontograma.pla[indiceNumero].ubicaciones[1].tipoMarca[10].valor === "SI" ? "click-erosion" : "";
                                abajoProceRealizado = odontograma.pla[indiceNumero].ubicaciones[1].tipoMarca[11].valor === "SI" ? "click-proce" : "";
                                abajoCoronaBE = odontograma.pla[indiceNumero].ubicaciones[1].tipoMarca[12].valor === "SI" ? "click-corobuen" : "";
                                abajoCoronaME = odontograma.pla[indiceNumero].ubicaciones[1].tipoMarca[13].valor === "SI" ? "click-coromal" : "";
                                abajoProvBE = odontograma.pla[indiceNumero].ubicaciones[1].tipoMarca[14].valor === "SI" ? "click-probuen" : "";
                                abajoProvME = odontograma.pla[indiceNumero].ubicaciones[1].tipoMarca[16].valor === "SI" ? "click-promal" : "";
                                abajoNucleoBE = odontograma.pla[indiceNumero].ubicaciones[1].tipoMarca[16].valor === "SI" ? "click-nuclebuen" : "";
                                abajoNucleoME = odontograma.pla[indiceNumero].ubicaciones[1].tipoMarca[17].valor === "SI" ? "click-nuclemal" : "";
                                abajoRemovibleBE = odontograma.pla[indiceNumero].ubicaciones[1].tipoMarca[18].valor === "SI" ? "click-remobuen" : "";
                                abajoRemovibleME = odontograma.pla[indiceNumero].ubicaciones[1].tipoMarca[19].valor === "SI" ? "click-remomal" : "";
                                abajoImplante = odontograma.pla[indiceNumero].ubicaciones[1].tipoMarca[20].valor === "SI" ? "click-implante" : "";
                                abajoPlaca = odontograma.pla[indiceNumero].ubicaciones[1].tipoMarca[21].valor === "SI" ? "click-green" : "";

                                //izquierda
                                izquierdaCariado = odontograma.pla[indiceNumero].ubicaciones[2].tipoMarca[0].valor === "SI" ? "click-red" : "";                                                                       
                                izquierdaObturado = odontograma.pla[indiceNumero].ubicaciones[2].tipoMarca[1].valor === "SI" ? "click-blue" : "";
                                izquierdaExoRealizada = odontograma.pla[indiceNumero].ubicaciones[2].tipoMarca[2].valor === "SI" ? "click-gray" : "";
                                izquierdaExoSimple = odontograma.pla[indiceNumero].ubicaciones[2].tipoMarca[3].valor === "SI" ? "click-blue-border" : "";
                                izquierdaExoQuirurgica = odontograma.pla[indiceNumero].ubicaciones[2].tipoMarca[4].valor === "SI" ? "click-red-border" : "";
                                izquierdaSinErupcionar = odontograma.pla[indiceNumero].ubicaciones[2].tipoMarca[5].valor === "SI" ? "click-erupcionar" : "";
                                izquierdaEndoRealizada = odontograma.pla[indiceNumero].ubicaciones[2].tipoMarca[6].valor === "SI" ? "click-endo" : "";
                                izquierdaEndoIndicada = odontograma.pla[indiceNumero].ubicaciones[2].tipoMarca[7].valor === "SI" ? "click-marron-border" : "";
                                izquierdaSellantePresente = odontograma.pla[indiceNumero].ubicaciones[2].tipoMarca[8].valor === "SI" ? "click-sellantep" : "";
                                izquierdaSellanteIndicado = odontograma.pla[indiceNumero].ubicaciones[2].tipoMarca[9].valor === "SI" ? "click-sellantei" : "";
                                izquierdaErosion = odontograma.pla[indiceNumero].ubicaciones[2].tipoMarca[10].valor === "SI" ? "click-erosion" : "";
                                izquierdaProceRealizado = odontograma.pla[indiceNumero].ubicaciones[2].tipoMarca[11].valor === "SI" ? "click-proce" : "";
                                izquierdaCoronaBE = odontograma.pla[indiceNumero].ubicaciones[2].tipoMarca[12].valor === "SI" ? "click-corobuen" : "";
                                izquierdaCoronaME = odontograma.pla[indiceNumero].ubicaciones[2].tipoMarca[13].valor === "SI" ? "click-coromal" : "";
                                izquierdaProvBE = odontograma.pla[indiceNumero].ubicaciones[2].tipoMarca[14].valor === "SI" ? "click-probuen" : "";
                                izquierdaProvME = odontograma.pla[indiceNumero].ubicaciones[2].tipoMarca[16].valor === "SI" ? "click-promal" : "";
                                izquierdaNucleoBE = odontograma.pla[indiceNumero].ubicaciones[2].tipoMarca[16].valor === "SI" ? "click-nuclebuen" : "";
                                izquierdaNucleoME = odontograma.pla[indiceNumero].ubicaciones[2].tipoMarca[17].valor === "SI" ? "click-nuclemal" : "";
                                izquierdaRemovibleBE = odontograma.pla[indiceNumero].ubicaciones[2].tipoMarca[18].valor === "SI" ? "click-remobuen" : "";
                                izquierdaRemovibleME = odontograma.pla[indiceNumero].ubicaciones[2].tipoMarca[19].valor === "SI" ? "click-remomal" : "";
                                izquierdaImplante = odontograma.pla[indiceNumero].ubicaciones[2].tipoMarca[20].valor === "SI" ? "click-implante" : "";
                                izquierdaPlaca = odontograma.pla[indiceNumero].ubicaciones[2].tipoMarca[21].valor === "SI" ? "click-green" : "";

                                //derecha
                                derechaCariado = odontograma.pla[indiceNumero].ubicaciones[3].tipoMarca[0].valor === "SI" ? "click-red" : "";                                                                       
                                derechaObturado = odontograma.pla[indiceNumero].ubicaciones[3].tipoMarca[1].valor === "SI" ? "click-blue" : "";
                                derechaExoRealizada = odontograma.pla[indiceNumero].ubicaciones[3].tipoMarca[2].valor === "SI" ? "click-gray" : "";
                                derechaExoSimple = odontograma.pla[indiceNumero].ubicaciones[3].tipoMarca[3].valor === "SI" ? "click-blue-border" : "";
                                derechaExoQuirurgica = odontograma.pla[indiceNumero].ubicaciones[3].tipoMarca[4].valor === "SI" ? "click-red-border" : "";
                                derechaSinErupcionar = odontograma.pla[indiceNumero].ubicaciones[3].tipoMarca[5].valor === "SI" ? "click-erupcionar" : "";
                                derechaEndoRealizada = odontograma.pla[indiceNumero].ubicaciones[3].tipoMarca[6].valor === "SI" ? "click-endo" : "";
                                derechaEndoIndicada = odontograma.pla[indiceNumero].ubicaciones[3].tipoMarca[7].valor === "SI" ? "click-marron-border" : "";
                                derechaSellantePresente = odontograma.pla[indiceNumero].ubicaciones[3].tipoMarca[8].valor === "SI" ? "click-sellantep" : "";
                                derechaSellanteIndicado = odontograma.pla[indiceNumero].ubicaciones[3].tipoMarca[9].valor === "SI" ? "click-sellantei" : "";
                                derechaErosion = odontograma.pla[indiceNumero].ubicaciones[3].tipoMarca[10].valor === "SI" ? "click-erosion" : "";
                                derechaProceRealizado = odontograma.pla[indiceNumero].ubicaciones[3].tipoMarca[11].valor === "SI" ? "click-proce" : "";
                                derechaCoronaBE = odontograma.pla[indiceNumero].ubicaciones[3].tipoMarca[12].valor === "SI" ? "click-corobuen" : "";
                                derechaCoronaME = odontograma.pla[indiceNumero].ubicaciones[3].tipoMarca[13].valor === "SI" ? "click-coromal" : "";
                                derechaProvBE = odontograma.pla[indiceNumero].ubicaciones[3].tipoMarca[14].valor === "SI" ? "click-probuen" : "";
                                derechaProvME = odontograma.pla[indiceNumero].ubicaciones[3].tipoMarca[16].valor === "SI" ? "click-promal" : "";
                                derechaNucleoBE = odontograma.pla[indiceNumero].ubicaciones[3].tipoMarca[16].valor === "SI" ? "click-nuclebuen" : "";
                                derechaNucleoME = odontograma.pla[indiceNumero].ubicaciones[3].tipoMarca[17].valor === "SI" ? "click-nuclemal" : "";
                                derechaRemovibleBE = odontograma.pla[indiceNumero].ubicaciones[3].tipoMarca[18].valor === "SI" ? "click-remobuen" : "";
                                derechaRemovibleME = odontograma.pla[indiceNumero].ubicaciones[3].tipoMarca[19].valor === "SI" ? "click-remomal" : "";
                                derechaImplante = odontograma.pla[indiceNumero].ubicaciones[3].tipoMarca[20].valor === "SI" ? "click-implante" : "";
                                derechaPlaca = odontograma.pla[indiceNumero].ubicaciones[3].tipoMarca[21].valor === "SI" ? "click-green" : "";

                                //centro
                                centroCariado = odontograma.pla[indiceNumero].ubicaciones[4].tipoMarca[0].valor === "SI" ? "click-red" : "";                                                                       
                                centroObturado = odontograma.pla[indiceNumero].ubicaciones[4].tipoMarca[1].valor === "SI" ? "click-blue" : "";
                                centroExoRealizada = odontograma.pla[indiceNumero].ubicaciones[4].tipoMarca[2].valor === "SI" ? "click-gray" : "";
                                centroExoSimple = odontograma.pla[indiceNumero].ubicaciones[4].tipoMarca[3].valor === "SI" ? "click-blue-border" : "";
                                centroExoQuirurgica = odontograma.pla[indiceNumero].ubicaciones[4].tipoMarca[4].valor === "SI" ? "click-red-border" : "";
                                centroSinErupcionar = odontograma.pla[indiceNumero].ubicaciones[4].tipoMarca[5].valor === "SI" ? "click-erupcionar" : "";
                                centroEndoRealizada = odontograma.pla[indiceNumero].ubicaciones[4].tipoMarca[6].valor === "SI" ? "click-endo" : "";
                                centroEndoIndicada = odontograma.pla[indiceNumero].ubicaciones[4].tipoMarca[7].valor === "SI" ? "click-marron-border" : "";
                                centroSellantePresente = odontograma.pla[indiceNumero].ubicaciones[4].tipoMarca[8].valor === "SI" ? "click-sellantep" : "";
                                centroSellanteIndicado = odontograma.pla[indiceNumero].ubicaciones[4].tipoMarca[9].valor === "SI" ? "click-sellantei" : "";
                                centroErosion = odontograma.pla[indiceNumero].ubicaciones[4].tipoMarca[10].valor === "SI" ? "click-erosion" : "";
                                centroProceRealizado = odontograma.pla[indiceNumero].ubicaciones[4].tipoMarca[11].valor === "SI" ? "click-proce" : "";
                                centroCoronaBE = odontograma.pla[indiceNumero].ubicaciones[4].tipoMarca[12].valor === "SI" ? "click-corobuen" : "";
                                centroCoronaME = odontograma.pla[indiceNumero].ubicaciones[4].tipoMarca[13].valor === "SI" ? "click-coromal" : "";
                                centroProvBE = odontograma.pla[indiceNumero].ubicaciones[4].tipoMarca[14].valor === "SI" ? "click-probuen" : "";
                                centroProvME = odontograma.pla[indiceNumero].ubicaciones[4].tipoMarca[16].valor === "SI" ? "click-promal" : "";
                                centroNucleoBE = odontograma.pla[indiceNumero].ubicaciones[4].tipoMarca[16].valor === "SI" ? "click-nuclebuen" : "";
                                centroNucleoME = odontograma.pla[indiceNumero].ubicaciones[4].tipoMarca[17].valor === "SI" ? "click-nuclemal" : "";
                                centroRemovibleBE = odontograma.pla[indiceNumero].ubicaciones[4].tipoMarca[18].valor === "SI" ? "click-remobuen" : "";
                                centroRemovibleME = odontograma.pla[indiceNumero].ubicaciones[4].tipoMarca[19].valor === "SI" ? "click-remomal" : "";
                                centroImplante = odontograma.pla[indiceNumero].ubicaciones[4].tipoMarca[20].valor === "SI" ? "click-implante" : "";
                                centroPlaca = odontograma.pla[indiceNumero].ubicaciones[4].tipoMarca[21].valor === "SI" ? "click-green" : "";
                            <%}%>

                            htmlLecheLeft2 += '<div id="dienteL7' + a + '" class="diente-leche">' +
                                    '<span style="margin-left: -25px; margin-bottom:5px; display: inline-block !important; border-radius: 10px !important;" class="label label-primary">7' + a + '</span>' +
                                    '<div id="tleche7' + a + '" class="cuadro-leche top-leche click ' +arribaCariado+ ' '+arribaObturado+' '+arribaExoRealizada+' '+arribaExoSimple+' '+arribaExoQuirurgica +
                                            ' '+arribaSinErupcionar+' '+arribaEndoRealizada+' '+arribaEndoIndicada+' '+arribaSellantePresente+' '+arribaSellanteIndicado+' '+arribaErosion+
                                            ' '+arribaProceRealizado+' '+arribaCoronaBE+' '+arribaCoronaME+' '+arribaProvBE+' '+arribaProvME+' '+arribaNucleoBE+' '+
                                            ' '+arribaNucleoME+' '+arribaRemovibleBE+' '+arribaRemovibleME+' '+arribaImplante+' '+ arribaPlaca +
                                            ' ">' +
                                        '<input type="hidden" id="arriba" value="7'+a+'"/>' +
                                    '</div>' +
                                    '<div id="lleche7' + a + '" class="cuadro-leche izquierdo-leche click ' + izquierdaCariado + ' '+izquierdaObturado+' '+izquierdaExoRealizada+' '+izquierdaExoSimple+' '+izquierdaExoQuirurgica +
                                            ' '+izquierdaSinErupcionar+' '+izquierdaEndoRealizada+' '+izquierdaEndoIndicada+' '+izquierdaSellantePresente+' '+izquierdaSellanteIndicado+' '+izquierdaErosion+
                                            ' '+izquierdaProceRealizado+' '+izquierdaCoronaBE+' '+izquierdaCoronaME+' '+izquierdaProvBE+' '+izquierdaProvME+' '+izquierdaNucleoBE+' '+
                                            ' '+izquierdaNucleoME+' '+izquierdaRemovibleBE+' '+izquierdaRemovibleME+' '+izquierdaImplante+' '+ izquierdaPlaca +
                                            ' ">' +
                                        '<input type="hidden" id="izquierda" value="7'+a+'"/>' +
                                    '</div>' +
                                    '<div id="bleche7' + a + '" class="cuadro-leche debajo-leche click ' + abajoCariado + ' '+abajoObturado+' '+abajoExoRealizada+' '+abajoExoSimple+' '+abajoExoQuirurgica +
                                            ' '+abajoSinErupcionar+' '+abajoEndoRealizada+' '+abajoEndoIndicada+' '+abajoSellantePresente+' '+abajoSellanteIndicado+' '+abajoErosion+
                                            ' '+abajoProceRealizado+' '+abajoCoronaBE+' '+abajoCoronaME+' '+abajoProvBE+' '+izquierdaProvME+' '+abajoNucleoBE+' '+
                                            ' '+abajoNucleoME+' '+abajoRemovibleBE+' '+abajoRemovibleME+' '+abajoImplante+' '+ abajoPlaca +
                                            ' ">' +
                                        '<input type="hidden" id="abajo" value="7'+a+'"/>' +
                                    '</div>' +
                                    '<div id="rleche7' + a + '" class="cuadro-leche derecha-leche click click ' + derechaCariado + ' '+derechaObturado+' '+derechaExoRealizada+' '+derechaExoSimple+' '+derechaExoQuirurgica +
                                            ' '+derechaSinErupcionar+' '+derechaEndoRealizada+' '+derechaEndoIndicada+' '+derechaSellantePresente+' '+derechaSellanteIndicado+' '+derechaErosion+
                                            ' '+derechaProceRealizado+' '+derechaCoronaBE+' '+derechaCoronaME+' '+derechaProvBE+' '+derechaProvME+' '+derechaNucleoBE+' '+
                                            ' '+derechaNucleoME+' '+derechaRemovibleBE+' '+derechaRemovibleME+' '+derechaImplante+' '+ derechaPlaca +
                                            ' ">' +
                                        '<input type="hidden" id="derecha" value="7'+a+'"/>' +
                                    '</div>' +
                                    '<div id="cleche7' + a + '" class="centro-leche click ' + centroCariado + ' '+centroObturado+' '+centroExoRealizada+' '+centroExoSimple+' '+centroExoQuirurgica +
                                            ' '+centroSinErupcionar+' '+centroEndoRealizada+' '+centroEndoIndicada+' '+centroSellantePresente+' '+centroSellanteIndicado+' '+centroErosion+
                                            ' '+centroProceRealizado+' '+centroCoronaBE+' '+centroCoronaME+' '+centroProvBE+' '+centroProvME+' '+centroNucleoBE+' '+
                                            ' '+centroNucleoME+' '+centroRemovibleBE+' '+centroRemovibleME+' '+centroImplante+' '+ centroPlaca +
                                            ' ">' +
                                        '<input type="hidden" id="centro" value="7'+a+'"/>' +
                                    '</div>' +
                                    '</div>';
                        }
                        a++;
                    }

                    $("#tr").append(htmlRight);
                    $("#tl").append(htmlLeft);
                    $("#tlr").append(htmlLecheRight);
                    $("#tll").append(htmlLecheLeft);


                    $("#bl").append(htmlLeft2);
                    $("#br").append(htmlRight2);
                    $("#bll").append(htmlLecheLeft2);
                    $("#blr").append(htmlLecheRight2);
                }
                //var arrayPuente = [];
                $(document).ready(function () {
                    createOdontogram();
                    $(".click").click(function (event) {
                        var control = $("#controls").children().find('.active').attr('id');
                        var cuadro = $(this).find("input[name=cuadro]:hidden").val();
                        var ubicacion = $(this).children().attr('id');
                        var diente = $(this).children().val();
                        console.log("ubicación -> "+ubicacion + " val -> " + diente);
                        console.log($(this).attr('id'));
                        switch (control) {
                            case "cariado":
                                if ($(this).hasClass("click-white")) {
                                    $(this).removeClass('click-white');
                                    $(this).addClass('click-red');                                                                                
                                } else {
                                    if ($(this).hasClass("click-red")) {
                                        $(this).removeClass("click-red");                                                                                    
                                    } else {
                                        $(this).addClass('click-red');                                                                                    
                                    }
                                }
                                meterEnOdontograma(diente, ubicacion, control, 'NO');
                                break;
                            case "obturado":
                                if ($(this).hasClass("click-white")) {
                                    $(this).removeClass('click-white');
                                    $(this).addClass('click-blue');
                                } else {
                                    if ($(this).hasClass("click-blue")) {
                                        $(this).removeClass("click-blue");
                                    } else {
                                        $(this).addClass('click-blue');
                                    }
                                }
                                meterEnOdontograma(diente, ubicacion, control, 'NO');
                                break;
                            case "exodonciarealizada":
                                var dientePosition = $(this).position();
                                console.log($(this));
                                console.log(dientePosition);
                                $(this).parent().children().each(function (index, el) {
                                    if ($(el).hasClass("click")) {
                                        if ($(el).hasClass("click-gray")) {
                                            $(el).removeClass('click-gray');
                                        }else {                                                                                    
                                            $(el).addClass("click-gray");
                                        }
                                    }
                                });
                                meterEnOdontograma(diente, ubicacion, control, 'SI');
                                break;
                            case "exodonciasimpleindicada":
                                var dientePosition = $(this).position();
                                console.log(dientePosition);
                                $(this).parent().children().each(function (index, el) {                                                                                
                                    if ($(el).hasClass("click-blue-border")) {
                                        $(el).removeClass('click-blue-border');
                                    }else {
                                        if ($(el).hasClass("cuadro") || $(el).hasClass("cuadro-leche")) {
                                            $(el).addClass("click-blue-border");
                                        }                                                                                    
                                    }
                                });
                                meterEnOdontograma(diente, ubicacion, control, 'SI');
                                break;
                            case "exodonciaquirrugicaindicada":
                                var dientePosition = $(this).position();
                                console.log(dientePosition);
                                $(this).parent().children().each(function (index, el) {
                                    if ($(el).hasClass("click-red-border")) {
                                        $(el).removeClass('click-red-border');
                                    }else {
                                        if ($(el).hasClass("cuadro") || $(el).hasClass("cuadro-leche")) {
                                            $(el).addClass("click-red-border");
                                        }                                                                                    
                                    }
                                });
                                meterEnOdontograma(diente, ubicacion, control, 'SI');
                                break;
                            case "sinerupcionar":
                                var dientePosition = $(this).position();
                                console.log($(this));
                                console.log(dientePosition)
                                $(this).parent().children().each(function (index, el) { 
                                    if ($(el).hasClass("click")) {
                                        if ($(el).hasClass("click-erupcionar")) {
                                            $(el).removeClass('click-erupcionar');
                                        }else {                                                                                    
                                            $(el).addClass("click-erupcionar");                                                                                    
                                        }
                                    }
                                });
                                meterEnOdontograma(diente, ubicacion, control, 'SI');
                                break;
                            case "endodonciarealizada":
                                var dientePosition = $(this).position();
                                console.log($(this))
                                console.log(dientePosition)
                                $(this).parent().children().each(function (index, el) {   
                                    if ($(el).hasClass("click")) {
                                        if ($(el).hasClass("click-endo")) {
                                            $(el).removeClass('click-endo');
                                        }else {                                                                                    
                                            $(el).addClass("click-endo");                                                                                    
                                        }
                                    }
                                });
                                meterEnOdontograma(diente, ubicacion, control, 'SI');
                                break;
                            case "endodonciaindicada":
                                var dientePosition = $(this).position();
                                console.log(dientePosition);
                                $(this).parent().children().each(function (index, el) {
                                    if ($(el).hasClass("click-marron-border")) {
                                        $(el).removeClass('click-marron-border');
                                    }else {
                                        if ($(el).hasClass("cuadro") || $(el).hasClass("cuadro-leche")) {
                                            $(el).addClass("click-marron-border");
                                        }                                                                                    
                                    }
                                });
                                meterEnOdontograma(diente, ubicacion, control, 'SI');
                                break;
                            case "sellantepresente":
                                if ($(this).hasClass("click-white")) {
                                    $(this).removeClass("click-white");
                                    $(this).addClass("click-sellantep");
                                } else {
                                    if ($(this).hasClass("click-sellantep")) {
                                        $(this).removeClass("click-sellantep");
                                    } else {
                                        $(this).addClass('click-sellantep');
                                    }
                                }
                                meterEnOdontograma(diente, ubicacion, control, 'NO');
                                break;
                            case "sellanteindicado":
                                if ($(this).hasClass("click-white")) {
                                    $(this).removeClass("click-white");
                                    $(this).addClass("click-sellantei");
                                } else {
                                    if ($(this).hasClass("click-sellantei")) {
                                        $(this).removeClass("click-sellantei");
                                    } else {
                                        $(this).addClass('click-sellantei');
                                    }
                                }
                                meterEnOdontograma(diente, ubicacion, control, 'NO');
                                break;
                            case "erosion":
                                if ($(this).hasClass("click-white")) {
                                    $(this).removeClass("click-white");
                                    $(this).addClass("click-erosion");
                                } else {
                                    if ($(this).hasClass("click-erosion")) {
                                        $(this).removeClass("click-erosion");
                                    } else {
                                        $(this).addClass('click-erosion');
                                    }
                                }
                                meterEnOdontograma(diente, ubicacion, control, 'NO');
                                break;
                            case "procedimientorealizado":
                                var dientePosition = $(this).position();
                                console.log($(this))
                                console.log(dientePosition)
                                $(this).parent().children().each(function (index, el) {                                                                                                                                                              
                                    if ($(el).hasClass("click-proce")) {
                                        $(el).removeClass('click-proce');
                                    }else {                                                                                    
                                        $(el).addClass("click-proce");                                                                                    
                                    }
                                });
                                meterEnOdontograma(diente, ubicacion, control, 'SI');
                                break;
                            case "coronabuenestado":
                                if ($(this).hasClass("click-white")) {
                                    $(this).removeClass("click-white");
                                    $(this).addClass("click-corobuen");
                                } else {
                                    if ($(this).hasClass("click-corobuen")) {
                                        $(this).removeClass("click-corobuen");
                                    } else {
                                        $(this).addClass('click-corobuen');
                                    }
                                }
                                meterEnOdontograma(diente, ubicacion, control, 'NO');
                                break;
                            case "coronamalestado":
                                if ($(this).hasClass("click-white")) {
                                    $(this).removeClass("click-white");
                                    $(this).addClass("click-coromal");
                                } else {
                                    if ($(this).hasClass("click-coromal")) {
                                        $(this).removeClass("click-coromal");
                                    } else {
                                        $(this).addClass('click-coromal');
                                    }
                                }
                                meterEnOdontograma(diente, ubicacion, control, 'NO');
                                break;
                            case "provisionalbuenestado":
                                var dientePosition = $(this).position();
                                console.log($(this))
                                console.log(dientePosition)
                                $(this).parent().children().each(function (index, el) {                                                                                
                                    if ($(el).hasClass("click")) {
                                        if ($(el).hasClass("click-probuen")) {
                                            $(el).removeClass('click-probuen');
                                        }else {                                                                                    
                                            $(el).addClass("click-probuen");                                                                                    
                                        }
                                    }
                                });
                                meterEnOdontograma(diente, ubicacion, control, 'SI');
                                break;
                            case "provisionalmalestado":
                                var dientePosition = $(this).position();
                                console.log($(this))
                                console.log(dientePosition)
                                $(this).parent().children().each(function (index, el) {                                                                                
                                    if ($(el).hasClass("click")) {
                                        if ($(el).hasClass("click-promal")) {
                                            $(el).removeClass('click-promal');
                                        }else {                                                                                    
                                            $(el).addClass("click-promal");                                                                                    
                                        }
                                    }
                                });
                                meterEnOdontograma(diente, ubicacion, control, 'SI');
                                break;
                            case "nucleobuenestado":
                                if ($(this).hasClass("click-white")) {
                                    $(this).removeClass("click-white");
                                    $(this).addClass("click-nuclebuen");
                                } else {
                                    if ($(this).hasClass("click-nuclebuen")) {
                                        $(this).removeClass("click-nuclebuen");
                                    } else {
                                        $(this).addClass('click-nuclebuen');
                                    }
                                }
                                meterEnOdontograma(diente, ubicacion, control, 'NO');
                                break;
                            case "nucleomalestado":
                                if ($(this).hasClass("click-white")) {
                                    $(this).removeClass("click-white");
                                    $(this).addClass("click-nuclemal");
                                } else {
                                    if ($(this).hasClass("click-nuclemal")) {
                                        $(this).removeClass("click-nuclemal");
                                    } else {
                                        $(this).addClass('click-nuclemal');
                                    }
                                }
                                meterEnOdontograma(diente, ubicacion, control, 'NO');
                                break;
                            case "removiblebuenestado":
                                var dientePosition = $(this).position();
                                console.log($(this));
                                console.log(dientePosition);
                                $(this).parent().children().each(function (index, el) {                                                                                
                                    if ($(el).hasClass("click")) {
                                        if ($(el).hasClass("click-remobuen")) {
                                            $(el).removeClass('click-remobuen');
                                        }else {                                                                                    
                                            $(el).addClass("click-remobuen");                                                                                    
                                        }
                                    }
                                });
                                meterEnOdontograma(diente, ubicacion, control, 'SI');
                                break;
                            case "removiblemalestado":
                                var dientePosition = $(this).position();
                                console.log($(this))
                                console.log(dientePosition)
                                $(this).parent().children().each(function (index, el) {                                                                                
                                    if ($(el).hasClass("click")) {
                                        if ($(el).hasClass("click-remomal")) {
                                            $(el).removeClass('click-remomal');
                                        }else {                                                                                    
                                            $(el).addClass("click-remomal");                                                                                    
                                        }
                                    }
                                });
                                meterEnOdontograma(diente, ubicacion, control, 'SI');
                                break;
                            case "implante":
                                var dientePosition = $(this).position();
                                console.log($(this))
                                console.log(dientePosition)
                                $(this).parent().children().each(function (index, el) {                                                                                
                                    if ($(el).hasClass("click")) {
                                        if ($(el).hasClass("click-implante")) {
                                            $(el).removeClass('click-implante');
                                        }else {                                                                                    
                                            $(el).addClass("click-implante");                                                                                    
                                        }
                                    }
                                });
                                meterEnOdontograma(diente, ubicacion, control, 'SI');
                                break;
                            case "placa":
                                var dientePosition = $(this).position();
                                if ($(this).hasClass("click-white")) {
                                    $(this).removeClass('click-white');
                                    $(this).addClass('click-green');
                                } else {
                                    $(this).addClass('click-green');
                                }
                                meterEnOdontograma(diente, ubicacion, control, 'NO');
                                break;
                            case "limpiar":
                                if ($(this).hasClass("click-red")) {
                                    $(this).removeClass("click-red");
                                    $(this).addClass("click-white");
                                } else {
                                    if ($(this).hasClass("click-blue")) {
                                        $(this).removeClass("click-blue");
                                        $(this).addClass("click-white");
                                    } else {
                                        if ($(this).hasClass("click-green")) {
                                            $(this).removeClass("click-green");
                                            $(this).addClass("click-white");
                                        } else {
                                            if ($(this).hasClass("click-gray")) {
                                                $(this).removeClass("click-gray");
                                                $(this).addClass("click-white");
                                            } else {
                                                if ($(this).hasClass("click-erupcionar")) {
                                                    $(this).removeClass("click-erupcionar");
                                                    $(this).addClass("click-white");
                                                } else {
                                                    if ($(this).hasClass("click-endo")) {
                                                        $(this).removeClass("click-endo");
                                                        $(this).addClass("click-white");
                                                    } else {
                                                        if ($(this).hasClass("click-proce")) {
                                                            $(this).removeClass("click-proce");
                                                            $(this).addClass("click-white");
                                                        } else {
                                                            if ($(this).hasClass("click-probuen")) {
                                                                $(this).removeClass("click-probuen");
                                                                $(this).addClass("click-white");
                                                            } else {
                                                                if ($(this).hasClass("click-promal")) {
                                                                    $(this).removeClass("click-promal");
                                                                    $(this).addClass("click-white");
                                                                } else {
                                                                    if ($(this).hasClass("click-implante")) {
                                                                        $(this).removeClass("click-implante");
                                                                        $(this).addClass("click-white");
                                                                    } else {
                                                                        if ($(this).hasClass("click-remobuen")) {
                                                                            $(this).removeClass("click-remobuen");
                                                                            $(this).addClass("click-white");
                                                                        } else {
                                                                            if ($(this).hasClass("click-remomal")) {
                                                                                $(this).removeClass("click-remomal");
                                                                                $(this).addClass("click-white");
                                                                            } else {
                                                                                if ($(this).hasClass("click-sellantep")) {
                                                                                    $(this).removeClass("click-sellantep");
                                                                                    $(this).addClass("click-white");
                                                                                } else {
                                                                                    if ($(this).hasClass("click-sellantei")) {
                                                                                        $(this).removeClass("click-sellantei");
                                                                                        $(this).addClass("click-white");
                                                                                    } else {
                                                                                        if ($(this).hasClass("click-erosion")) {
                                                                                            $(this).removeClass("click-erosion");
                                                                                            $(this).addClass("click-white");
                                                                                        } else {
                                                                                            if ($(this).hasClass("click-corobuen")) {
                                                                                                $(this).removeClass("click-corobuen");
                                                                                                $(this).addClass("click-white");
                                                                                            } else {
                                                                                                if ($(this).hasClass("click-coromal")) {
                                                                                                    $(this).removeClass("click-coromal");
                                                                                                    $(this).addClass("click-white");
                                                                                                } else {
                                                                                                    if ($(this).hasClass("click-nuclebuen")) {
                                                                                                        $(this).removeClass("click-nuclebuen");
                                                                                                        $(this).addClass("click-white");
                                                                                                    } else {
                                                                                                        if ($(this).hasClass("click-nuclemal")) {
                                                                                                            $(this).removeClass("click-nuclemal");
                                                                                                            $(this).addClass("click-white");
                                                                                                        }
                                                                                                    }
                                                                                                }
                                                                                            }
                                                                                        }
                                                                                    }
                                                                                }
                                                                            }
                                                                        }
                                                                    }
                                                                }
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            default:
                                console.log("borrar case");
                        }
                        return false;
                    });
                    return false;
                });
        </script>
