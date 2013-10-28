module Refinery
  module Accomodations
    module Admin
      class BusinessesController < ::Refinery::AdminController

        crudify :'refinery/accomodations/business',
                :title_attribute => 'name',
                :xhr_paging => true

      end
    end
  end
end
