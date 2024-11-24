class ColorsController < ApplicationController
  before_action :set_color, only: %i[show edit update destroy]

  def index
    @colors = Color.all
  end
  def show
    
  end
  def new
    @color = Color.new
  end

  def create
    @color = Color.new(color_params)
    if @color.save
      redirect_to color_url(@color)
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
    params.require(:color).permit(:name, :body)
  end

  #RAILS 7
  def set_post
    @post = Post.find(params[:id])
  end
  def post_params
    params.require(:post).permit(:name, :body)
  end
  
  #RAILS 8
  def set_post
    @post = Post.find(params.expect(:id))
  end
  def post_params
    params.expect(post: [:name, :body])
  end  

  #RAILS 7
  def set_post
    @post = Post.find(params[:id])
  end
  #RAILS 8
  def set_post
    @post = Post.find(params.expect(:id))
  end

  #RAILS 7
  def post_params
    params.require(:post).permit(:name, :body)
  end
  #RAILS 8
  def post_params
    params.expect(post: [:name, :body])
  end    
  
end
