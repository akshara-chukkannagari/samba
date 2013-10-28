module Refinery
  module Accomodations
    module Admin
      class AddressesController < ::Refinery::AdminController

        crudify :'refinery/accomodations/address',
                :title_attribute => 'street',
                :xhr_paging => true

      end
    end
  end
end
