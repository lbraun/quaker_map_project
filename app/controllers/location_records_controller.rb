class LocationRecordsController < ApplicationController
  before_action :set_location_record, only: [:show, :edit, :update, :destroy]

  # GET /location_records
  # GET /location_records.json
  def index
    @location_records = LocationRecord.all
  end

  # GET /location_records/1
  # GET /location_records/1.json
  def show
  end

  # GET /location_records/new
  def new
    @location_record = LocationRecord.new
  end

  # GET /location_records/1/edit
  def edit
  end

  # POST /location_records
  # POST /location_records.json
  def create
    @location_record = LocationRecord.new(location_record_params)

    respond_to do |format|
      if @location_record.save
        format.html { redirect_to @location_record, notice: 'Location record was successfully created.' }
        format.json { render :show, status: :created, location: @location_record }
      else
        format.html { render :new }
        format.json { render json: @location_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /location_records/1
  # PATCH/PUT /location_records/1.json
  def update
    respond_to do |format|
      if @location_record.update(location_record_params)
        format.html { redirect_to @location_record, notice: 'Location record was successfully updated.' }
        format.json { render :show, status: :ok, location: @location_record }
      else
        format.html { render :edit }
        format.json { render json: @location_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /location_records/1
  # DELETE /location_records/1.json
  def destroy
    @location_record.destroy
    respond_to do |format|
      format.html { redirect_to location_records_url, notice: 'Location record was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_location_record
      @location_record = LocationRecord.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def location_record_params
      params.require(:location_record).permit(:location_type, :location_id, :start_date, :end_date, :latitude, :longitude, :address)
    end
end
