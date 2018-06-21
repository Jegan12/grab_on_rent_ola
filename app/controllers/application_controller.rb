class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :logged_in?,
                except: %i[login, verify_login],
                unless: :customer?

  def login
    render template: 'login'
  end

  def verify_login
    instance_variable_set(ins_var, klass.find_by(login_params))
    if obj.present?
      session[:logged_in] = true
      session[:email] = obj.email
      redirect_to path(obj)
    else
      flash[:error] = 'User Name and Password is incorrect'
      redirect_to root_path
    end
  end

  def logged_in?
    @current_user = klass.find_by(email: session[:email])
    session[:logged_in]
  end

  def log_out
    reset_session
    redirect_to root_path
  end


  attr_reader :current_user
  private

  def customer?
    app_type == 'CUSTOMER'
  end

  def app_type
    GrabOnRent.config.application
  end

  def login_params
    {
        email: params[:email],
        password: Digest::MD5.hexdigest(params[:password])
    }

  end

  def klass
    Object.const_get(app_type.capitalize.camelize)
  end

  def ins_var
    '@' + app_type.downcase
  end

  def obj
    instance_variable_get(ins_var)
  end


end
