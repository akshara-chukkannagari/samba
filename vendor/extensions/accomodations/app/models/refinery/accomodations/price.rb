module Refinery
  module Accomodations
    class Price < Refinery::Core::BaseModel

      attr_accessible :original, :after_discount, :distribution, :currency, :accomodation_id, :position

      validates :original, :distribution, :presence => true, :uniqueness => true
    end
  end
end
