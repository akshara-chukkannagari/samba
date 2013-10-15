module Refinery
  module Snippets
    class Snippet < Refinery::Core::BaseModel
      self.table_name = 'refinery_snippets'

      attr_accessible :title, :date, :description, :link, :position

      validates :title, :presence => true, :uniqueness => true
    end
  end
end
