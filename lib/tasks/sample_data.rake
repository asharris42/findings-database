namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    Product.create!(product_name: "GoToMyPC", description: "foo")
    Product.create!(product_name: "GoToMeeting", description: "foo")
    Product.create!(product_name: "GoToWebinar", description: "foo")
    Product.create!(product_name: "GoToAssist", description: "foo")
    Product.create!(product_name: "ShareFile", description: "foo")

    Platform.create!(platform_name: "Pre-Login Web", description: "foo")
    Platform.create!(platform_name: "Post-Login Web", description: "foo")
    Platform.create!(platform_name: "PC", description: "foo")
    Platform.create!(platform_name: "Mac", description: "foo")
    Platform.create!(platform_name: "iPad", description: "foo")
    Platform.create!(platform_name: "iPhone", description: "foo")
    Platform.create!(platform_name: "Android", description: "foo")

    ActivityType.create!(type_name:"Customer Office Hours", description: "foo")
    ActivityType.create!(type_name:"Usability Study", description: "foo")
    ActivityType.create!(type_name:"RITE Method Test", description: "foo")
    ActivityType.create!(type_name:"Ethnographic Study", description: "foo")

    Tag.create!(tag_name:"Buttons and Icons", description: "foo")
    Tag.create!(tag_name:"Calendar Picker", description: "foo")
    Tag.create!(tag_name:"Color Picker", description: "foo")
    Tag.create!(tag_name:"Drop-Down Menus", description: "foo")
    Tag.create!(tag_name:"Footer Templates", description: "foo")

    10.times do |n|
      name  = Faker::Name.name
      date = "#{n+1}/01/2010"
      Study.create!(name: name,
                   date: date,
                   product_ids: rand(1..5),
                   platform_ids: rand(1..7),
                   activity_type_ids: rand(1..4),
                   live: true)
    end

    studies = Study.all(limit: 10)
    50.times do
      content = Faker::Lorem.sentence(5)
      studies.each { |study| study.findings.create!(content: content) }
    end

    admin = User.create!(name: "Andrew Harris", email: "andrew.harris@citrix.com", 
            password: "test1234", password_confirmation: "test1234")
    admin.toggle!(:admin)

  end
end