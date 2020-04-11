class Intervention2sController < ApplicationController
  before_action :authenticate_employee!

  def new
    @intervention = Intervention2s.new
  end

  def create
    @cur_employee = current_employee
    @intervention = Intervention2s.new(intervention_params)
    @intervention.author_id = @cur_employee.id
    
    if @intervention.save
      flash[:notice] = "add new intervention successfull "
      redirect_to :index
    else
      flash[:notice] = "add new intervention not successfull "
      raise StandardError, @intervention.errors.messages
      #redirect_to action:"new"
    end
  end

  private

    def intervention_params
      params.require(:intervention).permit(:customer_id, :building_id, :battery_id, :column_id, :elevator_id, :employee_id, :report)
    end

end