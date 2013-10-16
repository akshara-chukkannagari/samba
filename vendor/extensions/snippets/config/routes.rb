Refinery::Core::Engine.routes.draw do

  # Frontend routes
  namespace :snippets do
    resources :snippets, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :snippets, :path => '' do
    namespace :admin, :path => Refinery::Core.backend_route do
      resources :snippets, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end


  # Frontend routes
  namespace :snippets do
    resources :places, :only => [:index, :show]
  end

  # Admin routes
  namespace :snippets, :path => '' do
    namespace :admin, :path => "#{Refinery::Core.backend_route}/snippets" do
      resources :places, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
