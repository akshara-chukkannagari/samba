module Refinery
  module Accomodations
    class AccomodationTypesController < ::ApplicationController

      before_filter :find_all_accomodation_types
      before_filter :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @accomodation_type in the line below:
        present(@page)
      end

      def show
        @accomodation_type = AccomodationType.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @accomodation_type in the line below:
        present(@page)
      end

    protected

      def find_all_accomodation_types
        @accomodation_types = AccomodationType.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/accomodation_types").first
      end

    end
  end
end
