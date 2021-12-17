class CampersController < ApplicationController
rescue ActiveRecord::RecordNotFound, with: :record_not_found
rescue ActiveRecord::RecordInvalid, with: :record_invalid

    def index
        render json: Camper.all
    end

    def show
        camper = Camper.find_by(params[:id])
        render json: camper
    end

    def create
        camper = Camper.create(camper_params)
        render json: camper, status: :created
    end


    private
    def record_not_found(exception)
        render json: {error: "#{exception.model} not found"}, status: :not_found
    end

    def camper_params
        params.permit(:name, :age)
    end

    def record_invalid(invalid)
        render json: {errors: invalid.record.errors.full_messages}, status: unprocessable_entity
    end

end