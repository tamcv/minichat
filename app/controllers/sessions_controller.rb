class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by('email': params[:email]);
    if @user
      if @user.authenticate(params[:password])
        flash[:success] = "Sign in successfully"
        session[:user_id] = @user.id
        redirect_to root_path
        return
      else
        flash.now[:error] = "Your password is not correct"
        render 'new'
      end
    else
      flash.now[:error] = "The user does not exist"
      render 'new'
    end
  end
  
  def destroy
    session[:user_id] = nil
    flash[:success] = "Loged out"
    redirect_to root_path
  end

  def callback
    if user = User.from_omniauth(env["omniauth.auth"])
      print user
    else
      print "user don't login facbook"
    end
  end

end
