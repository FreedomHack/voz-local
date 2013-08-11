class DisplayController < ApplicationController
  
  def index
      
  end


  # The dashboard is the place to hang out after logging in
  def dashboard
      
      # Get the last 10 messages from the db
      @messages = Message.find(:all, :order => 'id desc', :limit => 20).reverse

  end


end