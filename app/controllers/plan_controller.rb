class PlanController < ApplicationController
  PLANS = {
    big: { price: 1000, currency: "GBP" },
    medium: { price: 500, currency: "GBP" },
    small: { price: 250, currency: "GBP" },
    tiny:  { price: 125, currency: "GBP" }
  }
  def index
    render json: PLANS.to_json
  end

  def subscribe
  end
end
