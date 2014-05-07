Rails.application.routes.draw do

  get '/', to: 'trackerhub#index'

  resources :projects
end
