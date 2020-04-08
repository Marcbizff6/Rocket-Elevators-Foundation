using System;


public class Interventions
{
    public long id { get; set; }
    public long author_id { get; set; }
    public long customer_id { get; set; }
    public long battery_id { get; set; }
    public long building_id { get; set; }
    public long column_id { get; set; }
    public long elevator_id { get; set; }
    public long employee_id { get; set; }
    public DateTime? intervention_start_time {get; set;}
    public DateTime? intervention_end_time {get; set;}
    public string result {get; set;}
    public string report {get; set;}
    public string status {get; set;}
}