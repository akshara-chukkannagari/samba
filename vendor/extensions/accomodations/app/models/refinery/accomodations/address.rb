module Refinery
  module Accomodations
    class Address < Refinery::Core::BaseModel
      attr_accessible :street,:street_number, :town, :district, :state, :country, :lat, :lng, :alt, :business_id, :position
      belongs_to :business
    end
  end
end
