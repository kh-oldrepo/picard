class HomeController < ApplicationController
  def index
    @encounters = Encounter.all
  end
end
