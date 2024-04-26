class ChangeController < ApplicationController
  def roles
    @user = User.all

  end
end
