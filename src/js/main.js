$(document).ready(()=>{
    dataUser();
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
            console.log(response) 
        }
    })   
}
