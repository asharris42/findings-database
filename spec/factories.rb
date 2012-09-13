FactoryGirl.define do
	factory :study do
    sequence(:name)  { |n| "Study #{n}" }
    sequence(:date) { |n| "01/#{n}/2010"}   
    product "GoToMyPC"
    platform "iPhone"
  end

  factory :finding do
    content "Lorem ipsum"
    user
  end
end