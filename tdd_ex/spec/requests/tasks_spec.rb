require 'rails_helper'

RSpec.describe "Tasks", :type => :feature do

  describe "GET /tasks/new" do
    it "タスク追加画面が表示できる事" do
      visit "tasks/new"
      expect(page).to have_http_status(200)
      expect(page).to have_content('タスク追加')
    end
  end

  describe "タスクの追加について" do
    it "登録すると一覧に表示される事" do
      visit "tasks/new"
      fill_in "Tile", with: "おしごと１"
      fill_in "Contents", with: "しょうさい"
      click_button "追加"

      expect(page).to have_content('タスク一覧')
      #expect(page).to have_content('おしごと１')
    end
  end

end

