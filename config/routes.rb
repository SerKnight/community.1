Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: {registrations: "users/registrations", sessions: "users/sessions", passwords: "users/passwords", omniauth_callbacks: "users/omniauth_callbacks"}, skip: [:sessions, :registrations]
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'homepage#homepage'

  get 'thrivepass' => 'homepage#thrivepass'
  get 'tourism-collective' => 'homepage#tourism_collective'
  get 'rio-samana' => 'homepage#rio_samana'
  get 'baja-escape' => 'homepage#baja_escape'
  
  get 'projects' => 'homepage#trips_page'
  get 'our-process' => 'homepage#our_process'
  get 'about-us'  =>  'homepage#about_us'
  get 'adventure' =>  'homepage#trip_onboard'
  get 'vietnam'   =>  'homepage#vietnam'
  get 'colombia'   =>  'homepage#colombia'
  get 'india'   =>    'homepage#india'
  get 'peru'   =>    'homepage#peru'
  get 'socaltrifecta' => 'homepage#socaltrifecta'
  get 'kyrgyzstan'   =>    'homepage#kyrgyzstan'
  get 'bajabus'   =>    'homepage#bajabus'
  get 'morocco'   =>    'homepage#morocco'
  get 'give-and-surf'   =>    'homepage#giveandsurf'
  get 'consulting'  =>  'homepage#consulting'

  get '/contact-us' => 'contacts#new'
  get '/apply/:type' => 'contacts#new'
  post '/contact' => 'contacts#create'

  
  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  devise_scope :user do
    get    "login"   => "users/sessions#new",         as: :new_user_session
    post   "login"   => "users/sessions#create",      as: :user_session
    get    "signout" => "users/sessions#destroy",     as: :destroy_user_session
    
    get    "signup"  => "users/registrations#new",    as: :new_user_registration
    post   "signup"  => "users/registrations#create", as: :user_registration
    put    "signup"  => "users/registrations#update", as: :update_user_registration
    get    "account" => "users/registrations#edit",   as: :edit_user_registration
  end

end
