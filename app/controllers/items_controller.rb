# app/controllers/items_controller.rb

# app/controllers/items_controller.rb

class ItemsController < ApplicationController
  
  def index2
    @items = Item.all

    if params[:sort].present?
      @items = @items.order(params[:sort])
      render turbo_stream: turbo_stream.replace('items_list', partial: 'items/list', locals: { items: @items })
    end
  end

  def index
    @items = Item.all

    if params[:sort].present?
      @items = @items.order(params[:sort])
      render turbo_stream: turbo_stream.replace('items_list', partial: 'items/list', locals: { items: @items })
    end
  end
end
