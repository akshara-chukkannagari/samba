module Refinery
  module Accomodations
    class Accomodation < Refinery::Core::BaseModel
      self.table_name = 'refinery_accomodations'

      attr_accessible :name, :details, :teaser_image_id, :phone_number, :email, :url, :user_id, :available_from,:available_till, :sold_out, :position, :accomodation_type_id
      attr_accessible :price_attributes

      validates :name, :details,:phone_number, :email, :presence => true

      belongs_to :teaser_image, :class_name => '::Refinery::Image'
      belongs_to :accomodation_type
      has_one :price
      
      accepts_nested_attributes_for  :price
    end

  end
end
