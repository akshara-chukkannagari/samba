module Refinery
  module Snippets
    class Engine < Rails::Engine
      extend Refinery::Engine
      isolate_namespace Refinery::Snippets

      engine_name :refinery_snippets

      initializer "register refinerycms_places plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "places"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.snippets_admin_places_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/snippets/place',
            :title => 'name'
          }
          plugin.menu_match = %r{refinery/snippets/places(/.*)?$}
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Places)
      end
    end
  end
end
