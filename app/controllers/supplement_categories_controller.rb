class SupplementCategoriesController < ApplicationController
  before_action :set_supplement_category, only: [:show, :edit, :update, :destroy]

  # GET /supplement_categories
  # GET /supplement_categories.json
  def index
    @supplement_categories = SupplementCategory.all
  end

  # GET /supplement_categories/1
  # GET /supplement_categories/1.json
  def show
  end

  # GET /supplement_categories/new
  def new
    @supplement_category = SupplementCategory.new
  end

  # GET /supplement_categories/1/edit
  def edit
  end

  # POST /supplement_categories
  # POST /supplement_categories.json
  def create
    @supplement_category = SupplementCategory.new(supplement_category_params)

    respond_to do |format|
      if @supplement_category.save
        format.html { redirect_to @supplement_category, notice: 'Supplement category was successfully created.' }
        format.json { render :show, status: :created, location: @supplement_category }
      else
        format.html { render :new }
        format.json { render json: @supplement_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /supplement_categories/1
  # PATCH/PUT /supplement_categories/1.json
  def update
    respond_to do |format|
      if @supplement_category.update(supplement_category_params)
        format.html { redirect_to @supplement_category, notice: 'Supplement category was successfully updated.' }
        format.json { render :show, status: :ok, location: @supplement_category }
      else
        format.html { render :edit }
        format.json { render json: @supplement_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /supplement_categories/1
  # DELETE /supplement_categories/1.json
  def destroy
    @supplement_category.destroy
    respond_to do |format|
      format.html { redirect_to supplement_categories_url, notice: 'Supplement category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_supplement_category
      @supplement_category = SupplementCategory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def supplement_category_params
      params.require(:supplement_category).permit(:name)
    end
end
