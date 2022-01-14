class ApplicationController < ActionController::API
  include ActionController::Cookies
  rescue_from ActiveRecord::RecordInvalid, with: :invalid_record
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def invalid_record e
      render json: { errors: e.record.errors.full_messages }, status: :unprocessable_entity
  end

  def record_not_found e
      render json: { error: e.message }, status: :not_found
  end

end
