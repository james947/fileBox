class ResourcesController < ApplicationController
  def index
    if current_user
      @resources = Resource.all.order(created_at: :desc).limit(5)
      @resource = Resource.new
    else
      redirect_to root_path
    end
  end

  def show
    @resource = Resource.find(params[:id])
  end

  def create
    @resource = Resource.new(resource_params)
    if @resource.save
      flash[:success] = 'The file was uploaded successfully'
      @resource.image.service_url
      redirect_to resources_path
    else
      flash[:errors] = @resource.errors.full_messages
    end
  end

  private

  def resource_params
    params.require(:resource).permit(:image)
  end
end
