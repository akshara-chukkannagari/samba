module Refinery
  module Accomodations
    class Address < Refinery::Core::BaseModel

      attr_accessible :street,:street_number, :town, :district, :state, :country, :lat, :lng, :alt, :accomodation_id, :position

      validates :street,:street_number, :district, :state, :country, :presence => true
      belongs_to :accomodation
    end
  end
end
