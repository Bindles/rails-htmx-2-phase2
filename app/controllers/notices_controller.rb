# app/controllers/notices_controller.rb
class NoticesController < ApplicationController


  def sho
    flash_type = params[:type] || 'notice'

    # Customize the message and type based on your logic
    @message = case flash_type
              when 'success'
                'Great job! This is a success message.'
              when 'error'
                'Oops! Something went wrong.'
              else
                flash[flash_type]
              end

    respond_to do |format|
      format.html do
        render partial: 'shared/flash_notice', locals: { flash_type: flash_type, message: @message }
      end
      format.json { render json: { type: flash_type, message: @message }, status: :ok }
    end
  end


  def show
    flash_type = params[:type] || 'notice'
    
    # Customize the message based on your logic
    @message = case flash_type
      when 'success'
    'Great job! This is a success message.'
      when 'error'
          'Oops! Something went wrong.'
      else
        flash[flash_type]
      end

    respond_to do |format|
      format.html
      format.json { render json: { message: @message }, status: :ok }
    end
  end
  
end
