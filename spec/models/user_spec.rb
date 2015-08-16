require 'rails_helper'

RSpec.describe User, type: :model do
	it 'requires first name and last name' do
		user = User.new(first_name: '', last_name: '')
		user.valid?
		expect(user.errors[:first_name].any?).to eq(true)
		expect(user.errors[:last_name].any?).to eq(true)
	end

	it 'requires city and state' do
		user = User.new(city: '', state: '')
		user.valid?
		expect(user.errors[:city].any?).to eq(true)
		expect(user.errors[:state].any?).to eq(true)
	end

	it 'requires an email' do
		user = User.new(email: '')
		user.valid?
		expect(user.errors[:email].any?).to eq(true)
	end

	it 'accepts a valid email' do
		user = User.new(email: 'bill@gates.com')
		user.valid?
		expect(user.errors[:email].any?).to eq(false)
	end

	it 'rejects an invalid email' do
		user = User.new(email: 'bill')
		user.valid?
		expect(user.errors[:email].any?).to eq(true)
	end

	it 'requires a unique, case insensitive email address' do
		user1 = User.create(first_name: 'Bill', last_name: 'Gates', city: 'Redmond', state: 'WA', email: 'bill@gates.com', password: 'billgates', password_confirmation: 'billgates')
		user2 = User.new(email: user1.email.upcase)
		user2.valid?
		expect(user2.errors[:email].first).to eq('has already been taken')
	end

	it 'requires a password' do
		user = User.new(password: '')
		user.valid?
		expect(user.errors[:password].any?).to eq(true)
	end

	it 'requires the password to match the password confirmation' do
		user = User.new(password: 'password', password_confirmation: 'wrong password')
		user.valid?
		expect(user.errors[:password_confirmation].first).to eq("doesn't match Password")
	end

	it 'automatically encrypts the password into the password_digest attribute' do
		user = User.create(first_name: 'Bill', last_name: 'Gates', city: 'Redmond', state: 'WA', email: 'bill@gates.com', password: 'billgates', password_confirmation: 'billgates')
		expect(user.password_digest.present?).to eq(true)
	end
end
