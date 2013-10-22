Refinery::Core::Engine.routes.draw do

  # Frontend routes
  namespace :samba_contents do
    resources :samba_contents, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :samba_contents, :path => '' do
    namespace :admin, :path => Refinery::Core.backend_route do
      resources :samba_contents, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
