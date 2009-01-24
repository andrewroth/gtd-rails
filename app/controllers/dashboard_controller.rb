class DashboardController < ApplicationController
  def home
    render(:action => 'anon') unless @user
  end
end
