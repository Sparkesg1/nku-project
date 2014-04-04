NkuProject::Application.routes.draw do

  resources :employees, :request_offs, :sessions
  root to: "employees#index"
  
end
