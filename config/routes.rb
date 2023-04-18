Rails.application.routes.draw do
  get("/", { :controller => "users", :action => "index" })
  get("/users", { :controller => "users", :action => "index" })
  get("/users/:username_path", { :controller => "users", :action => "show" })
  get("/insert_user_record", { :controller => "users", :action => "add_user" })

  get("/update_user/:user_id", { :controller => "users", :action => "update_user" })

  get("/photos", { :controller => "photos", :action => "index" })
  get("/photos/:photo_id", { :controller => "photos", :action => "show" })

  get("/insert_photo_record", { :controller => "photos", :action => "create_photo" })
  get("/delete_photo/:delete_photo_id", { :controller => "photos", :action => "delete_photo" })
  get("/update_photo/:update_photo_id", { :controller => "photos", :action => "update_photo" })

  get("/insert_comment_record", { :controller => "photos", :action => "add_comment" })
end
