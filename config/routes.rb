Rails.application.routes.draw do

  case GrabOnRent.config.application
  when 'CUSTOMER'
    root 'bookings#booking_form'
    post 'book_ride', to: 'bookings#create_ride'
  when 'DRIVER'
    root 'drivers#login'
    post '/login', to: 'drivers#verify_login'
    get '/drivers/:id', to: 'drivers#driver_home_page', as: :drivers
    post 'confirm_ride', to: 'drivers#confirm_ride'
    get 'log_out', to: 'drivers#log_out'
  when 'ADMIN'
    root 'admin#login'
    post '/login', to: 'admin#verify_login'
    get 'dashboard', to: 'admin#dash_board', as: :admin
    get 'log_out', to: 'admin#log_out'

  end

end
