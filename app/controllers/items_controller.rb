class ItemsController < ApplicationController

  def new
    @item= Item.new
    @client = Client.find(params[:client_id])
  end



end
