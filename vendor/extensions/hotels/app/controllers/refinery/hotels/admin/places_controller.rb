module Refinery
  module Hotels
    module Admin
      class PlacesController < ::Refinery::AdminController

        crudify :'refinery/hotels/place',
                :title_attribute => 'name',
                :xhr_paging => true

      end
    end
  end
end
