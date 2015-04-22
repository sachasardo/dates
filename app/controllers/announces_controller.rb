class AnnouncesController < ApplicationController
  def index
    @good_dates = Announce.good_dates
    @bad_dates = Announce.bad_dates
  end

  def new
    @announce = Announce.new
  end

  def create
     @announce = Announce.new(announce_params)

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

  private

  def announce_params
    params.require(:announce).permit(:name, :text)
  end

  def find_announce
  @announce = Announce.find(params[:id])
  end
end

