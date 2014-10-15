require 'spec_helper'

describe 'ユーザがイベント参加表明をする', js: true do
  let!(:event) { create :event }

  context '未ログインユーザが、イベント詳細ページで"参加する"をクリックしたとき' do
    before do
      visit event_path(event)
      click_on '参加する'
    end

    it '"ログインしてください"と表示されていること' do
      expect(page).to have_content('ログインしてください')
    end
  end

end

