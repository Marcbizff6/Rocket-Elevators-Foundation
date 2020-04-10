function show_row_2() {


  $('#interventions_customerID').click(function () {
    var val = $(this).val();
    // console.log('triggered');
    // console.log(val);

    $.ajax({
      url: '/interventions/get_building?id=',
      method: "GET",  
      dataType: "json",
      data: {customerID: val},
      error: function (xhr, status, error) {
       console.error('AJAX Error: ' + status + error);
     },
     success: function (response) {
       // console.log(response);
       var building = response["building"];
       document.getElementById('building').style.display = val != "" ? 'block' : 'none';
       $("#intervention_building_id").empty();
       $('#intervention_building_id').addClass("form-control")
       $('#intervention_building_id').prop('required', 'true')
       $("#intervention_columnID").empty();
       $('#intervention_columnID').addClass("form-control")
       $("#intervention_elevator_id").empty();
       $('#intervention_elevator_id').addClass("form-control")
       $("#intervention_building_id").append('<option value ="">Select Building</option>');
       for(var i = 0; i < building.length; i++){
         $("#intervention_building_id").append('<option value="' + building[i]["id"] + '">' + "Building #" +building[i]["id"] +  '</option>');
       }
     }
     });
     });

}