require 'rails_helper'

RSpec.describe 'Registration Page' do
  describe 'As a Visitor' do
    it "I can create a new user" do
      visit root_path
      click_link("First Time User? Register Here")

      expect(current_path).to eq("/registration")

      expect(page).to have_content("Please Register an Account")
      expect(page).to have_field("Email")
      expect(page).to have_field("Password")
      expect(page).to have_field("Password confirmation")
      expect(page).to have_button("Register")

      email = "John@example.com"
      password = "password"

      fill_in :email, with: email
      fill_in :password, with: password
      fill_in :password_confirmation, with: password

      click_button "Register"
      expect(current_path).to eq(dashboard_path)
    end

    it "keeps a user logged in after registering" do
      visit root_path
      click_link("First Time User? Register Here")

      email = "carson@test.com"
      password = "password"

      fill_in :email, with: email
      fill_in :password, with: password
      fill_in :password_confirmation, with: password

      click_on "Register"

      visit '/dashboard'
      
      expect(page).to have_content("Welcome, #{email}!")
    end
  end
end
