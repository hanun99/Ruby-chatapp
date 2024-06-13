class UsersController < ApplicationController
  before_action :check_sign_out, only: [:show]
 # before_action :set_user, except: [:index, :new, :create]
  after_action :notify_admins, only: [:create] 

  private

  def check_sign_out
    if params[:id] == 'sign_out'
      # Handle sign out logic here
      # For example, you could redirect to the sign in page
      redirect_to new_user_session_path, notice: 'You have been signed out.'
    end
  end

  def show
    if params[:id] == 'sign_out'
      # Handle sign out logic here
      # For example, you could redirect to the sign in page
      redirect_to new_user_session_path, notice: 'You have been signed out.'
    else
      # Find user by ID from params
      @user = User.find(params[:id])
      render 'index'
    end
end

  
end
