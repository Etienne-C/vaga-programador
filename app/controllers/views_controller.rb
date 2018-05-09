class ViewsController < ApplicationController
	 skip_before_action :authenticate_user!, only: [ :image ]
		
		def image
			view = View.create 
			view.open_counter += 1
			view.save
		end

end