class PositionsController < ApplicationController
  def new
    @position = Position.new
    6.times {
      @position.characteristics.build
    }
  end

  def create
    @position = Position.new(position_params)
    if @position.save
      redirect_to positions_path
    else
      render :new
    end
  end

  def edit
    @position = Position.find(params[:id])
    3.times {
      @position.characteristics.build
    }
  end

  def update
    @position = Position.find(params[:id])
    if @position.update_attributes(position_params)
      redirect_to positions_path
    else
      render :edit
    end
  end

  def index
    ratings = {}
    ratings
    @positions = Position.all.map do |position|
      {
        name: position.name,
        id: position.id,
        ratings: position.characteristics.each_with_object({}) { |c, hash| hash[c.name] = Rating.values[c.rating.value] }
      }
    end
  end

  private

  def position_params
    params.require(:position).permit(:name, characteristics_attributes: [:id, :name, :description, :_destroy])
  end
end
