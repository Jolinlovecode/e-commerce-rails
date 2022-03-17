require 'rails_helper'
require 'support/database_cleaner'

RSpec.feature "AddToCarts", type: :feature, js: true do
  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        quantity: 10,
        price: 64.99
      )
    end

    @user = User.create!(
      first_name: 'Jack',
      last_name: 'Ma',
      email: 'alibaba@alibaba.com',
      password: 'alibaba',
      password_confirmation: 'alibaba'
    )

    visit new_session_path
      fill_in 'email', with: 'alibaba@alibaba.com'
      fill_in 'password', with: 'alibaba'
    click_button "Submit"
  end

  scenario "their cart increases by one if they click the 'Add to Cart' button for a product" do
    # ACT
    visit root_path
  
    # click_button 'Add', match: :first
   
    product=page.first("article.product")
    button=product.find_button("Add")
    button.click

    # DEBUG 
    save_screenshot

    # VERIFY
    expect(page).to have_content 'My Cart (1)', count:1
  end


end
