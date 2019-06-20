class Admin::CheckusersController < ApplicationController

  before_action :authenticate_user!
  before_action :check_if_admin
  before_action :set_user, only: [:show, :edit, :destroy, :update]

  def index
  @users = User.all
  end

  def show
  end

  def edit
  end

  def update

    @user.update(is_admin: true)

    flash[:alert] = "User is now Admin."
    redirect_to admin_checkusers_path

  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to admin_root_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def authenticate_user
    unless current_user
        flash[:danger] = "Please sign in!"
        redirect_to user_session_path
    end
  end

  def check_if_admin
    unless current_user.is_admin == true
      redirect_to root_path
      flash[:danger] = "Only admins can access."
    end
  end

  def set_user
      @user = User.find(params[:id])
  end

  def user_params
      params.require(:user).permit(:description, :first_name, :last_name, :avatar, :email, :password)
  end
end
