class ProfilesController < ApplicationController
before_action :set_user, only: [:show, :edit, :update]

  def show
    if @user.admin
      @locations = Location.where(approved: false)
      @events = Event.where(approved: false)
    else
      @locations = @user.locations
      @events = @user.events
    end
  end

  def edit
    authorize @user
  end

  def update
    authorize @user
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
