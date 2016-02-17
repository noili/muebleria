class VisitsController < ApplicationController
  def index
  end

  def new
    @visit = client.visits.new
    @calendar = Day.build
  end

  def create
    visit = client.visits.create(visit_params)
    redirect_to visit_path(visit)
  end

  private

  def visit_params
    params.require(:visit).permit(:description, :duration, :client, :turn_id)
  end

  def client
    @client ||= Client.find_by! dni: params[:client_dni]
  end
end
