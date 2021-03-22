class UsersController < ApplicationController
   before_action :authenticate_user!
  # before_action :correct_user, only: [:edit, :update]
  
  
  
  def show
    @user = User.find(params[:id])
    @book = Book.new
   
    @books = Book.where(user_id: @user.id)
  end

  def index
    @user = current_user
    @users = User.page(params[:page]).reverse_order
    @book = Book.new
    @books = Book.all
  end

  def edit
     @user = User.find(params[:id])
  if @user == current_user
  else
    redirect_to user_path(current_user.id)
  end
  end 

  def update
     @user = User.find(params[:id])
       if  @user.update(user_params)
        flash[:notice] = "You have updated user successfully."

        redirect_to "/users/#{current_user.id}"
        else
        flash[:notice] = " errors prohibited this obj from being saved:"
            render :edit

       end
  end
  

  private
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
 
  # def correct_user
  #   @user = User.find(params[:id])
  #   redirect_to(user_url(current_user)) unless params[:id] == current_user.id
  # end 
  # def correct_user
  #     @user = User.find(params[:id])
  #     redirect_to(root_path) unless current_user?(@user)
  #   end
end
