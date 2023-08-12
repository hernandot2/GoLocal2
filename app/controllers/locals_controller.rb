class LocalsController < ApplicationController
  before_action :set_local, only: [:show, :edit, :update, :destroy]

  def index
    @locals = Local.all
  end

  def show
  end

  def new
    @local = Local.new
  end

  def create
    @local = Local.new(local_params)
    @local.user = current_user
    if @local.save
      redirect_to local_path, notice: "Local criado com sucesso!"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @local.update(local_params)
      redirect_to local_path, notice: "Local atualizado com sucesso!"
    else
      render :edit
    end
  end

  def destroy
    @local.destroy
    redirect_to locals_path, notice: "Local excluido com sucesso!"
  end

  private

  def local_params
    params.require(:local).permit(:name, :address, :description, :category)
  end

  def set_local
    @local = Local.find(params[:id])
  end
end
