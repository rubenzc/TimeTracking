Rails.application.routes.draw do
  get '/' => 'site#home'

  get '/contact' => 'site#contact'

  resources :projects, only: [:index, :show] do
    resources :entries, only: [:index, :new, :create, :edit, :update, :destroy]
  end

  #Todo esto ya no es necesario dado que las
  #3 líneas de arriba realizan el mismo trabajo
  #Haz un rake routes para ver todas las rutas
  # get '/projects' => 'projects#index'

  # get '/projects/:id' => 'projects#show'

  # get '/projects/:project_id/entries' => 'entries#index'

  # get '/projects/:project_id/entries/new' => 'entries#new'
end
