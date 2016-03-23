class UsersController < ApplicationController
  before_action :set_user, except: [:add_supplement_to_stack]

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
    @supplements = @user.supplement_usages
  end

  def add_supplements
    @supplements = Supplement.all
  end

  def add_supplement_to_stack
    @supplement = Supplement.find(params[:supplement_id])
    @stack = SupplementUsage.new(user: current_user, supplement: @supplement, start_date: Date.today)

    respond_to do |format|
      if @stack.save
        format.html { redirect_to user_supplements_path(current_user), notice: 'Supplement added to your stack!' }
      else
        format.html { redirect_to user_new_supplements_path(current_user), notice: 'could not save' }
        format.json { render json: @stack.errors, status: :unprocessable_entity }
      end
    end
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
