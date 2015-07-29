class WelcomeController < ApplicationController
  def index
        @guests = Guest.all.order('attending')
  end

  def show
  end
end
