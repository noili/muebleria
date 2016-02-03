class VisitsController < ApplicationController
  def index
  end

  def new
    @visit = client.visits.new
  end

  def create
    client.visits.create(visit_params)
    redirect_to visits_path
  end

  private

  def visit_params
    params.require(:visit).permit(:description, :duration, :client)
  end

  def client
    @client ||= Client.find_by! dni: params[:client_dni]
  end
end
