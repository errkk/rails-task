module Telco
  class Api
    include HTTParty
    base_uri "https://fakecycle.netlify.app/.netlify/functions"

    PLANS = "/plans"
    SUBSCRIBE = "/subscribe"

    delegate :success?, :code, :parsed_response, to: :@response

    # Fetches the requests to instance variable @response
    # Note: self.success?, self.code and self.parsed_response are deletegate to @response
    def get_plans
      @response = self.class.get(PLANS, headers: headers)
    end

    private
      def headers
        {
          "x-auth-token" => "test api key"
        }
      end
  end
end

