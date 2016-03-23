class SupplementCategoriesController < ApplicationController
  before_action :set_supplement_category, only: [:show, :edit, :update, :destroy]

  def index
    @supplement_categories = SupplementCategory.all
  end

  def show
    @supplements = @supplement_category.supplements
  end

  def new
    @supplement_category = SupplementCategory.new
  end

  def edit
  end

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

  def destroy
    @supplement_category.destroy
    respond_to do |format|
      format.html { redirect_to supplement_categories_url, notice: 'Supplement category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_supplement_category
      @supplement_category = SupplementCategory.find(params[:id])
    end

    def supplement_category_params
      params.require(:supplement_category).permit(:name)
    end
end
