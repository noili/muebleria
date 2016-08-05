class TurnsController < ApplicationController
  before_action :set_turn, only: [:show]

  def index
    @calendar = Day.build 2
  end

  private

  def set_turn
    @turn = Turn.find(params[:id])
  end
end
