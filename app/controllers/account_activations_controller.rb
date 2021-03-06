class AccountActivationsController < ApplicationController
  def edit
    user = User.find_by(email: params[:email])
    if user && !user.activated? && user.authenticated?(:activation, params[:id])
      user.activate
      login user
      flash[:success] = 'Congrats you have just activated your account'
      redirect_to user
    else
      flash[:danger] = 'Invalid sign up link'
      redirect_to root_url
    end
  end
end
