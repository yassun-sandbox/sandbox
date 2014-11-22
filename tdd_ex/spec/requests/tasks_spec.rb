require 'rails_helper'

RSpec.describe "Tasks", :type => :feature do

  describe "GET /tasks/new" do
    it "タスク追加画面が表示できる事" do
      visit "tasks/new"
      expect(page).to have_http_status(200)
      expect(page).to have_content('タスク追加')
    end
  end

end
