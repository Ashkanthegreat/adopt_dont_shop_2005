require 'rails_helper'

RSpec.describe "pets index page" do
  it "as a visitor when I visit /pets I see each pet with info" do

    shelter1 = Shelter.create!(name: "Pups For You", address: "1808 Pup lane", city: "Denver", state: "Colorado", zip: "80027")
    shelter2 = Shelter.create!(name: "Pups For You2", address: "1808 Pup lane", city: "Denver", state: "Colorado", zip: "80027")

    pet1 = Pet.create!(  image: "https://i.imgur.com/uQ7WVLL.jpg",
                      name:  "dog",
                      description: "Sweet senior dog",
                      approximate_age: "18",
                      sex: "Male",
                      shelter_id: shelter1.id)

    pet2 = Pet.create!(  image: "https://i.imgur.com/uQ7WVLL.jpg",
                      name:  "cat",
                      description: "Sweet senior dog",
                      approximate_age: "18",
                      sex: "Male",
                      shelter_id: shelter2.id)
    visit "/pets"

    expect(page).to have_content(pet1.name)
    expect(page).to have_content(pet1.image)
    expect(page).to have_content(pet1.approximate_age)
    expect(page).to have_content(pet1.sex)
    expect(page).to have_content(pet1.shelter.name)

    expect(page).to have_content(pet2.name)
    expect(page).to have_content(pet2.image)
    expect(page).to have_content(pet2.approximate_age)
    expect(page).to have_content(pet2.sex)
    expect(page).to have_content(pet2.shelter.name)

    expect(page).to_not have_content(pet2.shelter.address)
  end

  it "Can update a pet" do

    shelter1 = Shelter.create!(name: "Pups For You", address: "1808 Pup lane", city: "Denver", state: "Colorado", zip: "80027")
    shelter2 = Shelter.create!(name: "Pups For You2", address: "1808 Pup lane", city: "Denver", state: "Colorado", zip: "80027")

    pet_1 = Pet.create!(  image: "https://i.imgur.com/uQ7WVLL.jpg",
                      name:  "dog",
                      description: "Sweet senior dog",
                      approximate_age: "18",
                      sex: "Male",
                      shelter_id: shelter1.id)


    visit "/pets"

    click_on "Update Pet"

    expect(current_path).to eq("/pets/#{pet_1.id}/edit")

    fill_in "image", with: "https://dogtime.com/assets/uploads/2011/03/puppy-development-1280x720.jpg"
    fill_in "name", with: "Happy"
    fill_in "description", with: "Happy little puppy!"
    fill_in "approximate_age", with: "<1"
    fill_in "sex", with: "Male"

    click_on "Update Pet"

    expect(current_path).to eq("/pets/#{pet_1.id}")

    expect(page).to have_content("Happy")
    expect(page).to have_content("Happy little puppy!")

    expect(page).to_not have_content("Huxley")
  end

  it "can delete a pet from index page" do
    shelter1 = Shelter.create!(name: "Pups For You",
                                address: "1808 Pup lane",
                                city: "Denver",
                                state: "Colorado",
                                zip: "80027")


    pet_1 = Pet.create(  image: "https://i.imgur.com/uQ7WVLL.jpg",
                          name:  "Huxley",
                          description: "Sweet senior dog",
                          approximate_age: "18",
                          sex: "Male",
                          status: "adoptable",
                          shelter_id: shelter1.id)


    visit "/pets"

    click_on "Delete Pet"

    expect(current_path).to eq("/pets")

    expect(page).to_not have_content(pet_1.name)

  end

end
