class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])

    if user && user.authenticate(params[:session][:password])
      # Store user information in session
      session[:user_id] = user.id
      redirect_to root_path, notice: 'Login successful!'
    else
      flash.now[:alert] = 'Invalid email/password combination'
      render :new
    end
  end

  def destroy
    # Clear the user session
    session[:user_id] = nil
    redirect_to root_path, notice: 'Logged out!'
  end
end
