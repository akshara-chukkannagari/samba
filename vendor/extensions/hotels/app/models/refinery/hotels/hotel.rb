module Refinery
  module Hotels
    class Hotel < Refinery::Core::BaseModel
      self.table_name = 'refinery_hotels'

      attr_accessible :name, :description, :phone_number, :email, :url, :address, :teaser_id, :position

      validates :name, :presence => true, :uniqueness => true

      belongs_to :teaser, :class_name => '::Refinery::Image'
    end
  end
end
