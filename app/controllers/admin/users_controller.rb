# frozen_string_literal: true

module Admin
  class UsersController < Admin::BaseController
    before_action :set_user, only: %i[show edit update destroy]
    rescue_from ActiveRecord::RecordNotFound, with: :redirect_to_users

    def index
      @users = User.all
    end

    def show; end

    def edit; end

    def create
      @user = User.new(user_params)

      if @user.save
        redirect_to [:admin, @user]
      else
        render :new, status: :unprocessable_entity
      end
    end

    def update
      if @user.update(user_params)
        redirect_to [:admin, @user]
      else
        render :new, status: :unprocessable_entity
      end
    end

    def destroy
      @user.destroy
      redirect_to_users
    end

    private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:first_name, :last_name)
    end

    def redirect_to_users
      redirect_to admin_users_path
    end
  end
end
