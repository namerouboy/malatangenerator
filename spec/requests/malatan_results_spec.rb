require 'rails_helper'

RSpec.describe "MalatanResults", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/malatan_results/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/malatan_results/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/malatan_results/create"
      expect(response).to have_http_status(:success)
    end
  end

end
