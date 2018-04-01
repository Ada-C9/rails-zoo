Rails.application.routes.draw do
  get "/animals", to: "animals#index", as:"animals"
  get "animals/new", to: 'animals#new', as: 'new_animal'
  post '/animals',to: 'animals#create'
  get '/animals/:id/edit', to: 'animals#edit#', as: 'edit_task'

  get "/animals/:id",to: "animals#show", as:"show"
  patch "/animals/:id", to: "animals#update"
  delete "/animals/:id", to: "animals#destroy"





  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
