class IncrivelController < ApplicationController
  before_action :set_full_width_layout
  def index
    @full_width_layout = true
  end

  def set_full_width_layout
    @full_width_layout = true
  end 
end
