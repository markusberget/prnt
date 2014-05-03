class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate, :except => [:index]

  #layout 'index', :only => [:index]

  def authenticate
  	unless current_user
  		redirect_to users_login_path
  	end
  end

  def index
    @job = Job.new
  end


  private

  def current_user
  	@current_user || session[:current_user_id] && User.find_by(id: session[:current_user_id])
  end

end

