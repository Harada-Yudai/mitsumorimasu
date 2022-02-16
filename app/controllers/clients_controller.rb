class ClientsController < ApplicationController


  def index
    @client = Client.find(params[:client_id])
    @projects = Project.where(client_id: params[:client_id]).order('created_at DESC')
    if params[:project_id].blank?
    else
      @project = Project.find(params[:project_id])
      @items = Item.where(project_id: params[:project_id]).order('created_at DESC')
      if params[:item_id].blank?
      else
        # @items = Item.where(project_id: params[:project_id])
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
    @client = Client.find(params[:client_id])
  end

  def update
    @client = Client.find(params[:id])
    @client.update(client_params)
    @projects = Project.where(params[:client_id]).order('created_at DESC')
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



