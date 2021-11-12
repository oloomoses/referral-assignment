module Api
  module V1
    class ReferalsController < ApplicationController
      before_action :authenticate_user!
      # before_action :set_user, only: %[show]


      def create
        referal = current_user.create(referal_params)
        
        if referal.save
          render_resource(resource)
        else
          render json: task.errors, status: :unprocessable_entity
        end
      end

      def referal_params
        params.require(:referal).permit(:email)
      end

    end
  end
end