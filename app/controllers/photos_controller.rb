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

    redirect_to("/photos/#{new_photo.id.to_s}")
  end

  def update_photo
    update_photo_id = params.fetch("update_photo_id")
    matching_photos = Photo.where({ :id => update_photo_id })
    the_photo = matching_photos.at(0)

    updated_caption = params.fetch("input_caption")
    updated_image = params.fetch("input_image")
    update_photo_id = params.fetch("update_photo_id")
    matching_photos = Photo.where({ :id => update_photo_id })

    
    the_photo.caption = updated_caption
    the_photo.image = updated_image
    the_photo.save

    redirect_to("/photos/#{the_photo.id}")
  end

  def add_comment
    photo_id = params.fetch("query_photo_id")
    author_id = params.fetch("query_author_id")
    body = params.fetch("query_comment")

    new_comment = Comment.new

    new_comment.photo_id = photo_id
    new_comment.author_id = author_id
    new_comment.body = body
    new_comment.save

    redirect_to("/photos/#{photo_id.to_s}")
  end
end
