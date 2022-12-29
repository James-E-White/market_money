class Api::V0::MarketsController < ApplicationController 
  def index 
   render json: MarketSerializer.new(Market.all) #@markets = MarketFacade.new 
  end

  def show
    market = Market.find_by(params[:fmid])
    render json: MarketSerializer.new(market) 
  end
end