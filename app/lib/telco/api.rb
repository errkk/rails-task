module Telco
  class Api
    include HTTParty

    ENDPOINTS = {
      plans: "/plans",
      subscribe: "/subscribe"
    }

    API_HOST = "http://localhost:3000"

    def self.get(endpoint, params: {})
      super(uri(endpoint), params)
    end

    private
      def self.uri(endpoint)
        API_HOST + ENDPOINTS[endpoint]
      end
  end
end

