class ListsController < ApplicationController
  before_action :set_list, only: %i[show edit update destroy]

  def index
    @lists = List.all
  end

  def show; end

  def new
    @list = List.new
  end

  def edit; end

  def create
    @list = List.new(list_params)

    if @list.save
      turbo_stream
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @list.update(list_params)
      turbo_stream
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @list.destroy
    turbo_stream
  end

  private

  def set_list
    @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:name)
  end
end
