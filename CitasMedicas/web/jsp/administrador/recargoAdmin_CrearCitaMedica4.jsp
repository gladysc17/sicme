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
        
        <p>3. Seleccione El horario </p>         
          
            <label for="" class="col-sm-2 control-label">Horas:  </label>
            <div class="col-sm-3">
                <select class="form-control" name="hora" id="hora" required="" >
                    <%
                        String idmed = request.getParameter("idmed");
                        String fecha = request.getParameter("fecha");                     
                        String tipou = request.getParameter("tipou");                                              
                        String servicio = request.getParameter("servicio");                                             
                        
                        String x = "";
                        
                        if(servicio.equals("odontologia") || servicio.equals("medicinageneral")){
                         x = "mostrar";
                        }
                        else{
                            x = "ocultar";
                        }
                        
                        
                        FacadeHorario fachm = new FacadeHorario();

                        List<HorarioDTO> horas = fachm.consultarHorasDisponibles(idmed, fecha);                                                                   
                        
                        int idHora = 0;
                        for (int i = 0; i < horas.size(); i++) {

                            idHora = horas.get(i).getId_horario();
                            
                            Time hora = horas.get(i).getHora_inicio();                                                   

                    %>                    
                    <option value="<%=hora%>"><%=hora%> </option>                                                                                                                                             
                    <%
                        }
                    %>
                </select>
            </div>    
                
                <style>
                    
                    #mostrar{
                        display: inline;
                    }
                    #ocultar{
                        display: none;
                    }
                </style>                              
                <input type="hidden" name="idmed" id="idmed" value="<%=idmed%>">
            <div id="<%=x%>">
                <label for="inputEmail3" class="col-sm-2 control-label"> Recibo </label>
                <div class="col-sm-2">
                    <input type="datetime" class="form-control" required="" name="recibo" id="recibo">
                </div>                  
                
            </div>
            <input type="hidden" class="form-control" name="idHora" id="idHora" value="<%=idHora%>">
            
            <div class="col-sm-3">
                <button type="submit" class="btn btn-primary form-control" onclick="procesar('../controlador/procesarCrearCita?idmed='+idmed.value+'fecha='+fecha.value + '&hora='+hora.value +'&servicio='+servicio.value + '&idHora='+idHora.value + '&tipou='+ tipou.value)">  CREAR CITA </button>
            </div>
            
    </form>
