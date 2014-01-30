require 'spec_helper'

describe "StaticPages" do
	describe "Home page" do
		it "it should have the content 'Sample App" do
			visit '/static_pages/home'
			expect(page).to have_content('Sample App')
		end
		it "should have title 'Home'" do
			visit '/static_pages/home'
			expect(page).to have_title("RoR Tutorial Sample App | Home")
		end
	end

	describe "Help Page" do
		it "should have the content 'Help'" do
			visit '/static_pages/help'
			expect(page).to have_content('Help')
		end
		it "sholud have title 'Help'" do
			visit '/static_pages/help'
			expect(page).to have_title("RoR Tutorial Sample App | Help")
		end 
	end

	describe "About page" do

		it "sholud have the content 'About Us'" do
			visit '/static_pages/about'
			expect(page).to have_content('About Us')
		end
		it "sholud have title 'About Us'" do
			visit '/static_pages/about'
			expect(page).to have_title("RoR Tutorial Sample App | About")
		end
	end
end