class ClientsController < ApplicationController

  def create
    client = Client.create client_params
    redirect_to edit_client_path
  end

  def edit
    client
  end

  def update
    client.update client_params
    redirect_to edit_client_path
  end

  private

  def to_param
    dni
  end

  def client_params
    params.require(:client).permit(:dni, :name, :email, :adress, :phone, :cellphone)
  end

  def client
    @client ||= Client.find_or_initialize_by dni: params[:dni]
  end
end
