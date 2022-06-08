var totalTarjeta=0;
var datosAsesor=[];
var datosInventario=[];
var idEmpleado="";
var totalVenta=[];
var saldoCaja=0;

$(document).ready(()=>{
   
    dataUs();
    traerVenta();
    //eventos
    $('#vTarjeta').on('click',inUser);
    $('#vtgVenta').on('click',guardarVenta);
    $('#cerrarC').on('click', cerrarCaja);
    $('#addInventario').on('click', cargarInventario);

})

function dataUs(){
    $.ajax({
        url: "./backend/controller.php",
        type: "post",
        data: {"token" : "sel001"},
        beforeSend: function () {
            console.log("cargando..")
        },
        success: function (response){ 
            datosAsesor=JSON.parse(response);
            idEmpleado=datosAsesor['data_asesor'][0].idasesor;
            $('#empleado').html(idEmpleado);
            $('#clEmpleado').val(idEmpleado);
            $('#vtEmpleado').val(idEmpleado);
            $('#saldo').html(formatter.format(datosAsesor['data_asesor'][0].saldo_actual_caja));
            saldoCaja=datosAsesor['data_asesor'][0].saldo_actual_caja;
            $('#canTarjetas').html(datosAsesor['data_asesor'][0].cantidad_tarjetas);
            totalTarjeta=datosAsesor['data_asesor'][0].cantidad_tarjetas;
        }
    })   
}

function inUser(){
    let cedulaUSer=$('#clCedula').val();
    let nombreUSer=$('#clNombre').val();
    let direccionUSer=$('#clDireccion').val();
    let idE=$('#clEmpleado').val();

    var dataUSer={
        'cedulaUSer' : cedulaUSer,
        'nombreU' : nombreUSer,
        'direccionU' : direccionUSer,
        'asU' : idE,
        'token' : "ins01"
    }

    $.ajax({
        url: "./backend/controller.php",
        type: "post",
        data: dataUSer,
        beforeSend: function () {
            console.log("cargando..")
        },
        success: function (response){ 
            if(response == "1"){
                alert("usuario registrado");
            }else{
                alert("usuario no registrado");
            }
        }
    })   
}

function guardarVenta(){
    let cantidad=$('#vtCantidad').val();
    let valor=$('#vtValor').val();
    let cedula=$('#vtCedula').val();
    let idE=$('#vtEmpleado').val();
    let total=cantidad*valor;
    let totalActualInventario=totalTarjeta-cantidad;

    if(totalTarjeta >= parseInt(cantidad) ){
        postGuardarVenta(cantidad, total, cedula, idE, totalActualInventario)
    }else{
        alert("no puede vender debe cargar el inventario")
    }

}

function postGuardarVenta(cant, total, ceUser, idE, canInv){
    var dataUSer={
        'cantidad' : cant,
        'total' : total,
        'ceUser' : ceUser,
        'idE' : idE,
        'canInve':canInv,
        'token' : "ins02"
    }
    $.ajax({
        url: "./backend/controller.php",
        type: "post",
        data: dataUSer,
        beforeSend: function () {
            console.log("cargando la venta..")
        },
        success: function (response){
            if(response == "1"){
                alert("producto vendido y descontado del inventario");
                setTimeout(dataUs, 500);
                setTimeout(traerVenta, 500);
            }else{
                console.log(response)
            }
               
        }
    })   
}

function traerVenta(){
    $.ajax({
        url: "./backend/controller.php",
        type: "post",
        data: {"token":"sel002"},
        success: function (response){
            totalVenta=JSON.parse(response);
            $("#totales").html(totalVenta['totalVenta'][0].total);
        }
    })   
}

function cerrarCaja(){
result = window.confirm("Esta seguro de pasar el saldo a la caja");
if(result){
    let totalV=parseInt(totalVenta['totalVenta'][0].total);
    let salCaja=parseInt(saldoCaja);
    let total=salCaja+totalV;
    $.ajax({
        url: "./backend/controller.php",
        type: "post",
        data: {"token":"upd01", "id_empleado":idEmpleado, "nuevo_saldo":total},
        success: function (response){
            if(response == "1"){
                alert("venta cargada en caja")
                setTimeout(dataUs, 500);
                setTimeout(traerVenta, 500);
            }
        }
    })   
}else{
    alert("cancelado correctamente")
}
}

function cargarInventario(){
    var tarjetas = prompt("Ingresa la cantidad de tarjetas a inventariar");
    let t=parseInt(totalTarjeta);
    let ta=parseInt(tarjetas);
    let total=t+ta;

    if(tarjetas == null){
        alert("cancelado correctamente")
       
    }else{
        $.ajax({
            url: "./backend/controller.php",
            type: "post",
            data: {"token":"upd02", "cantidad_tarjetas":total, "id_empleado":idEmpleado},
            success: function (response){
                if(response == "1"){
                    alert("inventario cargado");
                    setTimeout(dataUs, 500);

                }
            }
        })   
    }

}

const formatter = new Intl.NumberFormat('en-CO', {
    style: 'currency',
    currency: 'COP',
    minimumFractionDigits: 0
  })

