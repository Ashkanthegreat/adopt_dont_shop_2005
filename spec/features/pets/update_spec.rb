require 'rails_helper'

RSpec.describe "Pets Edit Page" do
  before :each do
    @shelter1 = Shelter.create!(name: "Pups For You",
                                address: "1808 Pup lane",
                                city: "Denver",
                                state: "Colorado",
                                zip: "80027")


    @pet_1 = Pet.create(  image: "https://i.imgur.com/uQ7WVLL.jpg",
                          name:  "Huxley",
                          description: "Sweet senior dog",
                          approximate_age: "18",
                          sex: "Male",
                          status: "adoptable",
                          shelter_id: @shelter1.id)

  end

  it "Can update a pet" do

    visit "/pets/#{@pet_1.id}"

    click_on "Update Pet"

    expect(current_path).to eq("/pets/#{@pet_1.id}/edit")

    fill_in "image", with: "https://dogtime.com/assets/uploads/2011/03/puppy-development-1280x720.jpg"
    fill_in "name", with: "Happy"
    fill_in "description", with: "Happy little puppy!"
    fill_in "approximate_age", with: "<1"
    fill_in "sex", with: "Male"

    click_on "Update Pet"

    expect(current_path).to eq("/pets/#{@pet_1.id}")

    expect(page).to have_content("Happy")
    expect(page).to have_content("Happy little puppy!")

    expect(page).to_not have_content("Huxley")
  end
end
