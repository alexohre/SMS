require 'rails_helper'

RSpec.describe "Payments", type: :request do
  describe "GET /purchase" do
    it "returns http success" do
      get "/payment/purchase"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /payment_success" do
    it "returns http success" do
      get "/payment/payment_success"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /payment_failure" do
    it "returns http success" do
      get "/payment/payment_failure"
      expect(response).to have_http_status(:success)
    end
  end

end
