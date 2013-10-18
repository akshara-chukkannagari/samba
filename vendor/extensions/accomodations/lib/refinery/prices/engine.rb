module Refinery
  module Accomodations
    class Engine < Rails::Engine
      extend Refinery::Engine
      isolate_namespace Refinery::Accomodations

      engine_name :refinery_accomodations

      initializer "register refinerycms_prices plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "prices"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.accomodations_admin_prices_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/accomodations/price',
            :title => 'distribution'
          }
          plugin.menu_match = %r{refinery/accomodations/prices(/.*)?$}
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Prices)
      end
    end
  end
end
