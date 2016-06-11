class BadgesController < ApplicationController
  before_action :authenticate_admin!, :only => [:index, :new, :create, :update, :edit]

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
      else
        format.html { render :new }
      end
    end
  end

  def edit
    @badge = Badge.find(params[:id])
    respond_to do |format|
      format.html
    end
  end


  def update
    @badge = Badge.find(params[:id])
    respond_to do |format|
      if @badge.update(badge_params)
        format.html { redirect_to badges_path, notice: 'Badge was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  private
  def badge_params
    params.require(:badge).permit(:title, :image_url)
  end
end
