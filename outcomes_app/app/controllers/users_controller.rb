class UsersController < ApplicationController
  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login(@user)
      redirect_to users_url
    else
      flash[:errors] = @user.errors.full_messages
      render :new, status: 422
    end

  end

  def update
  end

  def edit
  end

  def destroy
  end

  def show
  end

  def index
  end

  def user_params
    params.require(:user).permit(:username, :password)
  end

end
