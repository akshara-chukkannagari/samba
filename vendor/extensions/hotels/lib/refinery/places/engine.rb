module Refinery
  module Hotels
    class Engine < Rails::Engine
      extend Refinery::Engine
      isolate_namespace Refinery::Hotels

      engine_name :refinery_hotels

      initializer "register refinerycms_places plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "places"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.hotels_admin_places_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/hotels/place',
            :title => 'name'
          }
          plugin.menu_match = %r{refinery/hotels/places(/.*)?$}
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Places)
      end
    end
  end
end
