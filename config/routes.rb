Rails.application.routes.draw do
  get("/", { :controller => "users", :action => "index" })
  get("/users", { :controller => "users", :action => "index" })
  get("/users/:username_path", { :controller => "users", :action => "show" })

  get("/photos", { :controller => "photos", :action => "index" })
  get("/photos/:photo_id", { :controller => "photos", :action => "show" })

  get("/insert_photo_record", { :controller => "photos", :action => "create_photo"})

  get("/delete_photo/:delete_photo_id", { :controller => "photos", :action => "delete_photo" })
  
end
