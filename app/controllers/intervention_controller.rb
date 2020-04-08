class QuotesController < ApplicationController
  def submission
  end

  def create
    #Quote.create(params)
    @intervention = Intervention.new
    @intervention = Intervention.create(
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
                               :subject => "#{@intervention.id} from #{@intervention.id}",
                               :description => "Create Ticket",
                               :comment => { :value => "The contact #{@intervention.id} from company #{@intervention.id} can be reached at email #{@intervention.id} and at phone number #{@intervention.id}. The #{@intervention.id} department has a project that would require contribution from Rocket Elevators." },
                               :type => "task",
                               :priority => "urgent")
  end

  #ON SEND ->
  if @intervention.try(:save!)
    @intervention.ticket_intervention
    redirect_to "/intervention"
  end
end
