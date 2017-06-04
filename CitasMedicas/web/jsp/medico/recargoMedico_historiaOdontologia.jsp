<%-- 
    Document   : recargoMedico_historiaOdontologia
    Created on : 18/04/2017, 10:39:46 PM
    Author     : LEGADO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
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

            .click-blue {
                background-color: blue !important;
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
        <title>JSP Page</title>
    </head>
    <body>

        <div class="col-md-12">
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
                                <li><a href="#anamnesis" data-toggle="tab">ANAMNESIS |</a></li>
                                <li><a href="#examenes" data-toggle="tab">EXAMENES: ESTOMATOLOGICO-TEJIDOS BALNDOS-HALLAZGOS |</a></li>
                                <li><a href="#protesiss" data-toggle="tab">PROTESIS |</a></li>
                                <li><a href="#atm" data-toggle="tab">ANALISIS A.T.M. |</a></li>
                                <li><a href="#placa" data-toggle="tab">CONTROL PLACA |</a></li>
                                <li><a href="#odontograma" data-toggle="tab">ODONTOGRAMA |</a></li>
                                <li><a href="#final" data-toggle="tab">LECTURA RX - DIAGNOSTICO - PLAN DE TRATAMIENTO |</a></li>
                            </ul>
                            <form action="">
                                <%

                                %>
                                <div id="myTabContent" class="tab-content">
                                    <div class="tab-pane active" id="datosIdentificacion">
                                        <div class="panel-body">
                                            <table class="table table-responsive">
                                                <tbody>
                                                    <tr>
                                                        <td>Nombre <input type="text" class="form-control" value="" disabled /> </td>
                                                        <td>Sexo <input type="text" class="form-control" value="" disabled /> </td>
                                                    </tr>
                                                    <tr>
                                                        <td>Fecha de nacimiento <input type="text" class="form-control" value="" disabled /> </td>
                                                        <td>Edad <input type="text" class="form-control" value="" disabled /> </td>
                                                    </tr>
                                                    <tr>
                                                        <td>Direccion <input type="text" class="form-control" value="" disabled /> </td>
                                                        <td>Identificacion <input type="text" class="form-control" value="" disabled /> </td>
                                                    </tr>
                                                    <tr>
                                                        <td>Telefono <input type="text" class="form-control" value="" disabled /> </td>
                                                        <td>Ocupacion <input type="text" class="form-control" value="" disabled /> </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                    <div class="tab-pane" id="anamnesis">
                                        <div class="panel-body">
                                            <table class="table table-responsive">
                                                <tr>
                                                    <td>Motivo de Consulta</td>
                                                    <td colspan="5"> <textarea class="form-control" name="motivo"></textarea> </td>
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
                                                    <td> <input type="radio" name="alergia" value="Si" /> </td>
                                                    <td> <input type="radio" name="alergia" value="No"/> </td>
                                                    <td>9. HIV</td>
                                                    <td> <input type="radio" name="hiv" value="Si" /> </td>
                                                    <td> <input type="radio" name="hiv" value="No" /> </td>
                                                </tr>
                                                <tr>
                                                    <td>2. Hemorragias</td>
                                                    <td> <input type="radio" name="hemorragia" value="Si" /> </td>
                                                    <td> <input type="radio" name="hemorragia" value="No" /> </td>
                                                    <td>10. Cirugias (incluso orales)</td>
                                                    <td> <input type="radio" name="cirugia" value="Si" /></td>
                                                    <td> <input type="radio" name="cirugia" value="No" /> </td>
                                                </tr>
                                                <tr>
                                                    <td>3. Radioterapias</td>
                                                    <td> <input type="radio" name="radioterapia" value="Si" /> </td>
                                                    <td> <input type="radio" name="radioterapia" value="No" /> </td>
                                                    <td>11. Exodoncias</td>
                                                    <td> <input type="radio" name="exodoncia" value="Si" /> </td>
                                                    <td> <input type="radio" name="exodoncia" value="No" /> </td>
                                                </tr>
                                                <tr>
                                                    <td>4. Hipertension</td>
                                                    <td> <input type="radio" name="hipertension" value="Si" /></td>
                                                    <td> <input type="radio" name="hipertension" value="No" /> </td>
                                                    <td>12. Hepatitis</td>
                                                    <td> <input type="radio" name="hepatitis" value="Si" /> </td>
                                                    <td> <input type="radio" name="hepatitis" value="No" /> </td>
                                                </tr>
                                                <tr>
                                                    <td>5. Diabetes</td>
                                                    <td> <input type="radio" name="diabetes" value="Si" /> </td>
                                                    <td> <input type="radio" name="diabetes" value="No" /> </td>
                                                    <td>13. Patologias respiratorias</td>
                                                    <td> <input type="radio" name="pato_respi" value="Si" /> </td>
                                                    <td> <input type="radio" name="pato_respi" value="No" /> </td>
                                                </tr>
                                                <tr>
                                                    <td>6. Tratamiento Medico actual</td>
                                                    <td> <input type="radio" name="trata_med_actual" value="Si" /> </td>
                                                    <td> <input type="radio" name="trata_med_actual" value="No" /> </td>
                                                    <td>14. Convulsiones</td>
                                                    <td> <input type="radio" name="convulsion" value="Si" /> </td>
                                                    <td> <input type="radio" name="convulsion" value="No" /> </td>
                                                </tr>
                                                <tr>
                                                    <td>7. Toma de medicamentos</td>
                                                    <td> <input type="radio" name="toma_medicam" value="Si" /> </td>
                                                    <td> <input type="radio" name="toma_medicam" value="No" /> </td>
                                                    <td>15. Enfermedades orales</td>
                                                    <td> <input type="radio" name="enfer_orales" value="Si" /> </td>
                                                    <td> <input type="radio" name="enfer_orales" value="No" /> </td>
                                                </tr>
                                                <tr>
                                                    <td>8. Embarazo</td>
                                                    <td> <input type="radio" name="embarazo" value="Si" /> </td>
                                                    <td> <input type="radio" name="embarazo" value="No" /> </td>
                                                    <td>16. Enfermedades gastricas</td>
                                                    <td> <input type="radio" name="enfer_gastrica" value="Si" /> </td>
                                                    <td> <input type="radio" name="enfer_gastrica" value="No" /> </td>
                                                </tr>
                                                <tr>
                                                    <td>Observaciones</td>
                                                    <td colspan="5"> <input type="text" name="obser_anamnesis" class="form-control" /> </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                    <div class="tab-pane" id="examenes">
                                        <div class="panel-body">
                                            <table class="table table-responsive">
                                                <tr>
                                                    <td>1. Labios</td>
                                                    <td> <input type="text" class="form-control" name="labios" /> </td>
                                                    <td>2. Lengua</td>
                                                    <td> <input type="text" class="form-control" name="lengua" /> </td>
                                                </tr>
                                                <tr>
                                                    <td>3. Carrillos</td>
                                                    <td> <input type="text" class="form-control" name="carrillos" /> </td>
                                                    <td>4. Piso de boca</td>
                                                    <td> <input type="text" class="form-control" name="piso_boca" /> </td>
                                                </tr>
                                                <tr>
                                                    <td>5. Paladar</td>
                                                    <td> <input type="text" class="form-control" name="paladar" /> </td>
                                                    <td>6. Frenillos</td>
                                                    <td> <input type="text" class="form-control" name="frenillos" /> </td>
                                                </tr>
                                                <tr>
                                                    <td>Observaciones</td>
                                                    <td colspan="3"> <input type="text" class="form-control" name="obser_exam" /> </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                    <div class="tab-pane" id="protesiss">
                                        <div class="panel-body">
                                            <table class="table table-responsive">
                                                <tr>
                                                    <td>Presencia de Protesis</td>
                                                    <td>
                                                        <input type="radio" name="presen_protesis" value="Si" onclick="descrip.disabled = false" />Si
                                                        <input type="radio" name="presen_protesis" value="No" onclick="descrip.disabled = true"/>No
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>Descripción</td>
                                                    <td>
                                                        <input type="text" class="form-control" name="descrip" disabled="" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>Higiene oral</td>
                                                    <td>
                                                        B <input type="radio" name="higiene" value="Buena" /> &nbsp;&nbsp;
                                                        R <input type="radio" name="higiene" value="Regular" />&nbsp;&nbsp;
                                                        M <input type="radio" name="higiene" value="Mala" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>Frecuencia Cepillado</td>
                                                    <td>
                                                        1 <input type="radio" name="fr_cepill" value="1" /> &nbsp;&nbsp;
                                                        2 <input type="radio" name="fr_cepill" value="2" />&nbsp;&nbsp;
                                                        3 <input type="radio" name="fr_cepill" value="3" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>Seda dental</td>
                                                    <td>
                                                        <input type="radio" name="presen_protesis" value="Si" />Si
                                                        <input type="radio" name="presen_protesis" value="No" />No
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                    <div class="tab-pane" id="atm">
                                        <div class="panel-body">
                                            <table class="table table-responsive">
                                                <tr>
                                                    <td>1. Dolor muscular</td>
                                                    <td>
                                                        Si <input type="radio" name="dolor_muscular" value="Si" />
                                                        No <input type="radio" name="dolor_muscular" value="No" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>2. Dolor articular</td>
                                                    <td>
                                                        Si <input type="radio" name="dolor_articular" value="Si" />
                                                        No <input type="radio" name="dolor_articular" value="No" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>3. Ruido articular</td>
                                                    <td>
                                                        Si <input type="radio" name="ruido_articular" value="Si" />
                                                        No <input type="radio" name="ruido_articular" value="No" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>4. Limitación del movimiento</td>
                                                    <td>
                                                        Si <input type="radio" name="limit_mov" value="Si" />
                                                        No <input type="radio" name="limit_mov" value="No" />
                                                        <input type="text" class="form-control" name="limit_mov" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>Observaciones</td>
                                                    <td><input type="text" class="form-control" name="obser_atm" /></td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                    <div class="tab-pane" id="placa">
                                        <div class="panel-body">
                                            <div class="row">
                                                <div class="diente"><!--diente 18-->
                                                    <input name="valor" type="hidden" value="1"><span style="margin-left: -15px">18</span>
                                                    <div class="cuadro click"><input name="cuadro" type="hidden" value="1"></div>
                                                    <div class="cuadro izquierdo click"><input name="cuadro" type="hidden" value="2"></div>
                                                    <div class="cuadro debajo click"><input name="cuadro" type="hidden" value="3"></div>
                                                    <div class="cuadro derecha click"><input name="cuadro" type="hidden" value="hola"></div>
                                                    <div class="centro click"><input name="cuadro" type="hidden" value="5"></div>
                                                </div>
                                                <div class="diente"><!--diente 17-->
                                                    <input name="valor" type="hidden" value="1"><span style="margin-left: -15px">17</span>
                                                    <div class="cuadro click"><input name="cuadro" type="hidden" value="1"></div>
                                                    <div class="cuadro izquierdo click"><input name="cuadro" type="hidden" value="2"></div>
                                                    <div class="cuadro debajo click"><input name="cuadro" type="hidden" value="3"></div>
                                                    <div class="cuadro derecha click"><input name="cuadro" type="hidden" value="hola"></div>
                                                    <div class="centro click"><input name="cuadro" type="hidden" value="5"></div>
                                                </div>
                                                <div class="diente"><!--diente 16-->
                                                    <input name="valor" type="hidden" value="1"><span style="margin-left: -15px">16</span>
                                                    <div class="cuadro click"><input name="cuadro" type="hidden" value="1"></div>
                                                    <div class="cuadro izquierdo click"><input name="cuadro" type="hidden" value="2"></div>
                                                    <div class="cuadro debajo click"><input name="cuadro" type="hidden" value="3"></div>
                                                    <div class="cuadro derecha click"><input name="cuadro" type="hidden" value="hola"></div>
                                                    <div class="centro click"><input name="cuadro" type="hidden" value="5"></div>
                                                </div>
                                                <div class="diente"><!--diente 15-->
                                                    <input name="valor" type="hidden" value="1"><span style="margin-left: -25px">15/55</span>
                                                    <div class="cuadro click"><input name="cuadro" type="hidden" value="1"></div>
                                                    <div class="cuadro izquierdo click"><input name="cuadro" type="hidden" value="2"></div>
                                                    <div class="cuadro debajo click"><input name="cuadro" type="hidden" value="3"></div>
                                                    <div class="cuadro derecha click"><input name="cuadro" type="hidden" value="hola"></div>
                                                    <div class="centro click"><input name="cuadro" type="hidden" value="5"></div>
                                                </div>
                                                <div class="diente"><!--diente 14-->
                                                    <input name="valor" type="hidden" value="1"><span style="margin-left: -25px">14/54</span>
                                                    <div class="cuadro click"><input name="cuadro" type="hidden" value="1"></div>
                                                    <div class="cuadro izquierdo click"><input name="cuadro" type="hidden" value="2"></div>
                                                    <div class="cuadro debajo click"><input name="cuadro" type="hidden" value="3"></div>
                                                    <div class="cuadro derecha click"><input name="cuadro" type="hidden" value="hola"></div>
                                                    <div class="centro click"><input name="cuadro" type="hidden" value="5"></div>
                                                </div>
                                                <div class="diente"><!--diente 13-->
                                                    <input name="valor" type="hidden" value="1"><span style="margin-left: -25px">13/53</span>
                                                    <div class="cuadro click"><input name="cuadro" type="hidden" value="1"></div>
                                                    <div class="cuadro izquierdo click"><input name="cuadro" type="hidden" value="2"></div>
                                                    <div class="cuadro debajo click"><input name="cuadro" type="hidden" value="3"></div>
                                                    <div class="cuadro derecha click"><input name="cuadro" type="hidden" value="hola"></div>
                                                    <div class="centro click"><input name="cuadro" type="hidden" value="5"></div>
                                                </div>
                                                <div class="diente"><!--diente 12-->
                                                    <input name="valor" type="hidden" value="1"><span style="margin-left: -25px">12/52</span>
                                                    <div class="cuadro click"><input name="cuadro" type="hidden" value="1"></div>
                                                    <div class="cuadro izquierdo click"><input name="cuadro" type="hidden" value="2"></div>
                                                    <div class="cuadro debajo click"><input name="cuadro" type="hidden" value="3"></div>
                                                    <div class="cuadro derecha click"><input name="cuadro" type="hidden" value="hola"></div>
                                                    <div class="centro click"><input name="cuadro" type="hidden" value="5"></div>
                                                </div>
                                                <div class="diente"><!--diente 11-->
                                                    <input name="valor" type="hidden" value="1"><span style="margin-left: -25px">11/51</span>
                                                    <div class="cuadro click"><input name="cuadro" type="hidden" value="1"></div>
                                                    <div class="cuadro izquierdo click"><input name="cuadro" type="hidden" value="2"></div>
                                                    <div class="cuadro debajo click"><input name="cuadro" type="hidden" value="3"></div>
                                                    <div class="cuadro derecha click"><input name="cuadro" type="hidden" value="hola"></div>
                                                    <div class="centro click"><input name="cuadro" type="hidden" value="5"></div>
                                                </div>
                                                <div class="diente"><!--diente 21-->
                                                    <input name="valor" type="hidden" value="1"><span style="margin-left: -25px">21/61</span>
                                                    <div class="cuadro click"><input name="cuadro" type="hidden" value="1"></div>
                                                    <div class="cuadro izquierdo click"><input name="cuadro" type="hidden" value="2"></div>
                                                    <div class="cuadro debajo click"><input name="cuadro" type="hidden" value="3"></div>
                                                    <div class="cuadro derecha click"><input name="cuadro" type="hidden" value="hola"></div>
                                                    <div class="centro click"><input name="cuadro" type="hidden" value="5"></div>
                                                </div>
                                                <div class="diente"><!--diente 22-->
                                                    <input name="valor" type="hidden" value="1"><span style="margin-left: -25px">22/62</span>
                                                    <div class="cuadro click"><input name="cuadro" type="hidden" value="1"></div>
                                                    <div class="cuadro izquierdo click"><input name="cuadro" type="hidden" value="2"></div>
                                                    <div class="cuadro debajo click"><input name="cuadro" type="hidden" value="3"></div>
                                                    <div class="cuadro derecha click"><input name="cuadro" type="hidden" value="hola"></div>
                                                    <div class="centro click"><input name="cuadro" type="hidden" value="5"></div>
                                                </div>
                                                <div class="diente"><!--diente 23-->
                                                    <input name="valor" type="hidden" value="1"><span style="margin-left: -25px">23/63</span>
                                                    <div class="cuadro click"><input name="cuadro" type="hidden" value="1"></div>
                                                    <div class="cuadro izquierdo click"><input name="cuadro" type="hidden" value="2"></div>
                                                    <div class="cuadro debajo click"><input name="cuadro" type="hidden" value="3"></div>
                                                    <div class="cuadro derecha click"><input name="cuadro" type="hidden" value="hola"></div>
                                                    <div class="centro click"><input name="cuadro" type="hidden" value="5"></div>
                                                </div>
                                                <div class="diente"><!--diente 24-->
                                                    <input name="valor" type="hidden" value="1"><span style="margin-left: -25px">24/64</span>
                                                    <div class="cuadro click"><input name="cuadro" type="hidden" value="1"></div>
                                                    <div class="cuadro izquierdo click"><input name="cuadro" type="hidden" value="2"></div>
                                                    <div class="cuadro debajo click"><input name="cuadro" type="hidden" value="3"></div>
                                                    <div class="cuadro derecha click"><input name="cuadro" type="hidden" value="hola"></div>
                                                    <div class="centro click"><input name="cuadro" type="hidden" value="5"></div>
                                                </div>
                                                <div class="diente"><!--diente 25-->
                                                    <input name="valor" type="hidden" value="1"><span style="margin-left: -25px">25/65</span>
                                                    <div class="cuadro click"><input name="cuadro" type="hidden" value="1"></div>
                                                    <div class="cuadro izquierdo click"><input name="cuadro" type="hidden" value="2"></div>
                                                    <div class="cuadro debajo click"><input name="cuadro" type="hidden" value="3"></div>
                                                    <div class="cuadro derecha click"><input name="cuadro" type="hidden" value="hola"></div>
                                                    <div class="centro click"><input name="cuadro" type="hidden" value="5"></div>
                                                </div>
                                                <div class="diente"><!--diente 26-->
                                                    <input name="valor" type="hidden" value="1"><span style="margin-left: -15px">26</span>
                                                    <div class="cuadro click"><input name="cuadro" type="hidden" value="1"></div>
                                                    <div class="cuadro izquierdo click"><input name="cuadro" type="hidden" value="2"></div>
                                                    <div class="cuadro debajo click"><input name="cuadro" type="hidden" value="3"></div>
                                                    <div class="cuadro derecha click"><input name="cuadro" type="hidden" value="hola"></div>
                                                    <div class="centro click"><input name="cuadro" type="hidden" value="5"></div>
                                                </div>
                                                <div class="diente"><!--diente 27-->
                                                    <input name="valor" type="hidden" value="1"><span style="margin-left: -15px">27</span>
                                                    <div class="cuadro click"><input name="cuadro" type="hidden" value="1"></div>
                                                    <div class="cuadro izquierdo click"><input name="cuadro" type="hidden" value="2"></div>
                                                    <div class="cuadro debajo click"><input name="cuadro" type="hidden" value="3"></div>
                                                    <div class="cuadro derecha click"><input name="cuadro" type="hidden" value="hola"></div>
                                                    <div class="centro click"><input name="cuadro" type="hidden" value="5"></div>
                                                </div>
                                                <div class="diente"><!--diente 28-->
                                                    <input name="valor" type="hidden" value="1"><span style="margin-left: -15px">28</span>
                                                    <div class="cuadro click"><input name="cuadro" type="hidden" value="1"></div>
                                                    <div class="cuadro izquierdo click"><input name="cuadro" type="hidden" value="2"></div>
                                                    <div class="cuadro debajo click"><input name="cuadro" type="hidden" value="3"></div>
                                                    <div class="cuadro derecha click"><input name="cuadro" type="hidden" value="hola"></div>
                                                    <div class="centro click"><input name="cuadro" type="hidden" value="5"></div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="diente"><!--diente 48-->
                                                    <input name="valor" type="hidden" value="1"><span style="margin-left: -15px">48</span>
                                                    <div class="cuadro click"><input name="cuadro" type="hidden" value="1"></div>
                                                    <div class="cuadro izquierdo click"><input name="cuadro" type="hidden" value="2"></div>
                                                    <div class="cuadro debajo click"><input name="cuadro" type="hidden" value="3"></div>
                                                    <div class="cuadro derecha click"><input name="cuadro" type="hidden" value="hola"></div>
                                                    <div class="centro click"><input name="cuadro" type="hidden" value="5"></div>
                                                </div>
                                                <div class="diente"><!--diente 47--><span style="margin-left: -15px">47</span>
                                                    <input name="valor" type="hidden" value="1">
                                                    <div class="cuadro click"><input name="cuadro" type="hidden" value="1"></div>
                                                    <div class="cuadro izquierdo click"><input name="cuadro" type="hidden" value="2"></div>
                                                    <div class="cuadro debajo click"><input name="cuadro" type="hidden" value="3"></div>
                                                    <div class="cuadro derecha click"><input name="cuadro" type="hidden" value="hola"></div>
                                                    <div class="centro click"><input name="cuadro" type="hidden" value="5"></div>
                                                </div>
                                                <div class="diente"><!--diente 46-->
                                                    <input name="valor" type="hidden" value="1"><span style="margin-left: -15px">46</span>
                                                    <div class="cuadro click"><input name="cuadro" type="hidden" value="1"></div>
                                                    <div class="cuadro izquierdo click"><input name="cuadro" type="hidden" value="2"></div>
                                                    <div class="cuadro debajo click"><input name="cuadro" type="hidden" value="3"></div>
                                                    <div class="cuadro derecha click"><input name="cuadro" type="hidden" value="hola"></div>
                                                    <div class="centro click"><input name="cuadro" type="hidden" value="5"></div>
                                                </div>
                                                <div class="diente"><!--diente 45-->
                                                    <input name="valor" type="hidden" value="1"><span style="margin-left: -25px">45/85</span>
                                                    <div class="cuadro click"><input name="cuadro" type="hidden" value="1"></div>
                                                    <div class="cuadro izquierdo click"><input name="cuadro" type="hidden" value="2"></div>
                                                    <div class="cuadro debajo click"><input name="cuadro" type="hidden" value="3"></div>
                                                    <div class="cuadro derecha click"><input name="cuadro" type="hidden" value="hola"></div>
                                                    <div class="centro click"><input name="cuadro" type="hidden" value="5"></div>
                                                </div>
                                                <div class="diente"><!--diente 44-->
                                                    <input name="valor" type="hidden" value="1"><span style="margin-left: -25px">44/84</span>
                                                    <div class="cuadro click"><input name="cuadro" type="hidden" value="1"></div>
                                                    <div class="cuadro izquierdo click"><input name="cuadro" type="hidden" value="2"></div>
                                                    <div class="cuadro debajo click"><input name="cuadro" type="hidden" value="3"></div>
                                                    <div class="cuadro derecha click"><input name="cuadro" type="hidden" value="hola"></div>
                                                    <div class="centro click"><input name="cuadro" type="hidden" value="5"></div>
                                                </div>
                                                <div class="diente"><!--diente 43-->
                                                    <input name="valor" type="hidden" value="1"><span style="margin-left: -25px">43/83</span>
                                                    <div class="cuadro click"><input name="cuadro" type="hidden" value="1"></div>
                                                    <div class="cuadro izquierdo click"><input name="cuadro" type="hidden" value="2"></div>
                                                    <div class="cuadro debajo click"><input name="cuadro" type="hidden" value="3"></div>
                                                    <div class="cuadro derecha click"><input name="cuadro" type="hidden" value="hola"></div>
                                                    <div class="centro click"><input name="cuadro" type="hidden" value="5"></div>
                                                </div>
                                                <div class="diente"><!--diente 42-->
                                                    <input name="valor" type="hidden" value="1"><span style="margin-left: -25px">42/82</span>
                                                    <div class="cuadro click"><input name="cuadro" type="hidden" value="1"></div>
                                                    <div class="cuadro izquierdo click"><input name="cuadro" type="hidden" value="2"></div>
                                                    <div class="cuadro debajo click"><input name="cuadro" type="hidden" value="3"></div>
                                                    <div class="cuadro derecha click"><input name="cuadro" type="hidden" value="hola"></div>
                                                    <div class="centro click"><input name="cuadro" type="hidden" value="5"></div>
                                                </div>
                                                <div class="diente"><!--diente 41-->
                                                    <input name="valor" type="hidden" value="1"><span style="margin-left: -25px">41/81</span>
                                                    <div class="cuadro click"><input name="cuadro" type="hidden" value="1"></div>
                                                    <div class="cuadro izquierdo click"><input name="cuadro" type="hidden" value="2"></div>
                                                    <div class="cuadro debajo click"><input name="cuadro" type="hidden" value="3"></div>
                                                    <div class="cuadro derecha click"><input name="cuadro" type="hidden" value="hola"></div>
                                                    <div class="centro click"><input name="cuadro" type="hidden" value="5"></div>
                                                </div>
                                                <div class="diente"><!--diente 31-->
                                                    <input name="valor" type="hidden" value="1"/><span style="margin-left: -25px">31/71</span>
                                                    <div class="cuadro click"><input name="cuadro" type="hidden" value="1"></div>
                                                    <div class="cuadro izquierdo click"><input name="cuadro" type="hidden" value="2"></div>
                                                    <div class="cuadro debajo click"><input name="cuadro" type="hidden" value="3"></div>
                                                    <div class="cuadro derecha click"><input name="cuadro" type="hidden" value="hola"></div>
                                                    <div class="centro click"><input name="cuadro" type="hidden" value="5"></div>
                                                </div>
                                                <div class="diente"><!--diente 32-->
                                                    <input name="valor" type="hidden" value="1"><span style="margin-left: -25px">32/72</span>
                                                    <div class="cuadro click"><input name="cuadro" type="hidden" value="1"></div>
                                                    <div class="cuadro izquierdo click"><input name="cuadro" type="hidden" value="2"></div>
                                                    <div class="cuadro debajo click"><input name="cuadro" type="hidden" value="3"></div>
                                                    <div class="cuadro derecha click"><input name="cuadro" type="hidden" value="hola"></div>
                                                    <div class="centro click"><input name="cuadro" type="hidden" value="5"></div>
                                                </div>
                                                <div class="diente"><!--diente 33-->
                                                    <input name="valor" type="hidden" value="1"><span style="margin-left: -25px">33/73</span>
                                                    <div class="cuadro click"><input name="cuadro" type="hidden" value="1"></div>
                                                    <div class="cuadro izquierdo click"><input name="cuadro" type="hidden" value="2"></div>
                                                    <div class="cuadro debajo click"><input name="cuadro" type="hidden" value="3"></div>
                                                    <div class="cuadro derecha click"><input name="cuadro" type="hidden" value="hola"></div>
                                                    <div class="centro click"><input name="cuadro" type="hidden" value="5"></div>
                                                </div>
                                                <div class="diente"><!--diente 34-->
                                                    <input name="valor" type="hidden" value="1"><span style="margin-left: -25px">34/74</span>
                                                    <div class="cuadro click"><input name="cuadro" type="hidden" value="1"></div>
                                                    <div class="cuadro izquierdo click"><input name="cuadro" type="hidden" value="2"></div>
                                                    <div class="cuadro debajo click"><input name="cuadro" type="hidden" value="3"></div>
                                                    <div class="cuadro derecha click"><input name="cuadro" type="hidden" value="hola"></div>
                                                    <div class="centro click"><input name="cuadro" type="hidden" value="5"></div>
                                                </div>
                                                <div class="diente"><!--diente 35-->
                                                    <input name="valor" type="hidden" value="1"><span style="margin-left: -25px">35/75</span>
                                                    <div class="cuadro click"><input name="cuadro" type="hidden" value="1"></div>
                                                    <div class="cuadro izquierdo click"><input name="cuadro" type="hidden" value="2"></div>
                                                    <div class="cuadro debajo click"><input name="cuadro" type="hidden" value="3"></div>
                                                    <div class="cuadro derecha click"><input name="cuadro" type="hidden" value="hola"></div>
                                                    <div class="centro click"><input name="cuadro" type="hidden" value="5"></div>
                                                </div>
                                                <div class="diente"><!--diente 36-->
                                                    <input name="valor" type="hidden" value="1"><span style="margin-left: -15px">36</span>
                                                    <div class="cuadro click"><input name="cuadro" type="hidden" value="1"></div>
                                                    <div class="cuadro izquierdo click"><input name="cuadro" type="hidden" value="2"></div>
                                                    <div class="cuadro debajo click"><input name="cuadro" type="hidden" value="3"></div>
                                                    <div class="cuadro derecha click"><input name="cuadro" type="hidden" value="hola"></div>
                                                    <div class="centro click"><input name="cuadro" type="hidden" value="5"></div>
                                                </div>
                                                <div class="diente"><!--diente 37-->
                                                    <input name="valor" type="hidden" value="1"><span style="margin-left: -15px">37</span>
                                                    <div class="cuadro click"><input name="cuadro" type="hidden" value="1"></div>
                                                    <div class="cuadro izquierdo click"><input name="cuadro" type="hidden" value="2"></div>
                                                    <div class="cuadro debajo click"><input name="cuadro" type="hidden" value="3"></div>
                                                    <div class="cuadro derecha click"><input name="cuadro" type="hidden" value="hola"></div>
                                                    <div class="centro click"><input name="cuadro" type="hidden" value="5"></div>
                                                </div>
                                                <div class="diente"><!--diente 38-->
                                                    <input name="valor" type="hidden" value="1"><span style="margin-left: -15px">38</span>
                                                    <div class="cuadro click"><input name="cuadro" type="hidden" value="1"></div>
                                                    <div class="cuadro izquierdo click"><input name="cuadro" type="hidden" value="2"></div>
                                                    <div class="cuadro debajo click"><input name="cuadro" type="hidden" value="3"></div>
                                                    <div class="cuadro derecha click"><input name="cuadro" type="hidden" value="hola"></div>
                                                    <div class="centro click"><input name="cuadro" type="hidden" value="5"></div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="tab-pane" id="odontograma">
                                        <div class="panel-body">
                                            <div class="row">

                                                <div id="controls" class="panel panel-default">
                                                    <div class="panel-body">
                                                        <div class="btn-group" data-toggle="buttons">
                                                            <label id="cariado" class="btn btn-danger">
                                                                <input type="radio" name="options" id="option1" autocomplete="off" checked>Cariado</label>
                                                            <label id="obturado" class="btn btn-primary">
                                                                <input type="radio" name="options" id="option2" autocomplete="off"> Obturado
                                                            </label>
                                                            <label id="exodonciarealizada" class="btn btn-warning">
                                                                <input type="radio" name="options" id="option3" autocomplete="off"> Exodoncia realizada
                                                            </label>
                                                            <label id="exodonciasimpleindicada" class="btn btn-danger">
                                                                <input type="radio" name="options" id="option4" autocomplete="off"> Exodoncia simple indicada
                                                            </label>
                                                            <label id="exodonciaquirrugicaindicada" class="btn btn-primary">
                                                                <input type="radio" name="options" id="option5" autocomplete="off"> Exodoncia quirrugica indicada
                                                            </label>
                                                            <label id="sinerupcionar" class="btn btn-warning">
                                                                <input type="radio" name="options" id="option6" autocomplete="off"> Sin erupcionar
                                                            </label>
                                                            <label id="endodonciarealizada" class="btn btn-danger">
                                                                <input type="radio" name="options" id="option7" autocomplete="off"> Endodoncia realizada
                                                            </label>
                                                            <label id="endodonciaindicada" class="btn btn-primary">
                                                                <input type="radio" name="options" id="option8" autocomplete="off"> Endodoncia indicada
                                                            </label>
                                                            <label id="sellantepresente" class="btn btn-warning">
                                                                <input type="radio" name="options" id="option9" autocomplete="off"> Sellante presente
                                                            </label>
                                                            <label id="sellanteindicado" class="btn btn-danger">
                                                                <input type="radio" name="options" id="option10" autocomplete="off"> Sellante indicado
                                                            </label>
                                                            <label id="erosion" class="btn btn-primary">
                                                                <input type="radio" name="options" id="option11" autocomplete="off"> Erosion
                                                            </label>
                                                            <label id="procedimientorealizado" class="btn btn-warning">
                                                                <input type="radio" name="options" id="option12" autocomplete="off"> Procedimiento realizado
                                                            </label>
                                                            <label id="coronabuenestado" class="btn btn-danger">
                                                                <input type="radio" name="options" id="option13" autocomplete="off"> Corona buen estado
                                                            </label>
                                                            <label id="coronamalestado" class="btn btn-primary">
                                                                <input type="radio" name="options" id="option14" autocomplete="off"> Corona mal estado
                                                            </label>
                                                            <label id="provisionalbuenestado" class="btn btn-warning">
                                                                <input type="radio" name="options" id="option15" autocomplete="off"> Provisional buen estado
                                                            </label>
                                                            <label id="provisionalmalestado" class="btn btn-danger">
                                                                <input type="radio" name="options" id="option16" autocomplete="off"> Provisional mal estado
                                                            </label>
                                                            <label id="nucleobuenestado" class="btn btn-primary">
                                                                <input type="radio" name="options" id="option17" autocomplete="off"> Nucleo buen estado
                                                            </label>
                                                            <label id="nucleomalestado" class="btn btn-warning">
                                                                <input type="radio" name="options" id="option18" autocomplete="off"> Nucleo mal estado
                                                            </label>
                                                            <label id="removiblebuenestado" class="btn btn-danger">
                                                                <input type="radio" name="options" id="option19" autocomplete="off"> Removible buen estado
                                                            </label>
                                                            <label id="removiblemalestado" class="btn btn-primary">
                                                                <input type="radio" name="options" id="option20" autocomplete="off"> Removible mal estado
                                                            </label>
                                                            <label id="implante" class="btn btn-warning">
                                                                <input type="radio" name="options" id="option21" autocomplete="off"> Implante
                                                            </label>
                                                            <label id="placa" class="active">
                                                                <input type="hidden" name="option" id="option22" autocomplete="off" value="Placa" /> 
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
                                    <div class="tab-pane" id="final">
                                        <div class="panel-body">
                                            <table class="table table-responsive">
                                                <tr>
                                                    <td>Lectura RX</td>
                                                    <td colspan="2">
                                                        <textarea class="form-control" name="lectura_rx"></textarea>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>Diagnostico</td>
                                                    <td colspan="2">
                                                        <textarea class="form-control" name="diagnostico"></textarea>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="2"> Plan de tratamiento</td>
                                                </tr>
                                                <tr>
                                                    <td>Operatoria <input type="text" class="form-control" name="operatoria" /> </td>
                                                    <td>Cirugia Oral <input type="text" class="form-control" name="cirugia_oral" /> </td>
                                                    <td>Higiene Oral <input type="text" class="form-control" name="higiene_oral" /> </td>
                                                </tr>
                                                <tr>
                                                    <td>Endodoncia <input type="text" class="form-control" name="endodoncia" /> </td>
                                                    <td>MD Oral <input type="text" class="form-control" name="md_oral" /> </td>
                                                    <td>Rehabilitación Oral <input type="text" class="form-control" name="rehab_oral" /> </td>
                                                </tr>
                                                <tr>
                                                    <td>Periodoncia <input type="text" class="form-control" name="periodoncia" /> </td>
                                                    <td>Cirugia Maxilo Facial <input type="text" class="form-control" name="ciru_maxi_facial" /> </td>
                                                    <td>Ortodoncia <input type="text" class="form-control" name="ortodoncia" /> </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="3"> <input  type="submit" class="btn btn-success" value="Registrar" /> </td>
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

        <script src="https://cdn.jsdelivr.net/sweetalert2/6.6.2/sweetalert2.min.js"></script>
        <script type="text/javascript" src="../js/modal.js"></script>
        <script type="text/javascript">
                                                            function replaceAll(find, replace, str) {
                                                                return str.replace(new RegExp(find, 'g'), replace);
                                                            }

                                                            function createOdontogram() {
                                                                var htmlLecheLeft = "",
                                                                        htmlLecheRight = "",
                                                                        htmlLeft = "",
                                                                        htmlRight = "",
                                                                        a = 1;
                                                                for (var i = 9 - 1; i >= 1; i--) {
                                                                    //Dientes Definitivos Cuandrante Derecho (Superior/Inferior)
                                                                    htmlRight += '<div data-name="value" id="dienteindex' + i + '" class="diente">' +
                                                                            '<span style="margin-left: -19px; margin-bottom:5px; display: inline-block !important; border-radius: 10px !important;" class="label label-info">index' + i + '</span>' +
                                                                            '<div id="tindex' + i + '" class="cuadro click">' +
                                                                            '</div>' +
                                                                            '<div id="lindex' + i + '" class="cuadro izquierdo click">' +
                                                                            '</div>' +
                                                                            '<div id="bindex' + i + '" class="cuadro debajo click">' +
                                                                            '</div>' +
                                                                            '<div id="rindex' + i + '" class="cuadro derecha click click">' +
                                                                            '</div>' +
                                                                            '<div id="cindex' + i + '" class="centro click">' +
                                                                            '</div>' +
                                                                            '</div>';
                                                                    //Dientes Definitivos Cuandrante Izquierdo (Superior/Inferior)
                                                                    htmlLeft += '<div id="dienteindex' + a + '" class="diente">' +
                                                                            '<span style="margin-left: -19px; margin-bottom:5px; display: inline-block !important; border-radius: 10px !important;" class="label label-info">index' + a + '</span>' +
                                                                            '<div id="tindex' + a + '" class="cuadro click">' +
                                                                            '</div>' +
                                                                            '<div id="lindex' + a + '" class="cuadro izquierdo click">' +
                                                                            '</div>' +
                                                                            '<div id="bindex' + a + '" class="cuadro debajo click">' +
                                                                            '</div>' +
                                                                            '<div id="rindex' + a + '" class="cuadro derecha click click">' +
                                                                            '</div>' +
                                                                            '<div id="cindex' + a + '" class="centro click">' +
                                                                            '</div>' +
                                                                            '</div>';
                                                                    if (i <= 5) {
                                                                        //Dientes Temporales Cuandrante Derecho (Superior/Inferior)
                                                                        htmlLecheRight += '<div id="dienteLindex' + i + '" style="left: -25%;" class="diente-leche">' +
                                                                                '<span style="margin-left: -19px; margin-bottom:5px; display: inline-block !important; border-radius: 10px !important;" class="label label-primary">index' + i + '</span>' +
                                                                                '<div id="tlecheindex' + i + '" class="cuadro-leche top-leche click">' +
                                                                                '</div>' +
                                                                                '<div id="llecheindex' + i + '" class="cuadro-leche izquierdo-leche click">' +
                                                                                '</div>' +
                                                                                '<div id="blecheindex' + i + '" class="cuadro-leche debajo-leche click">' +
                                                                                '</div>' +
                                                                                '<div id="rlecheindex' + i + '" class="cuadro-leche derecha-leche click click">' +
                                                                                '</div>' +
                                                                                '<div id="clecheindex' + i + '" class="centro-leche click">' +
                                                                                '</div>' +
                                                                                '</div>';
                                                                    }
                                                                    if (a < 6) {
                                                                        //Dientes Temporales Cuandrante Izquierdo (Superior/Inferior)
                                                                        htmlLecheLeft += '<div id="dienteLindex' + a + '" class="diente-leche">' +
                                                                                '<span style="margin-left: -25px; margin-bottom:5px; display: inline-block !important; border-radius: 10px !important;" class="label label-primary">index' + a + '</span>' +
                                                                                '<div id="tlecheindex' + a + '" class="cuadro-leche top-leche click">' +
                                                                                '</div>' +
                                                                                '<div id="llecheindex' + a + '" class="cuadro-leche izquierdo-leche click">' +
                                                                                '</div>' +
                                                                                '<div id="blecheindex' + a + '" class="cuadro-leche debajo-leche click">' +
                                                                                '</div>' +
                                                                                '<div id="rlecheindex' + a + '" class="cuadro-leche derecha-leche click click">' +
                                                                                '</div>' +
                                                                                '<div id="clecheindex' + a + '" class="centro-leche click">' +
                                                                                '</div>' +
                                                                                '</div>';
                                                                    }
                                                                    a++;
                                                                }
                                                                $("#tr").append(replaceAll('index', '1', htmlRight));
                                                                $("#tl").append(replaceAll('index', '2', htmlLeft));
                                                                $("#tlr").append(replaceAll('index', '5', htmlLecheRight));
                                                                $("#tll").append(replaceAll('index', '6', htmlLecheLeft));


                                                                $("#bl").append(replaceAll('index', '3', htmlLeft));
                                                                $("#br").append(replaceAll('index', '4', htmlRight));
                                                                $("#bll").append(replaceAll('index', '7', htmlLecheLeft));
                                                                $("#blr").append(replaceAll('index', '8', htmlLecheRight));
                                                            }
                                                            var arrayPuente = [];
                                                            $(document).ready(function () {
                                                                createOdontogram();
                                                                $(".click").click(function (event) {
                                                                    var control = $("#controls").children().find('.active').attr('id');
                                                                    var cuadro = $(this).find("input[name=cuadro]:hidden").val();
                                                                    console.log($(this).attr('id'))
                                                                    switch (control) {
                                                                        case "cariado":
                                                                            if ($(this).hasClass("click-blue")) {
                                                                                $(this).removeClass('click-blue');
                                                                                $(this).addClass('click-red');
                                                                            } else {
                                                                                if ($(this).hasClass("click-sellantep")) {
                                                                                    $(this).removeClass("click-sellantep");
                                                                                    $(this).addClass("click-red");
                                                                                } else {
                                                                                    if ($(this).hasClass("click-sellantei")) {
                                                                                        $(this).removeClass("click-sellantei");
                                                                                        $(this).addClass("click-red");
                                                                                    } else {
                                                                                        if ($(this).hasClass("click-erosion")) {
                                                                                            $(this).removeClass("click-erosion");
                                                                                            $(this).addClass("click-red");
                                                                                        } else {
                                                                                            if ($(this).hasClass("click-corobuen")) {
                                                                                                $(this).removeClass("click-corobuen");
                                                                                                $(this).addClass("click-red");
                                                                                            } else {
                                                                                                if ($(this).hasClass("click-coromal")) {
                                                                                                    $(this).removeClass("click-coromal");
                                                                                                    $(this).addClass("click-red");
                                                                                                } else {
                                                                                                    if ($(this).hasClass("click-nuclebuen")) {
                                                                                                        $(this).removeClass("click-nuclebuen");
                                                                                                        $(this).addClass("click-red");
                                                                                                    } else {
                                                                                                        if ($(this).hasClass("click-nuclemal")) {
                                                                                                            $(this).removeClass("click-nuclemal");
                                                                                                            $(this).addClass("click-red");
                                                                                                        } else {
                                                                                                            if ($(this).hasClass("click-proce")) {
                                                                                                                $(this).removeClass("click-proce");
                                                                                                                $(this).addClass("click-red");
                                                                                                            } else {
                                                                                                                if ($(this).hasClass("click-gray")) {
                                                                                                                    $(this).removeClass("click-gray");
                                                                                                                    $(this).addClass("click-red");
                                                                                                                } else {
                                                                                                                    if ($(this).hasClass("click-erupcionar")) {
                                                                                                                        $(this).removeClass("click-erupcionar");
                                                                                                                        $(this).addClass("click-red");
                                                                                                                    } else {
                                                                                                                        if ($(this).hasClass("click-endo")) {
                                                                                                                            $(this).removeClass("click-endo");
                                                                                                                            $(this).addClass("click-red");
                                                                                                                        } else {
                                                                                                                            if ($(this).hasClass("click-probuen")) {
                                                                                                                                $(this).removeClass("click-probuen");
                                                                                                                                $(this).addClass("click-red");
                                                                                                                            } else {
                                                                                                                                if ($(this).hasClass("click-promal")) {
                                                                                                                                    $(this).removeClass("click-promal");
                                                                                                                                    $(this).addClass("click-red");
                                                                                                                                } else {
                                                                                                                                    if ($(this).hasClass("click-remobuen")) {
                                                                                                                                        $(this).removeClass("click-remobuen");
                                                                                                                                        $(this).addClass("click-red");
                                                                                                                                    } else {
                                                                                                                                        if ($(this).hasClass("click-remomal")) {
                                                                                                                                            $(this).removeClass("click-remomal");
                                                                                                                                            $(this).addClass("click-red");
                                                                                                                                        } else {
                                                                                                                                            if ($(this).hasClass("click-implante")) {
                                                                                                                                                $(this).removeClass("click-implante");
                                                                                                                                                $(this).addClass("click-red");
                                                                                                                                            } else {
                                                                                                                                                if ($(this).hasClass("click-green")) {
                                                                                                                                                    $(this).removeClass("click-green");
                                                                                                                                                    $(this).addClass("click-red");
                                                                                                                                                } else {
                                                                                                                                                    if ($(this).hasClass("click-red")) {
                                                                                                                                                        $(this).removeClass('click-red');
                                                                                                                                                    } else {
                                                                                                                                                        $(this).addClass('click-red');
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
                                                                            break;
                                                                        case "obturado":
                                                                            if ($(this).hasClass("click-red")) {
                                                                                $(this).removeClass('click-red');
                                                                                $(this).addClass('click-blue');
                                                                            } else {
                                                                                if ($(this).hasClass("click-blue")) {
                                                                                    $(this).removeClass('click-blue');
                                                                                } else {
                                                                                    $(this).addClass('click-blue');
                                                                                }
                                                                            }
                                                                            break;
                                                                        case "exodonciarealizada":
                                                                            var dientePosition = $(this).position();
                                                                            console.log($(this))
                                                                            console.log(dientePosition)
                                                                            $(this).parent().children().each(function (index, el) {
                                                                                if ($(el).hasClass("click")) {
                                                                                    $(el).addClass('click-gray');
                                                                                }
                                                                            });
                                                                            break;
                                                                        case "exodonciasimpleindicada":
                                                                            var dientePosition = $(this).position();
                                                                            console.log(dientePosition);
                                                                            $(this).parent().children().each(function (index, el) {
                                                                                if ($(el).hasClass("click")) {
                                                                                    $(this).parent().children('.cuadro').css('border-color', 'blue');
                                                                                    $(this).parent().children('.cuadro-leche').css('border-color', 'blue');
                                                                                    console.log($(this));
                                                                                }
                                                                            });
                                                                            break;
                                                                        case "exodonciaquirrugicaindicada":
                                                                            var dientePosition = $(this).position();
                                                                            console.log(dientePosition);
                                                                            $(this).parent().children().each(function (index, el) {
                                                                                if ($(el).hasClass("click")) {
                                                                                    $(this).parent().children('.cuadro').css('border-color', 'red');
                                                                                    $(this).parent().children('.cuadro-leche').css('border-color', 'red');
                                                                                    console.log($(this));
                                                                                }
                                                                            });
                                                                            break;
                                                                        case "sinerupcionar":
                                                                            var dientePosition = $(this).position();
                                                                            console.log($(this))
                                                                            console.log(dientePosition)
                                                                            $(this).parent().children().each(function (index, el) {
                                                                                if ($(el).hasClass("click")) {
                                                                                    $(el).addClass('click-erupcionar');
                                                                                }
                                                                            });
                                                                            break;
                                                                        case "endodonciarealizada":
                                                                            var dientePosition = $(this).position();
                                                                            console.log($(this))
                                                                            console.log(dientePosition)
                                                                            $(this).parent().children().each(function (index, el) {
                                                                                if ($(el).hasClass("click")) {
                                                                                    $(el).addClass('click-endo');
                                                                                }
                                                                            });
                                                                            break;
                                                                        case "endodonciaindicada":
                                                                            var dientePosition = $(this).position();
                                                                            console.log(dientePosition);
                                                                            $(this).parent().children().each(function (index, el) {
                                                                                if ($(el).hasClass("click")) {
                                                                                    $(this).parent().children('.cuadro').css('border-color', '#3E2723');
                                                                                    $(this).parent().children('.cuadro-leche').css('border-color', '#3E2723');
                                                                                    console.log($(this));
                                                                                }
                                                                            });
                                                                            break;
                                                                        case "sellantepresente":

                                                                            if ($(this).hasClass("click-sellantep")) {
                                                                                $(this).removeClass('click-sellantep');
                                                                            } else {
                                                                                $(this).addClass('click-sellantep');
                                                                            }

                                                                            break;
                                                                        case "sellanteindicado":
                                                                            if ($(this).hasClass("click-sellantei")) {
                                                                                $(this).removeClass('click-sellantei');
                                                                            } else {
                                                                                $(this).addClass('click-sellantei');
                                                                            }
                                                                            break;

                                                                        case "erosion":
                                                                            if ($(this).hasClass("click-erosion")) {
                                                                                $(this).removeClass('click-erosion');
                                                                            } else {
                                                                                $(this).addClass('click-erosion');
                                                                            }
                                                                            break;

                                                                        case "procedimientorealizado":
                                                                            var dientePosition = $(this).position();
                                                                            console.log($(this))
                                                                            console.log(dientePosition)
                                                                            $(this).parent().children().each(function (index, el) {
                                                                                if ($(el).hasClass("click")) {
                                                                                    $(el).addClass('click-proce');
                                                                                }
                                                                            });
                                                                            break;
                                                                        case "coronabuenestado":
                                                                            if ($(this).hasClass("click-corobuen")) {
                                                                                $(this).removeClass('click-corobuen');
                                                                            } else {
                                                                                $(this).addClass('click-corobuen');
                                                                            }
                                                                            break;

                                                                        case "coronamalestado":
                                                                            if ($(this).hasClass("click-coromal")) {
                                                                                $(this).removeClass('click-coromal');
                                                                            } else {
                                                                                $(this).addClass('click-coromal');
                                                                            }
                                                                            break;

                                                                        case "provisionalbuenestado":
                                                                            var dientePosition = $(this).position();
                                                                            console.log($(this))
                                                                            console.log(dientePosition)
                                                                            $(this).parent().children().each(function (index, el) {
                                                                                if ($(el).hasClass("click")) {
                                                                                    $(el).addClass('click-probuen');
                                                                                }
                                                                            });
                                                                            break;
                                                                        case "provisionalmalestado":
                                                                            var dientePosition = $(this).position();
                                                                            console.log($(this))
                                                                            console.log(dientePosition)
                                                                            $(this).parent().children().each(function (index, el) {
                                                                                if ($(el).hasClass("click")) {
                                                                                    $(el).addClass('click-promal');
                                                                                }
                                                                            });
                                                                            break;
                                                                        case "nucleobuenestado":
                                                                            if ($(this).hasClass("click-nuclebuen")) {
                                                                                $(this).removeClass('click-nuclebuen');
                                                                            } else {
                                                                                $(this).addClass('click-nuclebuen');
                                                                            }
                                                                            break;

                                                                        case "nucleomalestado":
                                                                            if ($(this).hasClass("click-nuclemal")) {
                                                                                $(this).removeClass('click-nuclemal');
                                                                            } else {
                                                                                $(this).addClass('click-nuclemal');
                                                                            }
                                                                            break;

                                                                        case "removiblebuenestado":
                                                                            var dientePosition = $(this).position();
                                                                            console.log($(this))
                                                                            console.log(dientePosition)
                                                                            $(this).parent().children().each(function (index, el) {
                                                                                if ($(el).hasClass("click")) {
                                                                                    $(el).addClass('click-remobuen');
                                                                                }
                                                                            });
                                                                            break;
                                                                        case "removiblemalestado":
                                                                            var dientePosition = $(this).position();
                                                                            console.log($(this))
                                                                            console.log(dientePosition)
                                                                            $(this).parent().children().each(function (index, el) {
                                                                                if ($(el).hasClass("click")) {
                                                                                    $(el).addClass('click-remomal');
                                                                                }
                                                                            });
                                                                            break;
                                                                        case "implante":
                                                                            var dientePosition = $(this).position();
                                                                            console.log($(this))
                                                                            console.log(dientePosition)
                                                                            $(this).parent().children().each(function (index, el) {
                                                                                if ($(el).hasClass("click")) {
                                                                                    $(el).addClass('click-implante');
                                                                                }
                                                                            });
                                                                            break;
                                                                        case "placa":
                                                                            var dientePosition = $(this).position();
                                                                            if ($(this).hasClass("click-blue")) {
                                                                                $(this).removeClass('click-blue');
                                                                                $(this).addClass('click-green');
                                                                            } else {
                                                                                if ($(this).hasClass("click-green")) {
                                                                                    $(this).removeClass('click-green');
                                                                                } else {
                                                                                    $(this).addClass('click-green');
                                                                                }
                                                                            }
                                                                            break;

                                                                        default:
                                                                            console.log("borrar case");
                                                                    }
                                                                    return false;
                                                                });
                                                                return false;
                                                            });
        </script>

    </body>
</html>
