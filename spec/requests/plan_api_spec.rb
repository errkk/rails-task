require "rails_helper"

RSpec.describe "Plans API", type: :request do
  let(:success) { true }
  let(:min_term) { 12 }
  let(:available_plans) do
    {
      "big" =>{ "price" => 1000, "currency" => "GBP" , "min_term" => 12},
      "medium" => { "price" => 500, "currency" => "GBP" , "min_term" => 1},
      "small" => { "price" => 250, "currency" => "GBP" , "min_term" => 12}
    }
  end

  let(:get_plans) { instance_double(GetPlans, available: available_plans, success?: success) }

  before do
    allow(GetPlans).to receive(:new)
        .and_return(get_plans)
  end

  describe "GET /plan/index" do
    it "returns a 200 response" do
      get "/plan/index", params: { min_term: min_term }

      expect(response).to have_http_status(200)
    end

    it "calls GetPlans with the minimum term query parameter" do
      get "/plan/index", params: { min_term: min_term }

      expect(get_plans).to have_received(:available)
          .with(min_term)
    end

    it "renders available plans in JSON" do
      get "/plan/index", params: { min_term: min_term }

      expect(response.parsed_body.keys).to eq(available_plans.keys)
    end

    context "telco api call is unsuccess" do
      let(:success) { false }

    it "returns an unprocessible_entity code" do
        get "/plan/index", params: { min_term: min_term }

        expect(response).to have_http_status(422)
      end
    end

    context "no min term specified" do
      let(:min_term) { nil }
      it "responds with a bad request status" do
        get "/plan/index", params: { min_term: min_term }

        expect(response).to have_http_status(400)
      end
    end
  end
end

