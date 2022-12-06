Rails.application.routes.draw do

  # Route for map view

  get("/map", { :controller => "maps", :action => "index" })
  
  # Route for Markets views
  
  get("/markets", { :controller => "markets", :action => "index" })
  get("/markets/:path_id", { :controller => "markets", :action => "show" })

  #-------------------------

  # Routes for the User account:

  # SIGN UP FORM
  get("/user_sign_up", { :controller => "user_authentication", :action => "sign_up_form" })        
  # CREATE RECORD
  post("/insert_user", { :controller => "user_authentication", :action => "create"  })
      
  # EDIT PROFILE FORM        
  get("/edit_user_profile", { :controller => "user_authentication", :action => "edit_profile_form" })       
  # UPDATE RECORD
  post("/modify_user", { :controller => "user_authentication", :action => "update" })
  
  # DELETE RECORD
  get("/cancel_user_account", { :controller => "user_authentication", :action => "destroy" })

  # ------------------------------

  # SIGN IN FORM
  get("/user_sign_in", { :controller => "user_authentication", :action => "sign_in_form" })
  # AUTHENTICATE AND STORE COOKIE
  post("/user_verify_credentials", { :controller => "user_authentication", :action => "create_cookie" })
  
  # SIGN OUT        
  get("/user_sign_out", { :controller => "user_authentication", :action => "destroy_cookies" })
             
  #------------------------------

  # Routes for the Tank resource:

  # CREATE
  post("/insert_tank", { :controller => "tanks", :action => "create" })
          
  # READ
  get("/tanks", { :controller => "tanks", :action => "index" })
  
  get("/tanks/:path_id", { :controller => "tanks", :action => "show" })
  
  # UPDATE
  
  post("/modify_tank/:path_id", { :controller => "tanks", :action => "update" })
  
  # DELETE
  get("/delete_tank/:path_id", { :controller => "tanks", :action => "destroy" })

  #------------------------------

  # Routes for the Fuel resource:

  # CREATE
  post("/insert_fuel", { :controller => "fuels", :action => "create" })
          
  # READ
  get("/fuels", { :controller => "fuels", :action => "index" })
  
  get("/fuels/:path_id", { :controller => "fuels", :action => "show" })
  
  # UPDATE
  
  post("/modify_fuel/:path_id", { :controller => "fuels", :action => "update" })
  
  # DELETE
  get("/delete_fuel/:path_id", { :controller => "fuels", :action => "destroy" })

  #------------------------------

  # Routes for the Company resource:

  # CREATE
  post("/insert_company", { :controller => "companies", :action => "create" })
          
  # READ
  get("/companies", { :controller => "companies", :action => "index" })
  
  get("/companies/:path_id", { :controller => "companies", :action => "show" })
  
  # UPDATE
  
  post("/modify_company/:path_id", { :controller => "companies", :action => "update" })
  
  # DELETE
  get("/delete_company/:path_id", { :controller => "companies", :action => "destroy" })

  #------------------------------

  # Routes for the Terminal note resource:

  # CREATE
  post("/insert_terminal_note", { :controller => "terminal_notes", :action => "create" })
          
  # READ
  get("/terminal_notes", { :controller => "terminal_notes", :action => "index" })
  
  get("/terminal_notes/:path_id", { :controller => "terminal_notes", :action => "show" })
  
  # UPDATE
  
  post("/modify_terminal_note/:path_id", { :controller => "terminal_notes", :action => "update" })
  
  # DELETE
  get("/delete_terminal_note/:path_id", { :controller => "terminal_notes", :action => "destroy" })

  #------------------------------

  # Routes for the Facility resource:

  # CREATE
  post("/insert_facility", { :controller => "facilities", :action => "create" })
          
  # READ
  get("/facilities", { :controller => "facilities", :action => "index" })
  
  get("/facilities/:path_id", { :controller => "facilities", :action => "show" })
  
  # UPDATE
  
  post("/modify_facility/:path_id", { :controller => "facilities", :action => "update" })
  
  # DELETE
  get("/delete_facility/:path_id", { :controller => "facilities", :action => "destroy" })

  #------------------------------

end
