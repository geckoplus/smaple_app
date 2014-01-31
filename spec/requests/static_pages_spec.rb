require 'spec_helper'

describe "StaticPages" do
	subject {page}

	describe "Home page" do    #HOME
		before { visit root_path }

		it { should have_content('Sample App') }
		it { should have_title(full_title('')) }
		it { should_not have_title('| Home') }
	end

	describe "Help Page" do		#HELP
		before { visit help_path}

		it { should have_title('Help') }
		it { should have_title(full_title('Help')) } 
	end

	describe "About page" do		#ABOUT
		before {visit about_path}
		it { should  have_content('About Us') }
		it { should have_title(full_title('About')) }
	end

	describe "Contact page" do		#CONTACT
		before {visit contact_path}

		it { should have_content('Contact') }
		it { should have_title(full_title(' Contact')) }
	end
end