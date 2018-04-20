class Admin::MainController < ApplicationController
  layout 'admin'

  before_action :authenticate_admin!
end
