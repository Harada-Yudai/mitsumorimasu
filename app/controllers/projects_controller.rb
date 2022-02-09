class ProjectsController < ApplicationController

  def new
    @project= Project.new
    @client = Client.find(params[:client_id])
  end

  def create
    @project = Project.new(project_params)
    @client = Client.find(params[:client_id])
    if @project.save
      redirect_to user_clients_path(current_user.id,client_id:@client.id)
    else
      render :new
    end
  end

  def edit
    @project= Project.find(params[:id])
    @client = Client.find(params[:client_id])
  end

  def update
    @project = Project.find(params[:id])
    @client = Client.find(params[:client_id])
    @project.update(project_params)
    if @project.save
      redirect_to user_clients_path(current_user.id,client_id:@client.id)
    else
      render :edit
    end
  end
  private

  def project_params
    params.require(:project).permit(:pro_day,:pro_number,:pro_name,:pro_info).merge(user_id: current_user.id, client_id: params[:client_id])
  end

end
