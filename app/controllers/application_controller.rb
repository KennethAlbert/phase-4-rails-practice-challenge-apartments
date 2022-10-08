class ApplicationController < ActionController::API
rescue_from ActiveRecord::RecordInvalid, with: :show_errors
    
    
private
      
def show_errors e
render json:{error:  e.record.errors.messages}, status: :unprocessable_entity
end
end
