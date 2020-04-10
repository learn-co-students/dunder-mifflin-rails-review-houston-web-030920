Rails.application.routes.draw do
  # resources :employees
  
  get('/dogs', to:"dogs#index")
  get('/dogs/:id', to:"dogs#show")
  get('/employees',to:"employees#index")
  get('/employees/new', to:"employees#new")
  get('/employees/:id',to:"employees#show")
  post('/employees', to:"employees#create")
  
end
