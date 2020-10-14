Rails.application.routes.draw do
  get 'ip_addresses/validate', action: :validate, controller: :ip_addresses
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
