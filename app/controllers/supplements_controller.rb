class SupplementsController < ApplicationController
  # before_action :set_supplement, only: [:show, :edit, :update, :destroy]
  before_action :set_supplement, except: [:index, :new, :create]

  def index
    @supplements = Supplement.all
  end

  def show
    @nutrition_infos = @supplement.nutrition_infos
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

  def nutrition
    @nutrition_items = NutritionItem.all
    @nutrition_info = NutritionInfo.new
  end

  def create_nutrition
    params[:nutrition].each do |ni, value|
      NutritionInfo.create(supplement: @supplement, nutrition_item: NutritionItem.find_by_name(ni), value: value) unless value.empty?
    end
    redirect_to supplement_path(@supplement)
  end

  private
    def set_supplement
      if params[:supplement_id]
        @supplement = Supplement.find(params[:supplement_id])
      else
        @supplement = Supplement.find(params[:id])
      end
    end

    def supplement_params
      params.require(:supplement).permit(:name, :brand, :supplement_category_id, :supplement_sub_category_id, :servings)
    end
end
