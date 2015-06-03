class RatingsController < ApplicationController
  def edit
    @position = Position.find(params[:position_id])
    @ratings = Rating.where(characteristic_id: @position.characteristics.map(&:id))
    characteristics = @position.characteristics.select{ |c| c.rating.nil? }
    characteristics.map{ |c| Rating.create(characteristic: c, value: :always)}
  end

  def update
    ratings_params.each do |rating_params|
      rating = Rating.find_or_initialize_by(characteristic_id: rating_params[:characteristic_id])
      rating.update(value: rating_params[:value].to_i)
    end

    redirect_to positions_path
  end

  private
  def ratings_params
    params.require(:ratings).values#.permit([:characteristic_id, :value])
  end
end
