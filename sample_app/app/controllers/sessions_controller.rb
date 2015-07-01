class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      # Go the sign up page
    else
      # render a flash message
      render 'new'
    end
  end

  def destroy
  end
end
