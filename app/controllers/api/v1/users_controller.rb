module Api
  module V1
    class UsersController < ApplicationController
      before_action :authenticate_user!
      before_action :set_user, only: %(show)

      def show
        if current_user == @user
          render json: current_user, include: :referals, status: 200
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
