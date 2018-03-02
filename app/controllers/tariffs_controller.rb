class TariffsController < ApplicationController
  before_action :set_tariff, only: [:show]

  # GET /tariffs
  # GET /tariffs.json
  def index
     if params[:country] && params[:zip] && params[:weight]
       @tariffs = Tariff.where('country LIKE ?', "%#{params[:country]}%").where('zip LIKE ?', "%#{params[:zip]}%").where('weight >= ?', "#{params[:weight]}").limit(1)
     else
       @tariffs = Tariff.all.limit(0)
       # TODO redirect to search page
     end
  end

  # GET /tariffs/1
  # GET /tariffs/1.json
  def show
  end

  # GET /tariffs/new
  def new
    @tariff = Tariff.new
  end

  # GET /tariffs/1/edit
  def edit
  end

  # POST /tariffs
  # POST /tariffs.json
  def create
    @tariff = Tariff.new(tariff_params)

    respond_to do |format|
      if @tariff.save
        format.html { redirect_to @tariff, notice: 'Tariff was successfully created.' }
        format.json { render :show, status: :created, location: @tariff }
      else
        format.html { render :new }
        format.json { render json: @tariff.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tariffs/1
  # PATCH/PUT /tariffs/1.json
  def update
    respond_to do |format|
      if @tariff.update(tariff_params)
        format.html { redirect_to @tariff, notice: 'Tariff was successfully updated.' }
        format.json { render :show, status: :ok, location: @tariff }
      else
        format.html { render :edit }
        format.json { render json: @tariff.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tariffs/1
  # DELETE /tariffs/1.json
  def destroy
    @tariff.destroy
    respond_to do |format|
      format.html { redirect_to tariffs_url, notice: 'Tariff was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def import
    params.permit(:country, :zip, :weight, :price, :carrier, :expire, :transit_time, :loading_region)
    Tariff.import(params[:file])
    redirect_to tariffs_path, notice: "Tariffs upload succeed"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tariff
      @tariff = Tariff.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tariff_params
      params.require(:country).permit(:country, :zip, :weight, :loading_region)
    end
end
