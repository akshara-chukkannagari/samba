module Refinery
  module Regions
    class Region < Refinery::Core::BaseModel
      self.table_name = 'refinery_regions'

      attr_accessible :name, :description, :url, :user_id, :position

      validates :name, :presence => true, :uniqueness => true
    end
  end
end
