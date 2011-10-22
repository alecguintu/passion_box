class ItemsController < ApplicationController
  def index
    @items = UserItem.all
  end

  def new
    @item = UserItem.new
  end

  def create
    @box = current_user.boxes.find(params[:id])
    @item = @box.user_items.new(params[:user_item])
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
