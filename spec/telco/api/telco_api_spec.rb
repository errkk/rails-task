require "rails_helper"

module Telco
  describe Api do
    subject { described_class.new }
    let(:response) { instance_double(HTTParty::Response, success?: true, code: 200) }
    let(:uri) { "https://fakecycle.netlify.app/.netlify/functions/plans" }
    let(:token) { "test api key" }

    before do
      allow(HTTParty).to receive(:get)
        .and_return(response)
    end

    describe "#get_plans" do
      it "Delegates status methods to HTTParty::Response" do
        subject.get_plans
        expect(subject).to have_attributes(success?: true, code: 200)
      end

      it "requests endpoint" do
        subject.get_plans
        expect(WebMock).to have_requested(:get, uri)
      end

      it "sends authentication headers" do
        subject.get_plans
        expect(WebMock).to have_requested(:get, uri)
          .with(headers: {"X-Auth-Token": token})
      end
    end
  end
end
