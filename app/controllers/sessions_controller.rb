class SessionController < ApplicationController
  skip_before_action :authenticate_user!

  def create
    
  end
end