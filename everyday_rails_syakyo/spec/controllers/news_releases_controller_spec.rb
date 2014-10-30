require 'spec_helper'

describe NewsReleasesController, focus:true do
  describe 'GET #new' do
    it "ログインを要求すること" do
      get :new
      expect(response).to require_login
    end
  end

  describe "POST #create" do
    it "ログインを要求すること" do
      post :create, news_release: FactoryGirl.attributes_for(:news_release)
      expect(response).to require_login
    end
  end
end

