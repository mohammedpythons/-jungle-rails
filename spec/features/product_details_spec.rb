require 'rails_helper'

RSpec.feature "Visitor navigates to product page", type: :feature, js: true do

   # SETUP
   before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        image: open_asset('apparel1.jpg'),
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "They see a specific product" do
    # ACT
    visit root_path
    all("article header h4").first.click

    # DEBUG / VERIFY
    sleep(2)
    save_screenshot
    expect(page).to have_css "section.products-show"

  end

end