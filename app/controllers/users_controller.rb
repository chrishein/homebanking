class UsersController < ApplicationController
  load_and_authorize_resource

  def index
    @users = User.all.paginate(page: params[:page], per_page: 50)
  end

  def new
    @user = User.new
  end

  # GET /accounts/1/edit
  def edit
  end

  def show
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if params[:user][:password].blank?
      params[:user].delete(:password)
      params[:user].delete(:password_confirmation)
    end

    if @user.update_attributes(user_params)
      redirect_to users_path, :notice => "User updated."
    else
      redirect_to users_path, :alert => "Unable to update user."
    end
  end

  def update_password
    @user = User.find(current_user.id)
    if @user.update(params.require(:user).permit(:password, :password_confirmation))
      sign_in @user, :bypass => true
      redirect_to root_path
    else
      render "edit"
    end
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to users_path, :notice => "User deleted."
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :role, :client_ids => [])
  end
end
