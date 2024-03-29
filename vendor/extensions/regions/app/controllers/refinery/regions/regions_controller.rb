module Refinery
  module Regions
    class RegionsController < ::ApplicationController

      before_filter :find_all_regions
      before_filter :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @region in the line below:
        present(@page)
      end

      def show
        @region = Region.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @region in the line below:
        present(@page)
      end

    protected

      def find_all_regions
        @regions = Region.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/regions").first
      end

    end
  end
end
