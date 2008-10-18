class WelcomeController < ApplicationController
  session :off

  def index
    @meeting = Meeting.next
  end
end
