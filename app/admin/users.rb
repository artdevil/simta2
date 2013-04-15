ActiveAdmin.register User do
  menu :parent => "Users"
  index do    
    column :keyid                        
    column :name 
    column :user_type                    
    column :limit_proposal       
    column :limit_scription            
    default_actions                   
  end
  
  filter :user_type, :as => :select, :collection => ["mahasiswa", "dosen"]
  
  controller do
    def new
      @user = User.new
      @user.build_user_info
    end
    
    def create
      @user = User.new(params[:user])
      if params[:user][:user_type] == "dosen"
        if params[:user][:limit_proposal].blank?
          @user.limit_proposal = AdminConfig.find(1).max_lecture_student_proposal
        end
        if params[:user][:limit_scription].blank?
          @user.limit_scription = AdminConfig.find(1).max_lecture_student_scription
        end
      end
      if @user.save
        respond_to do |format|
          format.html { redirect_to admin_users_path, :flash => {:success => "dosen berhasil dimasukkan"} }
          format.js
        end
      end
    end
  end
  
  form do |f|                         
    f.inputs "Admin Details" do
      f.input :keyid       
      f.input :name
      f.input :user_type, :as => :select, :include_blank => false, :collection => ["mahasiswa", "dosen"]
      f.input :limit_proposal
      f.input :limit_scription        
      f.input :password               
      f.input :password_confirmation  
    end                               
    f.actions                         
  end          
end
