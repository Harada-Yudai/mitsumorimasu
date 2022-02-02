class ClientsController < ApplicationController


  def index
    @client = Client.find(params[:id])
  end

  def new
    @client = Client.new
  end

  def create
    @client = Client.new(client_params)
    if @client.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @client = Client.find(params[:id])
  end

  def update
    @client = Client.find(params[:id])
    @client.update(client_params)
    if @client.save
      render :index
    else
      render :edit
    end
  end

  private

  def client_params
    params.require(:client).permit(:cli_email,:cli_company,:cli_last_name,:cli_first_name,:cli_last_kana,:cli_first_kana,:cli_address,:cli_phone_num,:cli_info).merge(user_id: current_user.id)
  end
end



