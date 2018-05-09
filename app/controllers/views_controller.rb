class ViewsController < ApplicationController
	 skip_before_action :authenticate_user!, only: [ :image ]
		
		def image
			view = View.create 
			view.open_counter += 1
			view.save
			redirect_to "https://vagas-programador.herokuapp.com/assets/logo-f55af0183edfbcab4406c4472840ebef327f3464d4d97c4265a9b041e776bfe2.png"
		end

end