class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  private

  def after_sign_out_path_for(_resource_or_scope)
    '/signout.html'
  end
end
