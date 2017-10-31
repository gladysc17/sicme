/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
document.write("<script type='text/javascript' src='html2canvas'></script>");
function registrar(){
    alert("HOLA...");
    $("#registrar").on("submit", function(e){
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
        var ortodoncia = new FormData(document.getElementById("ortodoncia"));
        alert("Ya casi..");
        html2canvas($("placa1"),{
            onrendered: function(canvas){
                var img = canvas.toDataURL("image/png")
                window.open(img);
                //theCanvas = canvas;
                //document.body.appendChild(canvas);
                //Canvas2Image.saveAsPNG(canvas); 
            }
        });
        html2canvas($("placa2"),{
            onrendered: function(canvas2){
                theCanvas = canvas2;
                document.body.appendChild(canvas2);
                Canvas2Image.saveAsPNG(canvas2); 
            }
        });
        
        $.ajax({
            url:"../controlador/procesarRegistroHistoriaOdontologia.jsp",
            type: "POST",
            dataType: "html",
            data: "formdata",
            cache: false,
            contentType: false,
            processData: false
        }).done(function(echo){
            
        });
    });
}
