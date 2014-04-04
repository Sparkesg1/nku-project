NkuProject::Application.routes.draw do

  resources :employees, :request_offs
  root to: "employees#index"
  
end
