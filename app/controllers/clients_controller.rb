class ClientsController < ApplicationController
  before_action :set_client, only: [:edit, :update]

  # Search for a client by DNI
  def new
    @client = Client.new
  end

  # Edit client details
  def edit
  end

  # Update client details and start a new visit
  def update
    if @client.update client_params
      redirect_to new_client_visit_path(@client)
    else
      render :edit
    end
  end

  private

  def client_params
    params.require(:client).permit(:dni, :name, :email, :address, :zone_id,
                                   :phone, :cellphone)
  end

  def set_client
    @client ||= Client.find_or_initialize_by dni: client_dni
  end

  def client_dni
    params[:dni] || client_params[:dni]
  end
end
