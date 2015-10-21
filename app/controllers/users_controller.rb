class UsersController < ApplicationController

  before_action :require_signed_out
  
  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(user_params)
    @user.reset_session_token!

    if @user.save
      login_user!(@user)
    else
      flash.now[:base] = @user.errors.full_messages
      render :new
    end
  end

  private

    def user_params
      params.require(:user).permit(:name,:password,:session_token)
    end
  end
