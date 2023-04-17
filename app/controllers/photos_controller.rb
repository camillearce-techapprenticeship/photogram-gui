class PhotosController < ApplicationController
  def index
    @list_of_photos = Photo.all.order({ :created_at => :desc })

    render({ :template => "photo_templates/index.html.erb" })
  end

  def show
    photo_id = params.fetch("photo_id")

    @the_photo = Photo.where({ :id => photo_id }).at(0)

    render({ :template => "photo_templates/show.html.erb" })
  end

  def delete_photo
    photo_id = params.fetch("delete_photo_id")

    the_photo = Photo.where({ :id => photo_id }).at(0)

    the_photo.destroy

    # render({ :template => "photo_templates/delete_photo.html.erb" })
    redirect_to("/photos")
  end
end
