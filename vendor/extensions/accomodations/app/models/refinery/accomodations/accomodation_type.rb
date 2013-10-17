module Refinery
  module Accomodations
    class AccomodationType < Refinery::Core::BaseModel

      attr_accessible :name, :position

      validates :name, :presence => true, :uniqueness => true
      has_many :accomodation_types
    end
  end
end
