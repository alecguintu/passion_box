class ItemsController < ApplicationController
  def index
    @items = UserItem.all
  end

  def new
    @item = UserItem.new
  end

  def create
    @box = Box.find(params[:box_id])
    @item = @box.user_items.new(params[:user_item])
    if @item.save
      redirect_to box_path(@box)
    else
      render :new
    end
  end

  def edit
    @item = UserItem.find(params[:id])
  end

  def update
    @item = UserItem.find(params[:id])
    if @item.update_attributes(params[:user_item])
      redirect_to items_path
    else
      render :edit
    end
  end

  def destroy
    @item = UserItem.find(params[:id])
    @item.destroy
      redirect_to items_path
    end

end
