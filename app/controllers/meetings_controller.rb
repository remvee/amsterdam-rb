class MeetingsController < ApplicationController
  layout 'admin'
  before_filter :authenticate if RAILS_ENV == 'production'

  def index
    @meetings = Meeting.paginate(:page => params[:page])
  end

  def new
    @meeting = Meeting.new
  end

  def create
    @meeting = Meeting.new(params[:meeting])
    @meeting.save ? redirect_to(:action => :index) : render(:action => :new)
  end

  def edit
    @meeting = Meeting.find(params[:id])
  end

  def update
    @meeting = Meeting.find(params[:id])
    @meeting.update_attributes(params[:meeting]) ? redirect_to(:action => :index) : render(:action => :edit)
  end

  def destroy
    Meeting.destroy(params[:id])
    redirect_to :action => :index
  end
end
