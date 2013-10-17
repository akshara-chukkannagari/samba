module Refinery
  module Accomodations
    class Accomodation < Refinery::Core::BaseModel
      self.table_name = 'refinery_accomodations'

      attr_accessible :name, :details, :teaser_image_id, :phone_number, :email, :url, :user_id, :position, :accomodation_type_id

      validates :name, :presence => true, :uniqueness => true

      belongs_to :teaser_image, :class_name => '::Refinery::Image'
      belongs_to :accomodation_type
    end
  end
end
