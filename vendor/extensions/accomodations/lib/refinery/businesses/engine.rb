module Refinery
  module Accomodations
    class Engine < Rails::Engine
      extend Refinery::Engine
      isolate_namespace Refinery::Accomodations

      engine_name :refinery_accomodations

      initializer "register refinerycms_businesses plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "businesses"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.accomodations_admin_businesses_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/accomodations/business',
            :title => 'name'
          }
          plugin.menu_match = %r{refinery/accomodations/businesses(/.*)?$}
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Businesses)
      end
    end
  end
end
