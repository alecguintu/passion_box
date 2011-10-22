class BoxesController < ApplicationController
  def index
    @boxes = current_user.box
  end

  def new
    @box = Box.new
  end

  def create
    @box = current_user.boxes.new(params[:box])
    if @box.save
      redirect_to user_path(current_user), :notice => "Successfully created collection."
    else
      render :new
    end
  end

  def show
    @box = current_user.boxes.where(:_id => params[:id]).first
    @box_items = @box.user_items unless @box.nil?
  end
  
  def edit
    @box = Box.find(params[:id])
  end

  def update
    @box = Box.find(params[:id])
    if @box.update_attributes(params[:box])
      redirect_to user_path(current_user)
    else
      render :edit
    end
  end

  def destroy
  end

end
