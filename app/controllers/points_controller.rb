class PointsController < ApplicationController

  def update
    @point = Point.find(params[:id])
    @point.update(point_params)
    redirect_to card_url(@point.line.card_id)
  end

  def create
    @point = Point.create(point_params)
    redirect_to card_url(@point.line.card_id)
  end

  private

  def point_params
    params.require(:point).permit(:value, :point_date, :notes, :line_id)
  end
end
