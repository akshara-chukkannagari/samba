module Refinery
  module SambaContents
    class SambaContent < Refinery::Core::BaseModel
      self.table_name = 'refinery_samba_contents'

      attr_accessible :title, :description, :user_id, :position
       has_many_page_images 
      validates :title, :presence => true, :uniqueness => true
      
      acts_as_indexed :fields => [:title, :description]
    end
  end
end
