ActiveAdmin.register News do
  form do |f|                         
    f.inputs "Admin Details" do
      f.input :title
      f.input :description
      f.has_many :admin_attachments do |n|
        n.input :attachment_name
      end
    end                               
    f.actions                         
  end
  
  
end
