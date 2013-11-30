require 'spec_helper'

feature "Contact management" do
  scenario "creates a new contact", :js => true do

    visit root_path
    click_on "Contacts"
    click_on "New Contact"
    fill_in "First Name", with: "Art"
    fill_in "Last Name", with: "Vandalay"
    within(".contact_email") do
      fill_in "Email", :with => "artvandelay@vandalay.com"
    end
    fill_in "Secondary Email", with: "artshizzle@gmail.com"
    click_on "Create Contact"
    expect(page).to have_content("Contact has been created.")
  end

  scenario "does not create a new contact", :js => true do

    visit new_contact_path
    click_on "Create Contact"
    expect(page).to have_content("Contact has not been created.")
  end
end