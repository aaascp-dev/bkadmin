class AdminController < ApplicationController
  before_action :is_user_logged

  def is_user_logged
    unless current_user
      redirect_to root_path
    end
  end
end
