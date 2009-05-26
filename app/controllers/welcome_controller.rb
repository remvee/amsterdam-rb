class WelcomeController < ApplicationController
  def index
    @meeting = Meeting.next
  end
end
