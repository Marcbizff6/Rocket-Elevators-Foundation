class InterventionsController < ApplicationController
  # before_action :set_intervention, only: [:show, :edit, :update, :destroy]
  # before_action :authenticate_employee!
  # before_action :authorize_admin, only:
  
def index
  @interventions = Interventions.all
  @interventions = Interventions.new
  @customers = Customer.all
  @buildings = Building.all
  @batteries = Battery.all
  @columns = Column.all
  @elevators = Elevator.all
  @employees = Employee.all
end

def new
  @interventions = Interventions.new
  @customers = Customer.all
  @columns = Column.all
  @buildings = Building.all
  @batteries = Battery.all
  @elevators = Elevator.all
  @employees = Employee.all
end

def get_building
  if params[:customerID].present?
    puts params[:customerID].present?
     @buildings = Customer.find(params[:customerID]).buildings
      puts @buildings
  else @buildings = Customer.all
  end
  
  if request.xhr?
    respond_to do |format|
      format.json {
  render json: {
    buildings: @buildings
  }}
  end
end
end

  def create
    #Intervention.create(params)
    @interventions = Interventions.new
    @interventions = Interventions.create(
      id: params[:id],
      column_id: params[:column_id],
      elevator_id: params[:elevator_id],
      start_date: params[:start_date],
      end_date: params[:end_date],
      result: params[:result],
      report: params[:report],
      status: params[:status],
      author: params[:author],
      building_id: params[:building_id],
      battery_id: params[:battery_id],
      customerID: params[:customerID],
    )

    @client = ZendeskAPI::Client.new do |config|
      config.url = "https://kienzan2.zendesk.com/api/v2" # e.g. https://mydesk.zendesk.com/api/v2
      # Basic / Token Authentication
      config.username = "link_zelda_triforce@hotmail.com"
      # config.token = "Zendesk_Token"
      config.token = ENV["Zendesk_Token"]
    end


    ZendeskAPI::Ticket.create!(@client,
      :subject => "#{@interventions.id} from #{@interventions.id}",
      :description => "Create Ticket",
      :comment => { :value => "The contact #{@interventions.id} from company #{@interventions.id} can be reached at email #{@interventions.id} and at phone number #{@interventions.id}. The #{@interventions.id} department has a project that would require contribution from Rocket Elevators." },
      :type => "task",
      :priority => "urgent")
  end

  #ON SEND ->
  if @interventions.try(:save!)
    @interventions.ticket_interventions
    redirect_to "/interventions"
  end
end
