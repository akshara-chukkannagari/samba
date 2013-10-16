module Refinery
  module Snippets
    module Admin
      class PlacesController < ::Refinery::AdminController

        crudify :'refinery/snippets/place',
                :title_attribute => 'name',
                :xhr_paging => true

      end
    end
  end
end
