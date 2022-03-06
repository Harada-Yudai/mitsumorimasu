class ClientsController < ApplicationController
  before_action :authenticate_user!

  def index
    @client = Client.find(params[:client_id])
    @projects = Project.where(client_id: params[:client_id]).order('created_at DESC')
    if params[:project_id].blank?
    else
      @project = Project.find(params[:project_id])
      @items = Item.where(project_id: params[:project_id]).order('created_at DESC')
      if params[:item_id].blank?
      else
        @item = Item.find(params[:item_id])
      end
    end
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
    if params[:project_id].blank?
    elsif params[:item_id].blank?
      @project = Project.find(params[:project_id])
    else
      @project = Project.find(params[:project_id])
      @item = Item.find(params[:item_id])
    end
  end

  def update
    @client = Client.find(params[:id])
    @client.update(client_params)
    @projects = Project.where(client_id: params[:id]).order('created_at DESC')
    if @client.save
      redirect_to  user_clients_path(client_id: params[:id],project_id: params[:project_id],item_id: params[:item_id])
    else
      render :edit
    end
  end

  def destroy
    client = Client.find(params[:id])
    client.destroy
    redirect_to root_path(current_user.id)
  end

  private

  def client_params
    params.require(:client).permit(:cli_email,:cli_company,:cli_last_name,:cli_first_name,:cli_last_kana,:cli_first_kana,:cli_address,:cli_phone_num,:cli_info).merge(user_id: current_user.id)
  end
end



