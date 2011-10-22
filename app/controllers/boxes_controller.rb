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
      redirect_to user_path(current_user), :success => "Successfully created collection."
    else
      render :new
    end
  end

  def show
    @box = current_user.boxes.where(:_id => params[:id]).first
    @box_items = @box.user_items unless @box.nil?
  end
  
  def edit
  end

  def update
  end

  def destroy
  end

end
