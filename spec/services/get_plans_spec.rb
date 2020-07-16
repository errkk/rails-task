require "rails_helper"

describe GetPlans do
  subject { described_class.new }
  let(:success) { true }
  let(:parsed_response) do
    {
      "big" =>{ "price" => 1000, "currency" => "GBP" , "min_term" => 12},
      "medium" => { "price" => 500, "currency" => "GBP" , "min_term" => 1},
      "small" => { "price" => 250, "currency" => "GBP" , "min_term" => 12},
      "tiny" => { "price" => 125, "currency" => "GBP", "min_term" => 24 }
    }
  end

  let(:api) { instance_double(Telco::Api, success?: success, code: 200, parsed_response: parsed_response) }

  before do
    allow(Telco::Api).to receive(:new)
      .and_return(api)

    allow(api).to receive(:get_plans)
  end

  describe "#available" do
    it "filters only plans available for below or including a minimum term" do
      expect(subject.available(12)).to eq(
        "big" =>{ "price" => 1000, "currency" => "GBP" , "min_term" => 12},
        "medium" => { "price" => 500, "currency" => "GBP" , "min_term" => 1},
        "small" => { "price" => 250, "currency" => "GBP" , "min_term" => 12},
      )
    end

    it "deletgates #success? to @api" do
      expect(subject.success?).to be_truthy
    end

    context "api call is unsuccesful" do
      let(:success) { false }
      it "doesn't return any data" do
        expect(subject.available(12)).to be_nil
      end

      it "deletgates #success? to @api" do
        expect(subject.success?).to be_falsey
      end
    end
  end
end

