class ClientsController < ApplicationController

  def create
    @client = Client.new client_params
    @client.save
    redirect_to edit_client_path(@client.dni)
  end

  def edit
    @client = Client.find_or_initialize_by dni: params[:dni]
  end

  def update
    @client = Client.find_or_initialize_by dni: params[:dni]
    @client.update client_params
    redirect_to edit_client_path(@client.dni)
  end

  private
    def client_params
      params.require(:client).permit(:dni, :name, :email, :adress, :phone, :cellphone)
    end

end
