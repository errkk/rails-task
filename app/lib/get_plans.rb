class GetPlans
  # /plans
  # {
  #   "big" =>{ "price" => 1000, "currency" => "GBP" , "min_term" => 12},
  #   "medium" => { "price" => 500, "currency" => "GBP" , "min_term" => 1},
  #   "small" => { "price" => 250, "currency" => "GBP" , "min_term" => 12},
  #   "tiny" => { "price" => 125, "currency" => "GBP", "min_term" => 24 }
  # }

  delegate :success?, :code, to: :@api

  def initialize
    @api = Telco::Api.new
    @api.get_plans
  end

  # @param min_term [Integer]
  # @return [Array<Hash>]
  def available(min_term)
    return unless @api.success?

    # Filter plans from the api that are available for
    # at least min term months
  @api.parsed_response.select { |identifier, plan| plan["min_term"] >= min_term }
  end
end
