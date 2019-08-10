require "./spec_helper"
describe Geoinfo::City do
  describe ".constructors" do
    it "finds by city, state, and country" do
      Geoinfo::City
        .new(city: "Lachute", state: "Quebec", country_code: "CA")
        .latitude
        .should eq "45.6501"
    end
    it "finds by zip and country" do
      Geoinfo::City
        .new(zip: "J8H", country: "CA")
        .city
        .should eq "Lachute"
    end
    it "finds by latitude and longitude (reverse geocoding)" do
      Geoinfo::City
        .new(latitude: "45.6479", longitude: "-74.3451")
        .city
        .should eq "Lachute"
    end
  end
end
