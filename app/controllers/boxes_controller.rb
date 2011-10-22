class BoxesController < ApplicationController
  def index
    @boxes = current_user.boxes
  end
  
  def my_boxes
  end
  
  def show
    @box = current_user.boxes.where(:_id => params[:id]).first
    @box_items = @box.user_items unless @box.nil?
  end

  def new
    @box = Box.new
    @box.category = Category.find(params[:category_id])
  end

  def create
    @box = current_user.boxes.new(params[:box])
    if @box.save
      flash[:success] = 'Collection created yeah!'
      redirect_to my_boxes_path
    else
      render :new
    end
  end

  def show
    @box = current_user.boxes.where(:_id => params[:id]).first
  end
  
  def edit
    @box = Box.find(params[:id])
    @box_items = @box.user_items unless @box.nil?
  end

  def update
    @box = Box.find(params[:id])
    if @box.update_attributes(params[:box])
      flash[:success] = 'Awesome update!'
      redirect_to my_boxes_path
    else
      render :edit
    end
  end
 
  def destroy
  end

  def gallery
    respond_to do |r|
      r.xml
    end
  end

end
