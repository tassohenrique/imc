Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      post '/imc', to: 'imc#imc_method'
    end
  end
end
