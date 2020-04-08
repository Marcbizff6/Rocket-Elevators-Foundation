$(function() {

  if ($("select#location").val() == "") {
   $("select#course option").remove();
   var row = "<option value=\"" + "" + "\">" + "Course" + "</option>";
   $(row).appendTo("select#course");
  }
  $("select#location").change(function() {
   var id_value_string = $(this).val();
   if (id_value_string == "") {
    $("select#course option").remove();
    var row = "<option value=\"" + "" + "\">" + "Course" + "</option>";
    $(row).appendTo("select#course");
   } else {
    // Send the request and update course dropdown
    $.ajax({
     dataType: "json",
     cache: false,
     url: '/get_courses_by_location/' + id_value_string,
     timeout: 5000,
     error: function(XMLHttpRequest, errorTextStatus, error) {
      alert("Failed to submit : " + errorTextStatus + " ;" + error);
     },
     success: function(data) {
      // Clear all options from course select
      $("select#course option").remove();
      //put in a empty default line
      var row = "<option value=\"" + "" + "\">" + "Course" + "</option>";
      $(row).appendTo("select#course");
      // Fill course select
      $.each(data, function(i, j) {
       row = "<option value=\"" + j.id + "\">" + j.title + "</option>";
       $(row).appendTo("select#course");
      });
     }
    });
   }
  });

 });