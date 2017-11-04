class PhotosController < ApplicationController
  	def destroy
  		@photo = Photo.find(params[:id])
  		@photo.destroy
  	end



    def new
      if @photo.save!
        redirect_to '/profile' # change hardcoding
      else
        redirect_to '/profile' # TEMP: To avoid crashing out on failture to create
      end
    end

  private
    def photo_params
      params.require(:photo).permit(:portfolio_id, :image, :portfolio_name)
    end

end
