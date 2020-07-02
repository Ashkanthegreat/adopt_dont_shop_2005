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

end

# Then I see the shelter with that id including the shelter's:
# - name
# - address
# - city
# - state
# - zip
