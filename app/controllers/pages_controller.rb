class PagesController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @tab = "1"
  end
  
  def user_profile
    
  end
end
