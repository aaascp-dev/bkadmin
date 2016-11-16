class LoginController < ApplicationController
  layout "login"

  def index
    if current_user
      redirect_to glass_types_path
    end
  end
end
