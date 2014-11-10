require 'rails_helper'


RSpec.describe 'StaticPages', :type => :feature do
  subject { page }

  describe "indexを表示" do

    context 'APIからユーザー情報を取得できた場合' do

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

        should have_selector('h1', text: 'hogehoge')
        should have_selector('li', text: 1)
        should have_selector('li', text: '111-1111-1111')

        should have_selector('h1', text: 'fugafuga')
        should have_selector('li', text: 2)
        should have_selector('li', text: '222-2222-2222')

      end
    end
  end
end

