class SignupsController < ApplicationController
rescue ActiveRecord::RecordInvalid, with: :record_invalid

    def create
        signup = Signup.create(signup_params)
        render json: signup.acitivity, status: :created
    end

    private

    def signup_params
        params.permit(:time, :acitivity_id, :camper_id)
    end

    def record_invalid(invalid)
        render json: {errors: invalid.record.errors.full_messages}, status: unprocessable_entity
    end
end