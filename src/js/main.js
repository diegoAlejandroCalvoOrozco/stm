$(document).ready(()=>{
    var datosAsesor=[];
    var datosInventario=[];
    var idEmpleado="";
    dataUser();
    //eventos
    $('#vTarjeta').on('click',inUser);

})

function dataUser(){
    $.ajax({
        url: "./backend/controller.php",
        type: "post",
        data: {"token" : "sel001"},
        beforeSend: function () {
            console.log("cargando..")
        },
        success: function (response){ 
            this.datosAsesor=JSON.parse(response);
            this.idEmpleado=this.datosAsesor['data_asesor'][0].idasesor;
            $('#empleado').html(this.idEmpleado);
            $('#clEmpleado').val(this.idEmpleado);
            $('#saldo').html(formatter.format(this.datosAsesor['data_asesor'][0].saldo_actual_caja));
            $('#canTarjetas').html(this.datosAsesor['data_asesor'][0].cantidad_tarjetas);
           
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
            console.log(response)  
        }
    })   
}


const formatter = new Intl.NumberFormat('en-CO', {
    style: 'currency',
    currency: 'COP',
    minimumFractionDigits: 0
  })

