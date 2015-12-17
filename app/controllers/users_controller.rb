class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  
  def show
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      session[:user_id] = @user.id
      render 'show'
    else
      render 'new'
    end
  end
  
  def edit
    if @user.id == session[:user_id]
      render 'edit'
    else
      redirect_to root_path
    end
  end
  
  def update
    if @user.id == session[:user_id]
      if @user.update(user_params)
        # 保存に成功した場合はユーザ画面へ戻す
        flash[:success] = "User information was revised."
        render 'show'
      else
        #保存に失敗した場合は編集画面に戻す
        render 'edit'
      end
    else
      # id違いの場合はエラーメッセージを出してトップページへ戻す
      flash[:danger] = "Your request couldn't accepted."
      redirect_to root_path
    end
  end
  
  private
  
  def set_user
    @user = User.find(params[:id])
  end
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :area, :comment)
  end

end
