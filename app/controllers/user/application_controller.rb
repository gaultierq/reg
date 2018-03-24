class User::ApplicationController < ApplicationController
  layout 'user'

  before_action :authenticate_user!
end
