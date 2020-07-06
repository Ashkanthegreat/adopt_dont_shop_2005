require 'rails_helper'

RSpec.describe "Pets Show Page" do
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


    @pet_2 = Pet.create(  image: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2016/05/19091354/Weimaraner-puppy-outdoors-with-bright-blue-eyes.20190813165758508-1.jpg",
                          name:  "Rocco",
                          description: "Very good with kids and other animals",
                          approximate_age: "6",
                          sex: "Male",
                          status: "adoptable",
                          shelter_id: @shelter1.id)
  end

  it "Can see a pets image, name, description, approximate age, sex, and adoptable status" do

    visit "/pets/#{@pet_1.id}"

    expect(page).to have_content(@pet_1.image)
    expect(page).to have_content(@pet_1.name)
    expect(page).to have_content(@pet_1.description)
    expect(page).to have_content(@pet_1.approximate_age)
    expect(page).to have_content(@pet_1.sex)
    expect(page).to have_content(@pet_1.status)

    expect(page).to_not have_content(@pet_2.name)

  end

  it "can delete a pet" do

    visit "/pets/#{@pet_1.id}"

    click_on "Delete Pet"

    expect(current_path).to eq("/pets")

    expect(page).to have_content(@pet_2.name)
    expect(page).to_not have_content(@pet_1.name)

  end

end
