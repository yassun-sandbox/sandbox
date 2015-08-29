require'spec_helper'

feature "About Big Comodal" do

  scenario "about のモーダル表示を切り替える", js:true do
    visit root_path

    expect(page).to_not have_content 'About BigCo'
    expect(page).to_not have_content 'BigCo produces the finest widgets in all the land'

    click_link 'About Us'
    expect(page).to have_content 'About BigCo'
    expect(page).to have_content 'BigCo produces the finest widgets in all the land'

    within '#about_us' do
      click_button 'Close'
    end

    expect(page).to_not have_content 'About BigCo'
    expect(page).to_not have_content 'BigCo produces the finest widgets in all the land'

  end
end

