module Refinery
  module Snippets
    module Admin
      class SnippetsController < ::Refinery::AdminController

        crudify :'refinery/snippets/snippet',
                :xhr_paging => true

      end
    end
  end
end
