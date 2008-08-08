class ImagesController < ApplicationController
  session :off

  def show
    @image = Image.find(params[:id])
    send_data @image.data, :type => @image.content_type, :disposition => 'inline'
  end
end
