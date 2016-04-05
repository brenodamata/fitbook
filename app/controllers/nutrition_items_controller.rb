class NutritionItemsController < ApplicationController
  before_action :set_nutrition_item, only: [:show, :edit, :update, :destroy]

  # GET /nutrition_items
  # GET /nutrition_items.json
  def index
    @nutrition_items = NutritionItem.all
  end

  # GET /nutrition_items/1
  # GET /nutrition_items/1.json
  def show
  end

  # GET /nutrition_items/new
  def new
    @nutrition_item = NutritionItem.new
  end

  # GET /nutrition_items/1/edit
  def edit
  end

  # POST /nutrition_items
  # POST /nutrition_items.json
  def create
    @nutrition_item = NutritionItem.new(nutrition_item_params)

    respond_to do |format|
      if @nutrition_item.save
        format.html { redirect_to @nutrition_item, notice: 'Nutrition item was successfully created.' }
        format.json { render :show, status: :created, location: @nutrition_item }
      else
        format.html { render :new }
        format.json { render json: @nutrition_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /nutrition_items/1
  # PATCH/PUT /nutrition_items/1.json
  def update
    respond_to do |format|
      if @nutrition_item.update(nutrition_item_params)
        format.html { redirect_to @nutrition_item, notice: 'Nutrition item was successfully updated.' }
        format.json { render :show, status: :ok, location: @nutrition_item }
      else
        format.html { render :edit }
        format.json { render json: @nutrition_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /nutrition_items/1
  # DELETE /nutrition_items/1.json
  def destroy
    @nutrition_item.destroy
    respond_to do |format|
      format.html { redirect_to nutrition_items_url, notice: 'Nutrition item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_nutrition_item
      @nutrition_item = NutritionItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def nutrition_item_params
      params.require(:nutrition_item).permit(:name, :unit_of_measure)
    end
end
