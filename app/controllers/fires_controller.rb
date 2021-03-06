class FiresController < ApplicationController
  before_action :set_fire, only: [:show, :edit, :update, :destroy]

  # GET /fires
  # GET /fires.json
  def index
    @fires = Fire.all
    @fires = Fire.search(params[:search])
    if @fires.count == 0
      @fires = Fire.joins(:location).where('locations.state = ?', "#{params[:search]}")
    #else
      #@fires = Fire.search(params[:search])
    end
  end

  
  
  

  # def search
  #   @fires = Fire.search(params[:search])
  # end

  # def index
  #   @fires = Fire.all
  # end
  # def search
  #   @fires = Fire.search(params[:search])
  # end

  # GET /fires/1
  # GET /fires/1.json
  def show
  @fire_to_show = Fire.find(params[:id]) 
  @this_loc_id = Fire.find(params[:id]).location_id
  @loc_name = Location.find(@this_loc_id).state
  end

  # GET /fires/new
  def new
    @fire = Fire.new
  end

  # GET /fires/1/edit
  def edit
  end

  # POST /fires
  # POST /fires.json
  def create
    @fire = Fire.new(fire_params)

    respond_to do |format|
      if @fire.save
        format.html { redirect_to @fire, notice: 'Fire was successfully created.' }
        format.json { render :show, status: :created, location: @fire }
      else
        format.html { render :new }
        format.json { render json: @fire.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fires/1
  # PATCH/PUT /fires/1.json
  def update
    respond_to do |format|
      if @fire.update(fire_params)
        format.html { redirect_to @fire, notice: 'Fire was successfully updated.' }
        format.json { render :show, status: :ok, location: @fire }
      else
        format.html { render :edit }
        format.json { render json: @fire.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fires/1
  # DELETE /fires/1.json
  def destroy
    @fire.destroy
    respond_to do |format|
      format.html { redirect_to fires_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fire
      @fire = Fire.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def fire_params
      params.require(:fire).permit(:started_by, :acres, :still_burning, :location_id, :search)
    end
end
