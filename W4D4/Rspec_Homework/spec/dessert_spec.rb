require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)!
Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef", name: "Hank") }
  subject(:ice_cream) {Dessert.new("ice_cream", 10, chef)}

  describe "#initialize" do
    it "sets a type" do
        expect(ice_cream.type).to eq("ice_cream")
    end

    it "sets a quantity" do
        expect(ice_cream.quantity).to eq(10)
    end

    it "starts ingredients as an empty array" do
        expect(ice_cream.ingredients).to eq([])
    end

    it "raises an argument error when given a non-integer quantity" do
        expect {Dessert.new("ice_cream", "10", chef)}.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
        ice_cream.add_ingredient("strawberry")
        expect(ice_cream.ingredients).to include("strawberry")
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
        ingredients = ["chocolate", "flour", "egg", "sugar", "butter"]
      
        ingredients.each do |ingredient|
            ice_cream.add_ingredient(ingredient)
        end
      
        expect(ice_cream.ingredients).to eq(ingredients)
        ice_cream.mix!
        expect(ice_cream.ingredients).not_to eq(ingredients)
        expect(ice_cream.ingredients.sort).to eq(ingredients.sort)
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do 
        expect(ice_cream.quantity).to eq(10)
        ice_cream.eat(1)
        expect(ice_cream.quantity).to eq(9)
    end

    it "raises an error if the amount is greater than the quantity" do
        expect { ice_cream.eat(120)}.to raise_error("not enough left!")
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do 
        allow(chef).to receive(:titleize).and_return("Chef Hank")
        expect(ice_cream.serve).to eq("Chef Hank has made 10 ice_creams!")

    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
        expect(chef).to receive(:bake).with(ice_cream)
        ice_cream.make_more
      end
  end
end
