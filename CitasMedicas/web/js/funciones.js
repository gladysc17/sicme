/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
//metodo carga una imagen cargando
function loading(rta) {
    $(rta).html("<div class='row'><div class='col-md-6 col-md-offset-5'><img src='../images/cargando.gif' width='32' height='32' alt='cargando' /></div>");
}

function ajax(url, datos, rta) {
    var ajax = $.get(url, datos, function(respuesta) {
        $(rta).html(respuesta);
    });
    return ajax;
}

function nuevoAjax()
{
    /* Crea el objeto AJAX. Esta funcion es generica para cualquier utilidad de este tipo, por
     lo que se puede copiar tal como esta aqui */
    var xmlhttp = false;
    try
    {
        // Creacion del objeto AJAX para navegadores no IE
        xmlhttp = new ActiveXObject("Msxml2.XMLHTTP");
    }
    catch (e)
    {
        try
        {
            // Creacion del objet AJAX para IE
            xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
        }
        catch (E)
        {
            if (!xmlhttp && typeof XMLHttpRequest !== 'undefined')
                xmlhttp = new XMLHttpRequest();
        }
    }
    return xmlhttp;
}

function validateFieldNull(elemento){ 

    if(elemento.value === ""){
        alert("El campo " + elemento.alt + " debe tener valor");
        elemento.focus();
        return false;
    }
    return true;
}

function cargar_form(url) {

    var url = url;
    var datos = {};
    var rta = "#cargar";
    //loading(rta);
    ajax(url, datos, rta);
}

function cargarForm(url) {
   
    var url = url;
    var datos = {};
    var rta = "#recargo";
    //loading(rta);
    ajax(url, datos, rta);
}
function cargarFormulario(url) {
   
    var url = url;
    var datos = {};
    var rta = "#recar";
    //loading(rta);
    ajax(url, datos, rta);
}

function cargar(url) {
   
    var url = url;
    var datos = {};
    var rta = "#recargar";
    //loading(rta);
    ajax(url, datos, rta);
}

function cargar_fr(url) {
   
    var url = url;
    var datos = {};
    var rta = "#cargar_fr";
    //loading(rta);
    ajax(url, datos, rta);
}
function procesar(url) {
   
    var url = url;
    var datos = {};
    var rta = "#procesar";
    //loading(rta);
    ajax(url, datos, rta);
}

