namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    30.times do |n|
      name  = Faker::Name.name
      date = "01/01/2010"
      product  = "GoToMyPC"
      platform = "iPhone"
      Study.create!(name: name,
                   date: date,
                   product: product,
                   platform: platform)
    end

    studies = Study.all(limit: 10)
    50.times do
      content = Faker::Lorem.sentence(5)
      studies.each { |study| study.findings.create!(content: content) }
    end
  end
end