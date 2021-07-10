class Admin::BadgesController < Admin::BaseController
  before_action :find_badge, only: %i[show]
  def index
    @badges = Badge.all
  end

  def show; end

  def new
    @badge = current_user.authored_badges.new
  end

  def create
    @badge = current_user.authored_badges.new(badge_params)

    if @badge.save
      redirect_to admin_badge_path(@badge), notice: t('.success')
    else
      render :new
    end
  end

  private

  def badge_params
    params.require(:badge).permit(:name, :file_name, :rule, :type_badge)
  end

  def find_badge
    @badge = Badge.find(params[:id])
  end
end
