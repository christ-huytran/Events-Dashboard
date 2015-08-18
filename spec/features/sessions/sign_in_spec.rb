require 'rails_helper'

RSpec.describe 'signing in' do
	before do
		@user = create_user
	end

	it 'prompts for email and password' do
		visit '/signin'
		expect(page).to have_field('Email')
		expect(page).to have_field('Password')
	end

end