require 'rails_helper'

RSpec.describe "Shelters Index Page" do

  it "can see a list of names of all shelters" do
    shelter1 = Shelter.create!(name: "Pups For You", address: "1808 Pup lane", city: "Denver", state: "Colorado", zip: "80027")

    shelter2 = Shelter.create!(name: "Kitty Rescue", address: "1505 Kitty Dr.", city: "Denver", state: "Colorado", zip: "80025")


    visit "/shelters"

    expect(page).to have_content(shelter1.name)
    expect(page).to have_content(shelter2.name)
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

  it "has links next to each shelter to edit that shelter" do
    shelter1 = Shelter.create!(name: "Pups For You", address: "1808 Pup lane", city: "Denver", state: "Colorado", zip: "80027")

    visit '/shelters'

    click_on 'Update Shelter'

    expect(current_path).to eq("/shelters/#{shelter1.id}/edit")

    fill_in "name", with: "Pups For You"
    fill_in "address", with: "1600 Puppy Blvd"
    fill_in "city", with: "Littleton"
    fill_in "state", with: "CO"
    fill_in "zip", with: "80235"
    click_on "Update Shelter"

    expect(current_path).to eq("/shelters/#{shelter1.id}")

    expect(page).to have_content("1600 Puppy Blvd")
    expect(page).to have_content("Littleton")
    expect(page).to have_content("80235")
    expect(page).to_not have_content("1808 Pup lane")

  end

  it "can see a link to delete a shelter" do
    shelter1 = Shelter.create!(name: "Pups For You", address: "1808 Pup lane", city: "Denver", state: "Colorado", zip: "80027")

    visit "/shelters"

    click_on "Delete Shelter"

    expect(current_path).to eq("/shelters")

    expect(page).to_not have_content(shelter1.name)
  end

  it "can see the shelters name as a link, and link takes you to shelters show page" do
    shelter1 = Shelter.create!(name: "Pups For You", address: "1808 Pup lane", city: "Denver", state: "Colorado", zip: "80027")

    visit "/shelters"

    click_on "#{shelter1.name}"

    expect(current_path).to eq("/shelters/#{shelter1.id}")

  end
end
