module Refinery
  module SambaContents
    module Admin
      class SambaContentsController < ::Refinery::AdminController

        crudify :'refinery/samba_contents/samba_content',
                :xhr_paging => true

      end
    end
  end
end
