require 'rails_helper'

RSpec.describe "Shelters Index Page" do
  before :each do
    @shelter1 = Shelter.create!(name: "Pups For You", address: "1808 Pup lane", city: "Denver", state: "Colorado", zip: "80027")
    @shelter2 = Shelter.create!(name: "Kitty Rescue", address: "1505 Kitty Dr.", city: "Denver", state: "Colorado", zip: "80025")

  end

  it "can see a list of names of all shelters" do
    visit "/shelters"

    expect(page).to have_content(@shelter1.name)
    expect(page).to have_content(@shelter2.name)
  end

  it "see a link that takes you to a form to create a new shelter" do
    visit "/shelters"

    click_on "New Shelter"

    expect(current_path).to eq('/shelters/new')

    fill_in "name", with: "Puppy Love"
    fill_in "address", with: "678 Jelly Bean Rd"
    fill_in "city", with: "Denver"
    fill_in "state", with: "CO"
    fill_in "zip", with: "80210"

    click_on "Create Shelter"

    expect(current_path).to eq('/shelters')

    expect(page).to have_content("Puppy Love")

  end
end

# Then I am taken to '/shelters/new' where I  see a form for a new shelter
# When I fill out the form with a new shelter's:
# - name
# - address
# - city
# - state
# - zip
# And I click the button "Create Shelter" to submit the form
# Then a `POST` request is sent to '/shelters',
# a new shelter is created,
# and I am redirected to the Shelter Index page where I see the new Shelter listed.
