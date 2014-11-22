require 'rails_helper'

RSpec.describe "Tasks", :type => :feature do

  describe "GET /tasks/new" do
    it "タスク追加画面が表示できる事" do
      visit "tasks/new"
      expect(response).to have_http_status(200)
    end
  end

end
