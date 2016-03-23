class UsersController < ApplicationController
  before_action :set_user#, except: [:supplements, :add_supplements]

  def show
  end

  def edit
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def supplements
    @user = User.find(params[:user_id])
    @supplements = @user.supplements
  end

  def add_supplements
    @supplements = Supplement.all
  end

  private
    def set_user
      if params[:user_id]
        @user = User.find(params[:user_id])
      else
        @user = User.find(params[:id])
      end
    end

    def user_params
      params.require(:user).permit(:username, :dob, :height, :sex, :activity_level)
    end
end
