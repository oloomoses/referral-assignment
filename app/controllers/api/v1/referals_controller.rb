module Api
  module V1
    class ReferalsController < ApplicationController
      before_action :authenticate_user!

      def create
        referal = current_user.referals.create(referal_params)
        
        if referal.save
          render_resource(referal)
        else
          render json: referal.errors, status: :unprocessable_entity
        end
      end

      def referal_params
        params.permit(:email)
      end

    end
  end
end