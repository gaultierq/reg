class Technician::ApplicationController < ApplicationController
  layout 'technician'

  before_action :authenticate_technician!
end
