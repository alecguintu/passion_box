class TemplatesController < ApplicationController
  def index
    @templates = Template.all
  end
  
  def new
    @template = Template.new
  end
  
  def create
    @template = current_user.templates.new(params[:template])
    if @template.save
      flash[:success] = 'Template created yo!'
      redirect_to templates_path
    else
      render :new
    end
  end
  
  def edit
    @template = Template.find(params[:id])
  end
  
  def update
    @template = Template.find(params[:id])
    if @template.update_attributes(params[:template])
      flash[:success] = 'Updated yo!'
      redirect_to edit_template_path(@template)
    else
      render :edit
    end
  end
end
