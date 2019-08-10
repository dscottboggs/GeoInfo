require "json"
require "http"
module GeoInfo
  ADDRESS = "https://geo-info.co/"
  struct City
    include JSON::Serializable
    property city : String
    @[JSON::Field(key: "cityCode")]
    property city_code : String
    property community : String
    property country : String
    property county : String
    @[JSON::Field(key: "countyCode")]
    property county_code : String
    property latitude : String
    property longitude : String
    @[JSON::Field(key: "postalCode")]
    property postal_code : String
    property state : String
    @[JSON::Field(key: "stateCode")]
    property state_code : String
    property nearby : Array(City)?
    def self.new(*, city : String, state : String, country country_code : String) : self
      new address: GeoInfo::ADDRESS + city + ',' + state + ',' + country_code
    end
    def self.new(*, zip zip_code : String, country country_code : String)
      new address: GeoInfo::ADDRESS + zip_code + ',' + country_code
    end
    def self.new(*, latitude : String, longitude : String)
      new address: GeoInfo::ADDRESS + latitude + ',' + longitude
    end
    private def self.new(*, address : String) : self
      response = HTTP::Client.get address
      return from_json response.body if response.success?
      raise_for_bad_request! response, address
    end
    private def self.raise_for_bad_request!(response : HTTP::Client::Response, addr : String)
      raise "HTTP response #{response.status} from #{addr}"
    end
  end
end
