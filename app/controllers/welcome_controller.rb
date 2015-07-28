class WelcomeController < ApplicationController
  def index
  end

  def show
    @guests = Guest.all
  end
end
