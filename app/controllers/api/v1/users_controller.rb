module Api
  module V1
    class UsersController < ApplicationController
      before_action :authenticate_user!
      before_action :set_user, only: %[show]


      def show
        if current_user.id == @user.id
          render json: current_user
        else
          errors_not_authorized
        end
      end

      def set_user
        @user = User.find(params[:id])
      end

    end
  end
end