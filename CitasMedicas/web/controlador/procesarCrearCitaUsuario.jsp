<%-- 
    Document   : procesarCrearCita
    Created on : 22-feb-2017, 22:12:19
    Author     : Gladys M
--%>

<%@page import="FACADE.FacadeServicio"%>
<%@page import="DTO.ServicioDTO"%>
<%@page import="DTO.UsuarioDTO"%>
<%@page import="FACADE.FacadeUsuario"%>
<%@page import="DTO.HorarioMedicoDTO"%>
<%@page import="FACADE.FacadeHorarioMedico"%>
<%@page import="FACADE.FacadeHorario"%>
<%@page import="DTO.MedicoDTO"%>
<%@page import="FACADE.FacadeMedico"%>
<%@page import="DTO.CitaDTO"%>
<%@page import="DTO.EstudianteDTO"%>
<%@page import="FACADE.FacadeCita"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

        <%
            String servi = request.getParameter("servicio");
            int se= Integer.parseInt(servi);
            
            FacadeServicio facSer = new FacadeServicio();
            ServicioDTO ser = facSer.consultarServicioId(se);
            String servicio = ser.getNombre();
            String servicio = request.getParameter("servicio");;
            String fecha = request.getParameter("fecha");
            String hora_rec = request.getParameter("hora");
            String id_usuario = request.getParameter("identf");
            String id_med = request.getParameter("prof");
            String estado = "pendiente";
            
            String[] parts = hora_rec.split("-");
            String hora = parts[0];
            String idHora_spl = parts[1]; 
            int idHora =  Integer.parseInt(idHora_spl);  
                        
            FacadeUsuario facUsu = new FacadeUsuario();

            UsuarioDTO med = facUsu.consultarUsuarioPorId(id_med);
            String nombre_medico = med.getNombre();
            
            UsuarioDTO us = facUsu.consultarUsuarioPorId(id_usuario);
            String nombre_usuario = us.getNombre();
            String tipou = us.getTipo_usuario();

            
            FacadeCita fc = new FacadeCita();
            
            String recibo = "";
            
            if(servicio.equals("medicinageneral") || servicio.equals("odontologia")){
                recibo = request.getParameter("recibo");
            }
            else{
                recibo ="no aplica";
            }

            CitaDTO cita = new CitaDTO(servicio, recibo, fecha, hora, id_usuario, id_med, estado, nombre_usuario, nombre_medico, tipou);

            boolean rta = fc.registrarCita(cita);

            FacadeHorario fac = new FacadeHorario();
            FacadeHorarioMedico fm = new FacadeHorarioMedico();
            HorarioMedicoDTO hm = fm.consultarHorarioMedico(idHora);

            boolean rt2 = fac.cambiarEstadoHora(id_med, fecha, hm.getId_horario_horariomedico());

            if (rta == true && rt2 == true) {

                System.out.println("CREO LA CITA y cambio horario");
        %>
        <script>
            alert("CREO LA CITA");
            location.href = "../jsp/PrincipalUsuario.jsp";
        </script>
        <%
        } else {
        %>
        <script>
            alert("NO CREO LA CITA");
            location.href = "../jsp/PrincipalUsuario.jsp";
        </script>
        <%
            }
        %>
    </body>
</html>

