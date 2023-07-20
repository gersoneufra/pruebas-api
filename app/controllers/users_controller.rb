class UsersController < ApplicationController
  def index
    def index
      @users = User.all
      render json: @users, status: :ok
    end
  end

  def show
    @user = User.find(params[:id])
    render json: @user
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render json: user, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      render json: @user, status: 200
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @user
      @user.destroy
      render json: { notice: 'User deleted successfully!' }, status: 200
    else
      render json: { error: 'Unable to delete user.' }, status: 400
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :name)
  end
end
