module Refinery
  module Accomodations
    class Engine < Rails::Engine
      extend Refinery::Engine
      isolate_namespace Refinery::Accomodations

      engine_name :refinery_accomodations

      initializer "register refinerycms_addresses plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "addresses"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.accomodations_admin_addresses_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/accomodations/address',
            :title => 'street'
          }
          plugin.menu_match = %r{refinery/accomodations/addresses(/.*)?$}
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Addresses)
      end
    end
  end
end
