class SignupsController < ApplicationController

    def create
        camper = Camper.find params[:camper_id]
        activity = Activity.find params[:activity_id]
        signup = Signup.create! time: params[:time], camper_id: camper.id, activity_id: activity.id
        render json: activity, status: :created
    end

    private

    def signup_params
        params.permit :time, :camper_id, :activity_id
    end
end
