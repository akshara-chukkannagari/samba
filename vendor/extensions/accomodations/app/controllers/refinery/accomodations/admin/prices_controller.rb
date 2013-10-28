module Refinery
  module Accomodations
    module Admin
      class PricesController < ::Refinery::AdminController

        crudify :'refinery/accomodations/price',
                :title_attribute => 'distribution',
                :xhr_paging => true

      end
    end
  end
end
