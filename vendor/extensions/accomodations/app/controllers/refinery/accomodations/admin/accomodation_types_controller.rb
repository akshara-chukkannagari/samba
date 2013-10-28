module Refinery
  module Accomodations
    module Admin
      class AccomodationTypesController < ::Refinery::AdminController

        crudify :'refinery/accomodations/accomodation_type',
                :title_attribute => 'name',
                :xhr_paging => true

      end
    end
  end
end
