ActiveAdmin.register AdminUser do 
  menu :parent => "Users"
  index do    
    column :keyid                        
    column :username 
    column :user_type                    
    column :current_sign_in_at        
    column :last_sign_in_at            
    default_actions                   
  end                      

  form do |f|                         
    f.inputs "Admin Details" do       
      f.input :username                  
      f.input :password               
      f.input :password_confirmation  
    end                               
    f.actions                         
  end                                 
end                                   
