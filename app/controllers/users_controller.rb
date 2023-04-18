class UsersController < ApplicationController
  def index
    @list_of_users = User.all.order({ :username => :asc })

    render({ :template => "user_templates/index.html.erb" })
  end

  def show
    @username = params.fetch("username_path")

    @the_user = User.where({ :username => @username }).at(0)

    render({ :template => "user_templates/show.html.erb" })
  end

  def add_user
    username = params.fetch("input_username")

    new_user = User.new
    new_user.username = username

    new_user.save

    redirect_to("/users/#{new_user.username}")
  end

  def update_user
    user_id = params.fetch("user_id")
    new_username = params.fetch("input_username")

    the_user = User.where({ :id => user_id }).at(0)
    the_user.username = new_username

    the_user.save

    redirect_to("/users/#{the_user.username}")
  end
end
