class User::TapsController < User::ApplicationController
  before_action :set_tap, only: :show

  # GET /user/taps
  def index
    @taps = current_user.taps.all
  end

  # GET /user/taps/1
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tap
      @tap = current_user.taps.find(params[:id])
    end
end
