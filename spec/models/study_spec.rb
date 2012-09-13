require 'spec_helper'

describe Study do

  before do
    @study = Study.new(name: "Example Study", date: "01/01/2000", 
                     platform: "iPhone", product: "GoToMyPC")
  end

  subject { @study }

  it { should respond_to(:name) }
  it { should respond_to(:date) }
  it { should respond_to(:platform) }
  it { should respond_to(:product) }
  it { should respond_to(:description) }
  it { should respond_to(:participants) }
  it { should respond_to(:presentation) }
  it { should respond_to(:researcher) }
  it { should respond_to(:designer) }
  
  it { should be_valid }

  describe "when study name is not present" do
  	before {@study.name = " " }
  	it { should_not be_valid }
  end

  describe "when study date is not present" do
  	before {@study.date = " " }
  	it { should_not be_valid }
  end

  describe "when study platform is not present" do
  	before {@study.platform = " " }
  	it { should_not be_valid }
  end

  describe "when study product is not present" do
  	before {@study.product = " " }
  	it { should_not be_valid }
  end

  describe "when study name is already taken" do
    before do
      study_with_same_name = @study.dup
      study_with_same_name.save
    end
    it { should_not be_valid }
  end
end