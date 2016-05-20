class LevelsController < ApplicationController
# before_filter :login
# before_action :set_category, only: [:show, :edit, :update, :destroy]
	def login
		if current_user == nil
			redirect_to root_path
		end
	end
	def index
		@levels = Level.order("levels.order").all
	end
	def new
		@level=Level.new
	end
	def create
		@level = Level.new(level_params)
		if @level.order
			@level.order+=1
			if @level.order <= Level.maximum("order")
				# resort the levels
				Level.where("levels.order >= #{@level.order}").each do |level|
				Level.update(level,"order"=>level.order+1)
				end

			end
		else
			@level.order=1
		end
		respond_to do |format|
			if @level.save
				format.html { redirect_to levels_path, notice: 'Level was successfully created.' }
				format.json { render :index, status: :created, location: @level }
			else
				format.html { render :new }
				format.json { render json: @category.errors, status: :unprocessable_entity }
			end
		end
	end
private
	def level_params
		params.require(:level).permit(:order,:badge_id)
	end
end
