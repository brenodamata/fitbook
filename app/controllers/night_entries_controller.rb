class NightEntriesController < ApplicationController
  before_action :set_night_entry, only: [:show, :edit, :update, :destroy]

  def index
    @night_entries = current_user.journal.night_entries
  end

  def show
  end

  def new
    @night_entry = NightEntry.new
    @night_entry.entry_date = Date.parse params[:date] if params[:date]
  end

  def edit
  end

  def create
    @night_entry = NightEntry.new(night_entry_params)
    @night_entry.entry_date = Date.today if @night_entry.entry_date.nil?

    respond_to do |format|
      if @night_entry.save
        journal = Journal.last
        journal.set_night_entry(@night_entry.id)
        format.html { redirect_to @night_entry, notice: 'Night entry was successfully created.' }
        format.json { render :show, status: :created, location: @night_entry }
      else
        format.html { render :new }
        format.json { render json: @night_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @night_entry.update(night_entry_params)
        format.html { redirect_to @night_entry, notice: 'Night entry was successfully updated.' }
        format.json { render :show, status: :ok, location: @night_entry }
      else
        format.html { render :edit }
        format.json { render json: @night_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @night_entry.destroy
    respond_to do |format|
      format.html { redirect_to night_entries_url, notice: 'Night entry was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_night_entry
      @night_entry = NightEntry.find(params[:id])
    end

    def night_entry_params
      params.require(:night_entry).permit(:weight, :bodyfat, :bmi, :calories_burned, :entry_date, :journal_id)
    end
end
