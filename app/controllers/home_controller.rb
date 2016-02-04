class HomeController < ApplicationController
  skip_before_filter :authorize

  def welcome
  end
end
