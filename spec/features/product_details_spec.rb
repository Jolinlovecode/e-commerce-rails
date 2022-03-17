require 'rails_helper'

RSpec.feature "ProductDetails", type: :feature, js: true do
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
  end

  scenario "They can see a product deatails if click the product partials" do
    # ACT
    visit root_path
    find_link("Details", match: :first).trigger("click")

    # DEBUG 
    save_screenshot

    # VERIFY
    expect(page).to have_css 'article.product-detail', count: 1
  end


end
