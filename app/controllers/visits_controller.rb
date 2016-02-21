class VisitsController < ApplicationController
  before_action :set_visit, only: [:show]

  def index
  end

  def new
    @visit = client.visits.new
    @calendar = Day.build 2
  end

  # Create a new visit and create a new turn for it when details are given
  def create
    @visit = client.visits.new(visit_params)
    Visit.transaction do
      @visit.turn = Turn.create! turn_params if visit_params['turn_id'].empty?
      @visit.save!
    end
    redirect_to visit_path(@visit)
  end

  private

  def set_visit
    @visit = Visit.find(params[:id])
  end

  def visit_params
    params.require(:visit).permit(:description, :duration, :client, :turn_id)
  end

  def turn_params
    params.require(:turn).permit(:at, :employee_id)
  end

  def client
    @client ||= Client.find_by! dni: params[:client_dni]
  end
end
