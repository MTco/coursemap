require 'spec_helper'

feature "Create Paths", :type => :feature do
  scenario "open paths page" do
    visit paths_path
    expect(page).to have_content("Listing paths")
  end

  scenario "create a path" do
    visit paths_path
    click_link 'New Path'
    fill_in 'Name', with: 'Path1'
    fill_in 'Description', with: 'Description1'
    click_button 'Create Path'
    expect(page).to have_content('Path was successfully created')
  end

  scenario "create a path containing courses" do
    visit paths_path
    click_link 'New Path'
    fill_in 'Name', with: 'Path1'
    fill_in 'Description', with: 'Description1'
    check 'Automata'
    click_button 'Create Path'
    expect(page).to have_content('Path was successfully created')
    expect(page).to have_content('Automata')
  end
end
