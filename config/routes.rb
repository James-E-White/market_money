Rails.application.routes.draw do
    namespace :api do 
     namespace :v0 do 
      resources :markets do
      end
     end
    end
end
