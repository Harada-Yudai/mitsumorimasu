class ItemsController < ApplicationController

  def new
    @item= Item.new
    @client = Client.find(params[:client_id])
    @project = Project.find(params[:project_id])
  end

  def create
    @item = Item.new(item_params)
    @project = Project.find(params[:project_id])
    if @item.save
      redirect_to user_clients_path(current_user.id,client_id:@project.client_id,project_id:@project.id)
    else
      render :new
    end
  end

  def edit
    @item= Item.find(params[:id])
    @client = Client.find(params[:client_id])
    @project = Project.find(params[:project_id])
  end

  private

  def item_params
    params.require(:item).permit(:item_name,:item_price,:item_amount,:item_info).merge(project_id: params[:project_id])
  end

end
