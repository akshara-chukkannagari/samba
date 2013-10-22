module Refinery
  module SambaContents
    class SambaContentsController < ::ApplicationController
      
      layout "content_layout"

      before_filter :find_all_samba_contents
      before_filter :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @samba_content in the line below:
        present(@page)
      end

      def show
        @samba_content = SambaContent.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @samba_content in the line below:
        present(@page)
      end

    protected

      def find_all_samba_contents
        @samba_contents = SambaContent.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/samba_contents").first
      end

    end
  end
end
