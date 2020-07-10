module Telco
  class Api
    include HTTParty
    base_uri "https://fakecycle.netlify.app/.netlify/functions"

    PLANS = "/plans"
    SUBSCRIBE = "/subscribe"

    delegate :success?, :code, :parsed_response, to: :@response

    def get_plans
      @response = self.class.get(PLANS, headers: headers)
    end

    # Uncomment to override
    #def parsed_response
      #{
        #big: { "price": 1000, "currency": "GBP" , "min_term": 12},
        #medium: { "price": 500, "currency": "GBP" , "min_term": 1},
        #small: { "price": 250, "currency": "GBP" , "min_term": 12},
        #tiny:  { "price": 125, "currency": "GBP", "min_term": 24 }
      #}
    #end

    private
      def headers
        {
          "x-auth-token" => "afb4f44e-fc74-47d8-adae-d778debee630"
        }
      end
  end
end

