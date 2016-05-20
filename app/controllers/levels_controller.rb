class LevelsController < ApplicationController
before_filter :login

#all actions using the methods post/put/delete where recognized as forgery attempts so we stoped the authnticity token
skip_before_filter :verify_authenticity_token, :only => [:show_user_levels]
	def login
		if current_user == nil
			redirect_to root_path
		end
	end


	def show_user_levels

		@levels = current_user.levels.order(order: :asc)
		@temp_badge = {}
		@badges = []
		i=0
		salt  = SecureRandom.random_bytes(1)
		key = ActiveSupport::KeyGenerator.new('codeGamed_Secret_Key').generate_key(salt)
		crypt = ActiveSupport::MessageEncryptor.new(key)


		@levels.each do|level|

			encrypted_id = crypt.encrypt_and_sign(level.id)
			#to verify the decription you will do the steps in the top then this line
			# decrypted_data = crypt.decrypt_and_verify(encrypted_id) #this will result the real id

			@temp_badge[:level_id] = encrypted_id
			@temp_badge[:title]  = level.badge.title
			@temp_badge[:image_url]  = level.badge.image_url


			@badges[i] = @temp_badge

			#must be emptied to store the next value don't try to remove
			@temp_badge= {}
			i=i+1


		end


		@locked_levels = Level.count() - current_user.levels.count()

		render :json =>  {'badges':@badges , 'locked_levels': @locked_levels}

	end
end
