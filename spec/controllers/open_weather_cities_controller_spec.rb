require 'rails_helper'

RSpec.describe OpenWeatherCitiesController, type: :controller do
  let(:user) { create(:user) }
  let(:valid_session) do
    controller.stub(:current_user).and_return(user)
    controller.stub(:signed_in?).and_return(true)
  end

  describe "GET #index" do
    it "returns http success" do
      sign_in_as(user)
      get :index, xhr: true
      expect(response).to have_http_status(:success)
    end
  end

end
