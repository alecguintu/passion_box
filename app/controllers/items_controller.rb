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
    @item = UserItem.find(params[:id])
  end

  def update
    @item = UserItem.find(params[:id])
    if @item.update_attributes(params[:user_item])
      redirect_to edit_item_path(@item)
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
