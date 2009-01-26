class DashboardController < ApplicationController
  def home
    render(:action => 'anon') unless current_user
  end
end
