class ProfilesController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to profile_path(@user), notice: 'Dados atualizados com sucesso!'
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :name, :description, :photo)
  end
end
