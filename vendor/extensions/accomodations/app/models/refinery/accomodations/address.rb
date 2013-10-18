module Refinery
  module Accomodations
    class Address < Refinery::Core::BaseModel

      attr_accessible :street, :town, :district, :state, :country, :lat, :lng, :alt, :accomodation_id, :position

      validates :street, :presence => true, :uniqueness => true
      belongs_to :accomodation
    end
  end
end
