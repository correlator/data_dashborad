class CardsController < ApplicationController
  def show
    @card = Card.find(params[:id])
  end

  def update
    @card = Card.find(params[:id])
    @card.update(card_params)
    redirect_to card_url(@card)
  end

  private

  def card_params
    ps = params.require(:card)
               .permit(:value, :value_date,
                       :source, :trend, :color)
  end
end
