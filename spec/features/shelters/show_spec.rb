require 'rails_helper'

RSpec.describe "Shelters Show Page" do
  before :each do
    @shelter1 = Shelter.create!(name: "Pups For You", address: "1808 Pup lane", city: "Denver", state: "Colorado", zip: "80027")
    @shelter2 = Shelter.create!(name: "Kitty Rescue", address: "1505 Kitty Dr.", city: "Denver", state: "Colorado", zip: "80025")
  end

  it "can see a shelters name, address, city, state, zip" do

    visit "shelters/#{@shelter1.id}"

    expect(page).to have_content(@shelter1.name)
    expect(page).to have_content(@shelter1.address)
    expect(page).to have_content(@shelter1.city)
    expect(page).to have_content(@shelter1.state)
    expect(page).to have_content(@shelter1.zip)

    expect(page).to_not have_content(@shelter2.name)
    expect(page).to_not have_content(@shelter2.address)
  end

  it "can click a link to update a shelter" do

    visit "shelters/#{@shelter1.id}"

    click_on "Update Shelter"

    expect(current_path).to eq("/shelters/#{@shelter1.id}/edit")

    fill_in "name", with: "Pups For You"
    fill_in "address", with: "1600 Puppy Blvd"
    fill_in "city", with: "Littleton"
    fill_in "state", with: "CO"
    fill_in "zip", with: "80235"
    click_on "Update Shelter"

    expect(current_path).to eq("/shelters/#{@shelter1.id}")

    expect(page).to have_content("1600 Puppy Blvd")
    expect(page).to have_content("Littleton")
    expect(page).to have_content("80235")
  end

end
