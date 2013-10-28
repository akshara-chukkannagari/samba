module Refinery
  module SambaContents
    class Engine < Rails::Engine
      extend Refinery::Engine
      isolate_namespace Refinery::SambaContents

      engine_name :refinery_samba_contents

      initializer "register refinerycms_samba_contents plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "samba_contents"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.samba_contents_admin_samba_contents_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/samba_contents/samba_content'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::SambaContents)
      end
    end
  end
end
