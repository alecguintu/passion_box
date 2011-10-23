class BoxesController < ApplicationController
  def index
    @boxes = current_user.boxes
  end
  
  def my_boxes

  end
  
  def new
    @box = Box.new
    @box.category = Category.find(params[:category_id])
  end

  def create
    @box = current_user.boxes.new(params[:box])
    if @box.save
      flash[:success] = 'Collection created yeah!'
      redirect_to box_path(@box.id)
    else
      render :new
    end
  end

  def show
    @box = Box.find(params[:id])
  end
  
  def edit
    @box = Box.find(params[:id])
    @box_items = @box.user_items
  end
  
  def edit_info
    @box = Box.find(params[:id])
    @box_items = @box.user_items unless @box.nil?
  end

  def update
    @box = Box.find(params[:id])
    if @box.update_attributes(params[:box])
      flash[:success] = 'Awesome update!'
      redirect_to box_path(@box)
    else
      render :edit
    end
  end
 
  def destroy
  end

  def gallery
    @box = Box.find(params[:id])
    @template = @box.category.template
    respond_to do |r|
      r.xml
    end
  end

end
