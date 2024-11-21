class WheelcolorsController < ApplicationController
  before_action :set_wheelcolor, only: %i[ show edit update destroy ]

  # GET /wheelcolors or /wheelcolors.json
  def index
    @wheelcolors = Wheelcolor.all
  end

  # GET /wheelcolors/1 or /wheelcolors/1.json
  def show
  end

  # GET /wheelcolors/new
  def new
    @wheelcolor = Wheelcolor.new
  end

  # GET /wheelcolors/1/edit
  def edit
  end

  # POST /wheelcolors or /wheelcolors.json
  def create
    Rails.logger.debug "Request format: #{request.format}"

    @wheelcolor = Wheelcolor.new(wheelcolor_params)

    respond_to do |format|
      if @wheelcolor.save
        format.html { redirect_to wheelcolor_url(@wheelcolor), notice: "Wheelcolor was successfully created." }
        #format.json { render :show, status: :created, location: @wheelcolor }
        format.turbo_stream
      else
        format.html { render :new, status: :unprocessable_entity }
        #format.json { render json: @wheelcolor.errors, status: :unprocessable_entity }
        format.turbo_stream { render turbo_stream: turbo_stream.append('wheelcolors_list', partial: 'wheelcolors/wheelcolor', locals: { wheelcolor: @wheelcolor }), status: :unprocessable_entity }
      end
      Rails.logger.debug "Responding with Turbo Stream" if request.format.turbo_stream?

    end
  end

  # PATCH/PUT /wheelcolors/1 or /wheelcolors/1.json
  def update
    respond_to do |format|
      if @wheelcolor.update(wheelcolor_params)
        format.html { redirect_to wheelcolor_url(@wheelcolor), notice: "Wheelcolor was successfully updated." }
        format.json { render :show, status: :ok, location: @wheelcolor }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @wheelcolor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /wheelcolors/1 or /wheelcolors/1.json
  def destroy
    @wheelcolor.destroy!

    respond_to do |format|
      format.html { redirect_to wheelcolors_url, notice: "Wheelcolor was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_wheelcolor
      @wheelcolor = Wheelcolor.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def wheelcolor_params
      params.require(:wheelcolor).permit(:name, :value)
    end
end
