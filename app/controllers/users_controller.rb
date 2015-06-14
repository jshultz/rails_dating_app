class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    gender = @user == 0 ? 1 : 0
    @people = User.where.not(id: @user.id, gender: gender)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome to the Dating App!"
      redirect_to @user
    else
      render 'new'
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :gender, :password,
                                   :password_confirmation)
    end


end
