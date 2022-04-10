class ItemsController < ApplicationController
  before_action :authenticate_user!
  def new
    @item= Item.new
    @client = Client.find(params[:client_id])
    @project = Project.find(params[:project_id])
  end

  def create
    @item = Item.new(item_params)
    @project = Project.find(params[:project_id])
    @client = Client.find(params[:client_id])
    if @item.save
      new_item = Item.order(created_at: :desc).find_by(params[:project_id])
      redirect_to user_clients_path(current_user.id,client_id:@project.client_id,project_id:@project.id,item_id:new_item.id)
    else
      render :new
    end
  end

  def edit
    @item= Item.find(params[:id])
    @client = Client.find(params[:client_id])
    @project = Project.find(params[:project_id])
  end

  def update
    @item = Item.find(params[:id])
    @project = Project.find(params[:project_id])
    @client = Client.find(params[:client_id])
    @item.update(item_params)
    if @item.save
      redirect_to user_clients_path(current_user.id,client_id:@project.client_id,project_id:@project.id,item_id:params[:id])
    else
      render :edit
    end
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
    redirect_to user_clients_path(current_user.id,client_id:params[:client_id],project_id:params[:project_id])
  end

  private

  def item_params
    params.require(:item).permit(:item_name,:item_price,:item_amount,:item_info).merge(project_id: params[:project_id])
  end

end
