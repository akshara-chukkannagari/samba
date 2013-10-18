module Refinery
  module Accomodations
    class Accomodation < Refinery::Core::BaseModel
      self.table_name = 'refinery_accomodations'

      attr_accessible :name, :details, :teaser_image_id, :phone_number, :email, :url, :user_id, :available_from,:available_till, :sold_out, :position, :accomodation_type_id
      attr_accessible :address_attributes

      validates :name, :presence => true, :uniqueness => true

      belongs_to :teaser_image, :class_name => '::Refinery::Image'
      belongs_to :accomodation_type
      has_one :address
      accepts_nested_attributes_for :address

      after_initialize :make_address

      protected
      def make_address
        self.address ||= self.build_address
      end
    end

  end
end