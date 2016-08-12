Rails.application.routes.draw do
  resources :cocktails, only: [:index, :show, :create, :new, :update] do
    resources :doses, only: [:destroy, :create], shallow:true
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
