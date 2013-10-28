module Refinery
  module Accomodations
    class Accomodation < Refinery::Core::BaseModel
      self.table_name = 'refinery_accomodations'
      
      attr_accessible :name, :details, :teaser_image_id, :phone_number, :email, :url, :user_id, :available_from,:available_till,
      :sold_out, :position, :accomodation_type_id, :business_id, :language
      attr_accessible :price_attributes

      validates :name, :details, :presence => true

      belongs_to :teaser_image, :class_name => '::Refinery::Image'
      belongs_to :accomodation_type
      belongs_to :business
      has_one :price
          
      after_initialize :make_price
      accepts_nested_attributes_for  :price
      
      acts_as_indexed :fields => [:title, :details]
        
      def make_price
        self.price ||= self.build_price
      end

    end

  end
end
