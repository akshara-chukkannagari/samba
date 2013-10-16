module Refinery
  module Hotels
    module Admin
      class HotelsController < ::Refinery::AdminController

        crudify :'refinery/hotels/hotel',
                :title_attribute => 'name',
                :xhr_paging => true

      end
    end
  end
end
