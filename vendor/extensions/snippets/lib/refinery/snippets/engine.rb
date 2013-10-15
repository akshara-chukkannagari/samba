module Refinery
  module Snippets
    class Engine < Rails::Engine
      extend Refinery::Engine
      isolate_namespace Refinery::Snippets

      engine_name :refinery_snippets

      initializer "register refinerycms_snippets plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "snippets"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.snippets_admin_snippets_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/snippets/snippet'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Snippets)
      end
    end
  end
end
