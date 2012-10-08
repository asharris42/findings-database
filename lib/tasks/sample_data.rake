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

    30.times do |n|
      name  = Faker::Name.name
      date = "#{n+1}/01/2010"
      Study.create!(name: name,
                   date: date,
                   product_ids: rand(1..5),
                   platform_ids: rand(1..7))
    end

    studies = Study.all(limit: 10)
    50.times do
      content = Faker::Lorem.sentence(5)
      studies.each { |study| study.findings.create!(content: content) }
    end
  end
end