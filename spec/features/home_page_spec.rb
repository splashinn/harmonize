require 'spec_helper'

describe "Home" do

  before { visit root_path }

  describe "title" do
  
    it "has title 'Harmonize | Home'" do
      expect(page).to have_title("Harmonize | Home")
    end
  end

  describe "content" do

    it "has an h1 'Harmonize'" do
      page_title = find('#page_header').find('h1')
      expect(page_title).to have_content('Harmonize')
    end

    it "has a link to Projects index page" do
      find('#main_content').click_link('Projects')
      expect(page).to have_content 'All Projects'
    end
  end

  describe "side menu" do

    it "has a link to Home page" do
      find('#side_menu_list').click_link('Home')
      expect(page).to have_content 'Harmonize'
    end

    it "has a link to Projects index page" do
      find('#side_menu_list').click_link('Projects')
      expect(page).to have_content 'All Projects'
    end
  end

  describe "side nav" do

    it "has a link to Projects index page" do
      find('#sidenav_lists').click_link('All Projects')
      expect(current_path).to eq projects_path
    end
  end
end
  