class PlanController < ApplicationController

  def index
    plans = GetPlans.new

    if plans.success?
      available = plans.available(1)
      render json: available.to_json
    end
  end

  def subscribe
  end
end
