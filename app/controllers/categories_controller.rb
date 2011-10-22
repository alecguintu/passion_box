class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end
  
  def new
    @category = Category.new
  end
  
  def create
    @category = Category.new(params[:category])
    if @category.save
      flash[:success] = 'Category created'
      redirect_to categories_path
    else
      render :new
    end
  end
end
