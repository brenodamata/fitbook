class SupplementsController < ApplicationController
  before_action :set_supplement, only: [:show, :edit, :update, :destroy]

  def index
    @supplements = Supplement.all
  end

  def show
  end

  def new
    @supplement = Supplement.new
  end

  def edit
  end

  def create
    @supplement = Supplement.new(supplement_params)

    respond_to do |format|
      if @supplement.save
        format.html { redirect_to @supplement, notice: 'Supplement was successfully created.' }
        format.json { render :show, status: :created, location: @supplement }
      else
        format.html { render :new }
        format.json { render json: @supplement.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @supplement.update(supplement_params)
        format.html { redirect_to @supplement, notice: 'Supplement was successfully updated.' }
        format.json { render :show, status: :ok, location: @supplement }
      else
        format.html { render :edit }
        format.json { render json: @supplement.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @supplement.destroy
    respond_to do |format|
      format.html { redirect_to supplements_url, notice: 'Supplement was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_supplement
      @supplement = Supplement.find(params[:id])
    end

    def supplement_params
      params.require(:supplement).permit(:name, :brand, :supplement_category_id, :supplement_sub_category_id, :servings)
    end
end
