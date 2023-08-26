require 'rails_helper'

RSpec.describe "Webhooks", type: :request do
  describe "GET /handle_event" do
    it "returns http success" do
      get "/webhook/handle_event"
      expect(response).to have_http_status(:success)
    end
  end

end
