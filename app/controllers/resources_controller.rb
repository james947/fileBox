class ResourcesController < ApplicationController

  def new
    @resource = Resource.new
  end

  def show
    @resource = Resource.find(params[:id])
  end

  def create
    @resource = Resource.new(resource_params)
    if @resource.save
      flash[:success] = 'The post was created!'
    else
      flash[:errors] = @resource.errors.full_messages
    end
  end

  private

  def resource_params
    params.require(:resource).permit(:image)
  end
end
