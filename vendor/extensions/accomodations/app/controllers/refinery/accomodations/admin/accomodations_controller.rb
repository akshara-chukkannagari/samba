module Refinery
  module Accomodations
    module Admin
      class AccomodationsController < ::Refinery::AdminController
        before_filter :find_all_accomodation_types
        crudify :'refinery/accomodations/accomodation',
                :title_attribute => 'name',
                :xhr_paging => true
                
        protected
        def find_all_accomodation_types
          @accomodation_types = Refinery::Accomodations::AccomodationType.all
        end

      end
    end
  end
end
