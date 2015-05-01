class AnnouncesController < ApplicationController
  before_action :authenticate_user!, only: :create
  def index
    @good_dates = Announce.good_dates.sort_by(&:created_at).reverse!
    @bad_dates = Announce.bad_dates.sort_by(&:created_at).reverse!
    if user_signed_in?
      @user = current_user
    else
      ip = request.remote_ip
      @user = VotingSession.find_or_create_by(ip_address: ip)
    end
    @announce = Announce.new
  end

  def new
    @announce = Announce.new
  end

  def create
    @announce = Announce.new(announce_params)
    @announce.user = current_user
    if @announce.save
      respond_to do |format|
        format.html { redirect_to :index }
        format.js
      end
    else
      respond_to do |format|
        format.html { redirect_to :index }
        format.js
      end
    end
  end

  def destroy
    find_announce
    @announce.destroy

    redirect_to announces_path
  end

  def show
    find_announce
  end

  def like
    find_announce
    if user_signed_in?
      @user = current_user
    else
      ip = request.remote_ip
      @user = VotingSession.find_or_create_by(ip_address: ip)
    end
    @announce.liked_by @user
    respond_to do |format|
      format.html { render :index }
      format.js
    end
  end

  def unlike
    find_announce
    if user_signed_in?
      @user = current_user
    else
      ip = request.remote_ip
      @user = VotingSession.find_or_create_by(ip_address: ip)
    end
    @announce.unliked_by @user
    respond_to do |format|
      format.html { render :index }
      format.js
    end
  end

  private

  def announce_params
    params.require(:announce).permit(:name, :text, :good)
  end

  def find_announce
  @announce = Announce.find(params[:id])
  end
end

