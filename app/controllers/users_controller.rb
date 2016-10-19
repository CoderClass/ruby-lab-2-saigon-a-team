class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "User was created successfully"
      session[:user_id] = @user.id
      redirect_to users_path
    else
      flash[:error] = "Error: #{@user.errors.full_messages.to_sentence}"
      redirect_to users_path
    end 
  end

  def index
    @users = User.all.shuffle
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :image_url)
    end

end
