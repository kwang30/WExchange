class PhotosController < ApplicationController
  	def destroy
  		@photo = Photo.find(params[:id])
  		@photo.destroy
  	end

  private
    def photo_params
      params.require(:photo).permit(:image)
    end

end
