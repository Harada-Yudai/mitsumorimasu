class ProjectsController < ApplicationController

  def new
    @project= Project.new
    @client = Client.find(params[:client_id])
  end

  def create
    @project = Project.new(project_params)
    @client = Client.find(params[:client_id])
    if @project.save
      new_project = Project.order(created_at: :desc).find_by(params[:client_id])
      redirect_to user_clients_path(current_user.id,client_id:@client.id,project_id:new_project.id)
    else
      render :new
    end
  end

  def edit
    @project= Project.find(params[:id])
    @client = Client.find(params[:client_id])
    if params[:item_id].blank?
    else
      @item = Item.find(params[:item_id])
    end
  end

  def update
    @project = Project.find(params[:id])
    @client = Client.find(params[:client_id])
    @project.update(project_params)
    if @project.save
      redirect_to  user_clients_path(client_id:@client.id,project_id: params[:id],item_id: params[:item_id])
    else
      render :edit
    end
  end

  def destroy
    project = Project.find(params[:id])
    project.destroy
    redirect_to user_clients_path(current_user.id,client_id:params[:client_id])
  end
  private

  def project_params
    params.require(:project).permit(:pro_name,:pro_info).merge(user_id: current_user.id, client_id: params[:client_id])
  end

end
