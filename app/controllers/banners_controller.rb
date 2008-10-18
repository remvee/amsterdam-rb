class BannersController < ApplicationController
  layout 'admin'
  before_filter :authenticate if RAILS_ENV == 'production'

  def index
    @banners = Banner.paginate(:page => params[:page])
  end

  def new
    @banner = Banner.new
  end

  def create
    @banner = Banner.new(params[:banner])
    @banner.save ? redirect_to(:action => :index) : render(:action => :new)
  end

  def edit
    @banner = Banner.find(params[:id])
  end

  def update
    @banner = Banner.find(params[:id])
    @banner.update_attributes(params[:banner]) ? redirect_to(:action => :index) : render(:action => :edit)
  end

  def destroy
    Banner.destroy(params[:id])
    redirect_to :action => :index
  end
end
