class UsersController < ApplicationController

  def index
    if user_signed_in?
    @clients = Client.where(user_id: current_user.id).order('created_at DESC')
    end
  end

  def edit
  end

  def update
  end

end


