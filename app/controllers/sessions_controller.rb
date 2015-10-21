class SessionsController < ApplicationController

  before_action :require_signed_out
  skip_before_action :require_signed_out, only: :destroy
  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.find_by_credentials(params[:user][:name], params[:user][:password])
    if @user
      login_user!(@user)
    else
      flash.now[:errors] = "invalid login credientials!"
      new
    end
  end

  def destroy
    @user = current_user
    @user.reset_session_token! if @user
    session[:session_token] = nil
    redirect_to(new_sessions_url)
  end


end
