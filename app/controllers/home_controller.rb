class HomeController < ApplicationController
  protect_from_forgery with: :exception

  def index
    puts "hi"
  end



  private
    def getData

    end
end