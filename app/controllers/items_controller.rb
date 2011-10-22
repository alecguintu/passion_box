class ItemsController < ApplicationController
  def index
    @items = UserItem.all
  end

  def new
    @item = UserItem.new
  end

  def create
    @item = UserItem.new(params[:user_item])
    @item.user_id = current_user.id
    if @item.save
      redirect_to items_path
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @item = UserItem.find(params[:id])
    @item.destroy
      redirect_to items_path
    end

end
