class PosController < ApplicationController
  before_action :set_po, only: %i[ show edit update destroy ]
  
  def fetch_pot()
    @limit=12
    response = HTTParty.get('https://pokeapi.co/api/v2/pokemon?limit=6')
    @pokemon_data = JSON.parse(response.body)
    flash[:success] = 'Pokemon successfully loadedzz!'
    # Access the @po instance created in the 'new' action
    # @po = instance_variable_get(:@po)
    # puts @po
    # Retrieve the @po instance from the session
    @po = ObjectSpace._id2ref(session[:po_id])
    puts 'asasas'
    puts @po.inspect

    # Modify the @po instance
    @po.url = "HI"

    # Modify the @po instance
    #@po.url = "HI"

    
    render turbo_stream: turbo_stream.append('pokemon-list', partial: 'po_turbo_names', locals: { pokemon_data: @pokemon_data})
    # turbo_stream.append 'pokemon-list' do
    #   render partial: 'pokemon_turbo_names', locals: { pokemon_data: @pokemon_data }
    # end
  end
  

  # GET /pos or /pos.json
  def index
    @pos = Po.all
  end

  # GET /pos/1 or /pos/1.json
  def show
  end

  # GET /pos/new
  def new
    @po = Po.new
    session[:po_id] = @po.object_id
    # session[:new_po_id] = @po.id
    # #@po.url = "j"
    # @myvar = "AJSKAJSKAJSLKAJS"
    # session[:po_attributes] = @po.attributes
  end

  def fetch_pokemonx
    response = HTTParty.get('https://pokeapi.co/api/v2/pokemon?limit=3')
    @pokemon_data = JSON.parse(response.body)
    #@myvar = @pokemon_data
    puts "HIHIHIHIHIH"
    po_attributes = session[:po_attributes]
    puts po_attributes
    
    flash[:success] = 'Pokemon successfully loaded!'
    respond_to do |format|
      format.html { render partial: 'pokemon_names' }
    end
  end


  def clear_pokemonx
    @pokemon_data = { 'results' => [] }

    respond_to do |format|
      format.html { render partial: 'text_partial' }
    end
  end

  # GET /pos/1/edit
  def edit
    puts @po.name
  end

  # POST /pos or /pos.json
  def create
    @po = Po.new(po_params)

    respond_to do |format|
      if @po.save
        format.html { redirect_to po_url(@po), notice: "Po was successfully created." }
        format.json { render :show, status: :created, location: @po }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @po.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pos/1 or /pos/1.json
  def update
    respond_to do |format|
      if @po.update(po_params)
        format.html { redirect_to po_url(@po), notice: "Po was successfully updated." }
        format.json { render :show, status: :ok, location: @po }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @po.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pos/1 or /pos/1.json
  def destroy
    @po.destroy!

    respond_to do |format|
      format.html { redirect_to pos_url, notice: "Po was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_po
      @po = Po.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def po_params
      params.require(:po).permit(:name, :url)
    end
end
