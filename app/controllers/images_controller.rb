class ImagesController < ApplicationController
  session :off
  caches_page :show

  def show
    @image = Image.find(params[:id])
    send_data @image.data, :type => @image.content_type, :disposition => 'inline'
  end
end
