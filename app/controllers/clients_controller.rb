class ClientsController < ApplicationController
  def create
    client = Client.create client_params
    redirect_to edit_client_path(client)
  end

  def edit
    client
  end

  def update
    client.update client_params
    redirect_to edit_client_path(client)
  end

  private

  def client_params
    params.require(:client).permit(:dni, :name, :email, :adress, :phone,
                                   :cellphone)
  end

  def client
    @client ||= Client.find_or_initialize_by dni: params[:dni]
  end
end