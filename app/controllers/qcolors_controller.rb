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
      format.turbo_stream      
      format.html # fallback for non-Turbo requests
    end
  end

  # POST /qcolors or /qcolors.json
  def create
    @qcolor = Qcolor.new(qcolor_params)
    Rails.logger.debug "Form parameters: #{params.inspect}"

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
    @qcolor = Qcolor.find(params[:id])
    
    if @qcolor.update(qcolor_params)
      respond_to do |format|
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace("qcolor_#{@qcolor.id}", partial: "qcolors/qcolor", locals: { qcolor: @qcolor })
        end
        format.html { redirect_to @qcolor, notice: "Qcolor was successfully updated." }
      end
    else
      render :edit
    end
  end
  
  

  # DELETE /qcolors/1 or /qcolors/1.json
# DELETE /qcolors/1 or /qcolors/1.json
def destroy
  @qcolor = Qcolor.find(params[:id])
  @qcolor.destroy

  respond_to do |format|
    format.turbo_stream do
      render turbo_stream: turbo_stream.remove("qcolor_#{@qcolor.id}") # Remove the deleted color from the DOM
    end
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


  def move
    @qcolor = Qcolor.find(params[:id])
    other_qcolor = Qcolor.find(params[:new_id])
  
    # Swap IDs (or any other attribute being used for order)
    temp_id = @qcolor.id
    @qcolor.update!(id: other_qcolor.id)
    other_qcolor.update!(id: temp_id)
  
    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to qcolors_path, notice: "Colors swapped successfully." }
    end
  end
  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_qcolor
      @qcolor = Qcolor.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def qcolor_params
      params.require(:qcolor).permit(:name, :value, :category)
    end
end
