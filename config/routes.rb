Rails.application.routes.draw do
  get 'animals/index'

  get 'animals/show'

  get 'animals/new'

  get 'animals/create'

  get 'animals/edit'

  get 'animals/update'

  get 'animals/destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
