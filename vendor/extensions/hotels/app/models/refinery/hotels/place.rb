module Refinery
  module Hotels
    class Place < Refinery::Core::BaseModel

      attr_accessible :name, :position

      validates :name, :presence => true, :uniqueness => true
    end
  end
end
