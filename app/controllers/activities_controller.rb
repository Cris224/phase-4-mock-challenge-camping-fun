class ActivitiesController < ApplicationController

rescue ActiveRecord::RecordNotFound, with: :record_not_found

    def index
        render json: Activity.all
    end

    def destroy
        activity = Activity.find_by(params[:id])
        acitivity.destroy
        render json: {}, status: :gone
    end

    private
    def record_not_found(exception)
        render json: {error: "#{exception.model} not found"}, status: :not_found
    end

end
