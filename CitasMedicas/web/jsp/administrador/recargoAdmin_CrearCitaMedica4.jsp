<%-- 
    Document   : recargoAdmin_CrearCitaMedica4
    Created on : 22-mar-2017, 19:00:21
    Author     : Gladys M
--%>

<%@page import="java.sql.Time"%>
<%@page import="DTO.HorarioDTO"%>
<%@page import="FACADE.FacadeHorario"%>
<%@page import="java.util.List"%>
<%@page import="DTO.HorarioMedicoDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="FACADE.FacadeHorarioMedico"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="../js/funciones.js" type="text/javascript"></script>
        <title>JSP Page</title>
    </head>
    <body>
        
        <p>3. Seleccione El horario </p>         
          
            <label for="" class="col-sm-2 control-label">Horas:  </label>
            <div class="col-sm-6">
                <select class="form-control" name="hora" id="hora" required="" >
                    <%
                        int id = Integer.parseInt(request.getParameter("idmed"));
                        String fecha = request.getParameter("fecha");
                        String servicio = request.getParameter("servicio");
                        String tipou = request.getParameter("tipou");
                        
                        FacadeHorario fachm = new FacadeHorario();

                        List<HorarioDTO> horas = fachm.consultarHorasDisponibles(id, fecha);
                        
                        int idHora = 0;
                        for (int i = 0; i < horas.size(); i++) {

                            idHora = horas.get(i).getId_horario();
                            
                            Time hora = horas.get(i).getHora_inicio();
                          
                            System.out.println("idhora "+ idHora);

                    %>                    
                    <option value="<%=hora%>"><%=hora%> </option>                                                                                                                                             
                    <%
                        }
                    %>
                </select>
            </div>          
            <div id="mostrar">
                <label for="inputEmail3" class="col-sm-2 control-label"> Recibo </label>
                <div class="col-sm-2">
                    <input type="datetime" class="form-control" required="" name="recibo" id="recibo">
                </div>                  
                <input type="hidden" class="form-control" name="idHora" id="idHora" value="<%=idHora%>">
            </div>
                
            <div class="col-sm-2">
                <button type="submit" class="btn btn-primary form-control" onclick="procesar('../controlador/procesarCrearCita?idprof=' + id.value + '&fecha='+fecha.value + '&hora='+hora.value +'&servicio='+servicio.value + '&idHora='+idHora.value + '&tipou='+ tipou.value)">  CREAR CITA </button>
            </div>
            
    </form>
    </body>
</html>
