module Refinery
  module Accomodations
    class AccomodationsController < ::ApplicationController

      before_filter :find_all_accomodations
      before_filter :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @accomodation in the line below:
        present(@page)
      end

      def show
        @accomodation = Accomodation.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @accomodation in the line below:
        present(@page)
      end

    protected

      def find_all_accomodations
        @accomodations = Accomodation.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/accomodations").first
      end

    end
  end
end
