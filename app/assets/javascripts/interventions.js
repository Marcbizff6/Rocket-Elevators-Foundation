function show_row_2() {


  $('#interventions_customerID').click(function () {
    var val = $(this).val();
    // console.log('triggered');
    // console.log(val);

    $.ajax({
      url: '/interventions/get_building?id=',
      method: "GET",
      dataType: "json",
      data: { customerID: val },
      error: function (xhr, status, error) {
        console.error('AJAX Error: ' + status + error);
      }
    });
  });

}