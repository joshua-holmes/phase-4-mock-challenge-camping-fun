class CampersController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

    def index
        render json: Camper.all, inlcude: ['signups.activites']
    end

    def show
        camper = Camper.find params[:id]
        render json: camper, serializer: CamperActivitySerializer
    end

    def create
        camper = Camper.create! camper_params
        render json: camper, status: :created
    end

    private

    def camper_params
        params.permit :name, :age
    end

    def record_not_found
        render json: { error: "Camper not found" }, status: :not_found
    end

end
