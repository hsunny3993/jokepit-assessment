class BreedsController < ApplicationController
  def index
  end

  def create
    # fetch breed image from dog api
    breed_image_path = FetchBreed.call(params[:breed])

    respond_to do |format|
      format.text do
        render plain: breed_image_path
      end
    end
  end
end
