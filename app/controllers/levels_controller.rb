class LevelsController < ApplicationController
before_filter :login
	def login
		if current_user == nil
			redirect_to root_path
		end
	end
end
