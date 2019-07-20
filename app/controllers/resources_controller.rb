# frozen_string_literal: true

class ResourcesController < ApplicationController
  def index
    @resources = Resource.all.last(5)
    @resource = Resource.new
  end

  def show
    @resource = Resource.find(params[:id])
  end

  def create
    @resource = Resource.new(resource_params)
    if @resource.save
      @resource.image.service_url
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
