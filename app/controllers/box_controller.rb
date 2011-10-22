class BoxController < ApplicationController
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
    @box = Box.where(:id => params[:box]).first
  end
  
  def edit
  end

  def update
  end

  def destroy
  end

end
