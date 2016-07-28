class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)

    if user && user.authenticate(params[:session][:password])
      # redirect to user page
      flash[:success] = 'Successfully logged in yayzers'
      log_in(user)
      redirect_to user    # user automatically convered to route user_url(user)

    else
      #show error message
      flash.now[:danger] = 'Invalid email or password'
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    # add flash after log out
    flash[:info] = 'Come again!'
    redirect_to root_url
  end
end
