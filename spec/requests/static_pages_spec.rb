require 'spec_helper'

describe "StaticPages" do
	subject {page}

	describe "Home page" do    #HOME
		before { visit root_path }

		it { should have_content('Sample App') }
		it { should have_title(full_title('')) }
		it { should_not have_title('| Home') }

		describe "for signed-in users" do
			let(:user) {FactoryGirl.create(:user) }
			before do
				FactoryGirl.create(:micropost, user: user, content: "Lorem ipsum")
				FactoryGirl.create(:micropost, user: user, content: "Dolor sit amet")
				sign_in user
				visit root_path
			end

			it "should render the user's feed" do
				user.feed.each do |item|
					expect(page).to have_selector("li##{item.id}", text: item.content)
				end
			end
		end
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

	it "should have the right links on the layout" do
		visit root_path
		click_link "About"
		expect(page).to have_title(full_title('About Us'))
		click_link "Help"
		expect(page).to have_title(full_title('Help'))
		click_link('Contact', match: :first)
		expect(page).to have_title(full_title('Contact'))
		click_link "Home"
		click_link "Sign up"
		expect(page).to have_title(full_title('Sign up'))
		click_link "sample app"
	end
end