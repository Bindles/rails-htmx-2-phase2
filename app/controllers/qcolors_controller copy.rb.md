class QcolorsController < ApplicationController
  before_action :set_qcolor, only: %i[ show edit update destroy ]

  # GET /qcolors or /qcolors.json
  def index
    @qcolors = Qcolor.all
  end

  # GET /qcolors/1 or /qcolors/1.json
  def show
  end

  # GET /qcolors/new
  def new
    @qcolor = Qcolor.new
  end

  # GET /qcolors/1/edit
  def edit
    @qcolor = Qcolor.find(params[:id])
    respond_to do |format|
      format.html # fallback for non-Turbo requests
      format.turbo_stream
    end
  end

  # POST /qcolors or /qcolors.json
  def create
    @qcolor = Qcolor.new(qcolor_params)

    respond_to do |format|
      if @qcolor.save
        format.turbo_stream
        format.html { redirect_to qcolor_url(@qcolor), notice: "Qcolor was successfully created." }
        format.json { render :show, status: :created, location: @qcolor }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @qcolor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /qcolors/1 or /qcolors/1.json
  def update
    respond_to do |format|
      if @qcolor.update(qcolor_params)
        format.html { redirect_to qcolor_url(@qcolor), notice: "Qcolor was successfully updated." }
        format.json { render :show, status: :ok, location: @qcolor }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @qcolor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /qcolors/1 or /qcolors/1.json
  def destroy
    @qcolor = Qcolor.find(params[:id])
    @qcolor.destroy!

    respond_to do |format|
      format.turbo_stream      
      format.html { redirect_to qcolors_url, notice: "Qcolor was successfully destroyed." }
      format.json { head :no_content }
    end
  end
  # def destroy
  #   @socolor = Socolor.find(params[:id])
  #   @socolor.destroy
  
  #   respond_to do |format|
  #     format.html { redirect_to socolors_url, notice: "Color was successfully destroyed." }
  #     format.turbo_stream
  #   end
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_qcolor
      @qcolor = Qcolor.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def qcolor_params
      params.require(:qcolor).permit(:name, :value)
    end
end
