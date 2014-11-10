require 'rails_helper'


RSpec.describe 'StaticPages', :type => :feature do
  subject { page }

  describe "indexを表示" do

    context 'APIからユーザー情報を取得できた場合' do
      let(:user1){ fixture_json('user1.json') }
      let(:user2){ fixture_json('user2.json') }

      before do

        stub_request(:get, %r(#{JSON_API_URL}/users/1.*)).to_return({
          :body   => fixture('user1.json'),
          :status => 200
        })

        stub_request(:get, %r(#{JSON_API_URL}/users/2.*)).to_return({
          :body   => fixture('user2.json'),
          :status => 200
        })

        visit root_path

      end

      it 'ユーザー情報が表示されていること' do
        should have_title('FrontApp')

        should have_selector('h1', text: user1["name"])
        should have_selector('li', text: user1["id"])
        should have_selector('li', text: user1["tel"])

        should have_selector('h1', text: user2["name"])
        should have_selector('li', text: user2["id"])
        should have_selector('li', text: user2["tel"])

      end
    end

    context 'APIからユーザー情報が取得できなかった場合' do
      before do
        stub_request(:get,"#{JSON_API_URL}").to_return({ :status => 404 })
      end

      it '何も表示されていない事' do
        should_not have_selector('h1')
        should_not have_selector('li')
      end


    end

  end
end

