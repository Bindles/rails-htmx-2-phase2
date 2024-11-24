class ColorsController < ApplicationController
  before_action :set_color, only: %i[show edit update destroy]

  def index
    @colors = Color.all
  end

  def new
    @color = Color.new
  end

  def create #same as new + (color_params) => if @color.save redirect_to
    @color = Color.new(color_params)
    if @color.save
      redirect_to color_url(@color), notice: 'Color created'
    end
  end

  def update
    if @color.update(color_params)
      redirect_to color_url(@color)
    end
  end

  def destroy
    @color.destroy!    
  end
  
  
  private
  def set_color
    @color = Color.find(params[:id])
  end
  def color_params
    params.require(:color).permit(:name, :value)
    
  end
  
end


