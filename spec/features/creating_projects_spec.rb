require 'spec_helper'

describe 'Creating Projects' do
  scenario "can create project" do
    visit '/'

    click_link 'New Project'

    fill_in 'Name',with: "TextMate 2"
    fill_in 'Description',with: "A text-editor for OS X"
    click_button 'Create Project'

    expect(page).to have_content('Project has been created.')
  end
end