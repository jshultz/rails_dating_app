class UsersController < ApplicationController

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

  def edit
    @user = User.find current_user.id
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    gender = @user == 0 ? 1 : 0
    @people = User.where.not(id: @user.id, gender: gender)
  end

  def update
    @user = User.find current_user.id
    if @user.update(user_params)
      flash[:success] = 'Your profile was updated'
      redirect_to @user
    else
      flash[:error] = 'Your profile was not updated. There was errors.'
      render 'edit'
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :gender, :password,
                                   :password_confirmation, :city, :birth_date)
    end


end
