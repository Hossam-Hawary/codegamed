class BadgesController < ApplicationController
  def index
    @badges = Badge.all
  end
  def new
    @badge=Badge.new
  end
  def create
    @badge = Badge.new(badge_params)

    respond_to do |format|
      if @badge.save
        format.html { redirect_to badges_path, notice: 'Badge was successfully created.' }
        format.json { render :index, status: :created, location: Badge }
      else
        format.html { render :new }
        format.json { render json: Badge.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  def badge_params
    params.require(:badge).permit(:title,:image_url)
  end
end
