class DayEntriesController < ApplicationController
  before_action :set_day_entry, only: [:show, :edit, :update, :destroy]

  def index
    @day_entries = current_user.journal.day_entries
  end

  def show
  end

  def new
    @day_entry = DayEntry.new
    @day_entry.entry_date = Date.parse params[:date] if params[:date]
  end

  def edit
  end

  def create
    @day_entry = DayEntry.new(day_entry_params)
    @day_entry.entry_date = Date.today if @day_entry.entry_date.nil?

    respond_to do |format|
      if @day_entry.save
        journal = Journal.last
        journal.set_day_entry(@day_entry.id)
        format.html { redirect_to @day_entry, notice: 'Day entry was successfully created.' }
        format.json { render :show, status: :created, location: @day_entry }
      else
        format.html { render :new }
        format.json { render json: @day_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @day_entry.update(day_entry_params)
        format.html { redirect_to @day_entry, notice: 'Day entry was successfully updated.' }
        format.json { render :show, status: :ok, location: @day_entry }
      else
        format.html { render :edit }
        format.json { render json: @day_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @day_entry.destroy
    respond_to do |format|
      format.html { redirect_to day_entries_url, notice: 'Day entry was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_day_entry
      @day_entry = DayEntry.find(params[:id])
    end

    def day_entry_params
      params.require(:day_entry).permit(:weight, :bodyfat, :bmi, :minutes_of_sleep, :entry_date, :journal_id)
    end
end
