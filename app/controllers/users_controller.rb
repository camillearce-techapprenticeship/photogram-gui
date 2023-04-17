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
end
