require 'spec_helper'

feature "Managing courses" do
  scenario "user visits root page" do
    visit root_path
    expect(page).to have_content("Listing courses")
  end
end
