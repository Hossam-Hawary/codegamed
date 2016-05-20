class LevelsController < ApplicationController
# before_filter :login
# before_action :set_category, only: [:show, :edit, :update, :destroy]
	def login
		if current_user == nil
			redirect_to root_path
		end
	end
	def new
		@level=Level.new
	end
end
