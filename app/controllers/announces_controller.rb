class AnnouncesController < ApplicationController
  before_action :authenticate_user!, only: :create
  def index
    @good_dates = Announce.good_dates
    @bad_dates = Announce.bad_dates
  end

  def new
    @announce = Announce.new
  end

  def create
    @announce = Announce.new(announce_params)
    @announce.user = current_user
    if @announce.save
      redirect_to announce_path(@announce)
    else
      render :new
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
    @announce.liked_by current_user
    respond_to do |format|
      format.html { render :index }
      format.js
    end
  end

  def unlike
    find_announce
    @announce.unliked_by current_user
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

