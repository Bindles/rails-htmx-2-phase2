class PokesController < ApplicationController
  before_action :set_poke, only: %i[ show edit update destroy ]

  # GET /poke or /poke.json
  def index
    @poke = Poke.all
  end

  require 'httparty'

  def fetch_poke
    response = HTTParty.get('https://pokeapi.co/api/v2/pokemon?limit=3')
    @pokemon_data = JSON.parse(response.body)
    flash[:success] = 'Pokemon successfully loaded!'
    respond_to do |format|
      format.html { render partial: 'poke_names' }
    end
  end


  # GET /poke/1 or /poke/1.json
  def show
  end

  # GET /poke/new
  def new
    @poke = Poke.new
  end

  # GET /poke/1/edit
  def edit
  end

  # POST /poke or /poke.json
  def create
    @poke = Poke.new(poke_params)

    respond_to do |format|
      if @poke.save
        format.html { redirect_to poke_url(@poke), notice: "Poke was successfully created." }
        format.json { render :show, status: :created, location: @poke }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @poke.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /poke/1 or /poke/1.json
  def update
    respond_to do |format|
      if @poke.update(poke_params)
        format.html { redirect_to poke_url(@poke), notice: "Poke was successfully updated." }
        format.json { render :show, status: :ok, location: @poke }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @poke.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /poke/1 or /poke/1.json
  def destroy
    @poke.destroy!

    respond_to do |format|
      format.html { redirect_to poke_url, notice: "Poke was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_poke
      @poke = Poke.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def poke_params
      params.require(:poke).permit(:name, :url)
    end
end
