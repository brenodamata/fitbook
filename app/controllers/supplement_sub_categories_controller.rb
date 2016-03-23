class SupplementSubCategoriesController < ApplicationController
  before_action :set_supplement_sub_category, only: [:show, :edit, :update, :destroy]

  def index
    @supplement_sub_categories = SupplementSubCategory.all
  end

  def show
    @supplements = @supplement_sub_category.supplements
  end

  def new
    @supplement_sub_category = SupplementSubCategory.new
  end

  def edit
  end

  def create
    @supplement_sub_category = SupplementSubCategory.new(supplement_sub_category_params)

    respond_to do |format|
      if @supplement_sub_category.save
        format.html { redirect_to @supplement_sub_category, notice: 'Supplement sub category was successfully created.' }
        format.json { render :show, status: :created, location: @supplement_sub_category }
      else
        format.html { render :new }
        format.json { render json: @supplement_sub_category.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @supplement_sub_category.update(supplement_sub_category_params)
        format.html { redirect_to @supplement_sub_category, notice: 'Supplement sub category was successfully updated.' }
        format.json { render :show, status: :ok, location: @supplement_sub_category }
      else
        format.html { render :edit }
        format.json { render json: @supplement_sub_category.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @supplement_sub_category.destroy
    respond_to do |format|
      format.html { redirect_to supplement_sub_categories_url, notice: 'Supplement sub category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_supplement_sub_category
      @supplement_sub_category = SupplementSubCategory.find(params[:id])
    end

    def supplement_sub_category_params
      params.require(:supplement_sub_category).permit(:name, :supplement_category_id)
    end
end
