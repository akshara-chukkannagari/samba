module Refinery
  module Accomodations
    class Business < Refinery::Core::BaseModel

      attr_accessible :name, :details, :licence, :nic, :url, :phone, :email, :position
      validates :name, :presence => true, :uniqueness => true
      attr_accessible :address_attributes
     
      has_one :address
     
      after_initialize :make_address
      accepts_nested_attributes_for :address
      protected
      def make_address
        self.address ||= self.build_address
      end
    end
  end
end
