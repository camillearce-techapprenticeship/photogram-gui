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

  def create_photo
    image_url = params.fetch("image_input")

    caption = params.fetch("caption_input")

    owner_id = params.fetch("owner_id_input")

    new_photo = Photo.new

    new_photo.image = image_url
    new_photo.caption = caption
    new_photo.owner_id = owner_id

    new_photo.save

    # render({ :template => "photo_templates/new_photo.html.erb" })

    redirect_to("/photos/#{new_photo.id}")

  end
end
