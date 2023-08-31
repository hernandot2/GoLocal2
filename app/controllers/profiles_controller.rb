class ProfilesController < ApplicationController
before_action :set_user, only: [:show, :edit, :update]

  def show
    @locations = @user.locations
    @events = @user.events
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to profile_path(@user), notice: 'Dados atualizados com sucesso!'
    else
      render :edit
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :name, :description, :photo)
  end
end
