Shelter.destroy_all

@shelter_1 = Shelter.create(name:     "Dumb Friends League",
                            address:  "1820 S Quebec St",
                            city:     "Denver",
                            state:    "CO",
                            zip:      "80231")


@shelter_2 = Shelter.create(name:     "Peace, Love, Paws",
                            address:  "1280 Vine St",
                            city:     "Denver",
                            state:    "CO",
                            zip:      "80206")

@shelter_3 = Shelter.create(name:     "Aurora Animal Shelter",
                            address:  "15750 E 32nd Ave",
                            city:     "Aurora",
                            state:    "CO",
                            zip:      "80011")

@shelter_4 = Shelter.create(name:     "Love Four Legged Friends",
                            address:  "123 Main St",
                            city:     "Superior",
                            state:    "CO",
                            zip:      "80222")
@pet_1 = Pet.create(  image: "https://i.imgur.com/uQ7WVLL.jpg",
                      name:  "Huxley",
                      description: "Sweet senior dog",
                      approximate_age: "18",
                      sex: "Male",
                      adoption_status: "adoptable",
                      shelter_id: @shelter_1.id)


@pet_2 = Pet.create(  image: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2016/05/19091354/Weimaraner-puppy-outdoors-with-bright-blue-eyes.20190813165758508-1.jpg",
                      name:  "Rocco",
                      description: "Very good with kids and other animals",
                      approximate_age: "6",
                      sex: "Male",
                      adoption_status: "adoptable",
                      shelter_id: @shelter_1.id)

@pet_3 = Pet.create(  image: "https://www.humanesociety.org/sites/default/files/styles/1240x698/public/2019/02/dog-451643.jpg?h=bf654dbc&itok=MQGvBmuo",
                      name:  "Sage",
                      description: "Adopt me I'm a cuddle bug",
                      approximate_age: "2",
                      sex: "Female",
                      adoption_status: "adoptable",
                      shelter_id: @shelter_2.id)

@pet_4 = Pet.create(  image: "https://d1941uuft27pfg.cloudfront.net/breed-uploads/2018/08/akita-card-medium.jpg?bust=1535569354",
                      name:  "Natalie",
                      description: "Stays to herself except when you have treats",
                      approximate_age: "4",
                      sex: "Female",
                      adoption_status: "adoptable",
                      shelter_id: @shelter_4.id)

@pet_5 = Pet.create(  image: "https://cdn.mos.cms.futurecdn.net/QjuZKXnkLQgsYsL98uhL9X.jpg",
                      name:  "Furball",
                      description: "Very energetic",
                      approximate_age: "4",
                      sex: "Male",
                      adoption_status: "adoptable",
                      shelter_id: @shelter_3.id)

@pet_6 = Pet.create(  image: "https://i0.wp.com/cdn-prod.medicalnewstoday.com/content/images/articles/327/327387/cat-playing-with-toy.jpg?w=1155&h=1734",
                      name:  "Sphinx",
                      description: "Sweet and loving",
                      approximate_age: "8",
                      sex: "Female",
                      adoption_status: "adoptable",
                      shelter_id: @shelter_2.id)

@pet_7 = Pet.create(  image: "https://images.immediate.co.uk/production/volatile/sites/4/2018/12/GettyImages-918529586-35c7227.jpg?quality=90&crop=61px%2C468px%2C7710px%2C3317px&resize=960%2C408",
                      name:  "Chance",
                      description: "Give me a chance",
                      approximate_age: "3",
                      sex: "Male",
                      adoption_status: "adoptable",
                      shelter_id: @shelter_3.id)

@pet_9 = Pet.create(  image: "https://dcist.com/wp-content/uploads/sites/3/2020/02/wilford_newsletter.jpg",
                      name:  "Tuna",
                      description: "I'm just big boned",
                      approximate_age: "5",
                      sex: "Female",
                      adoption_status: "adoptable",
                      shelter_id: @shelter_1.id)
