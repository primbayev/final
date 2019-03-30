ActiveAdmin.register Comment do
  permit_params :user_id, :place_id, :body, :food_quality, :service_quality, :interior

  form do |f|
    f.inputs do
      f.input :user_id, :label => 'User', :as => :select, :collection => User.all.map{|u| ["#{u.name}", u.id]}
      f.input :place_id, :label => 'Place', :as => :select, :collection => Place.all.map{|u| ["#{u.title}", u.id]}
      f.input :body
      f.input :food_quality
      f.input :service_quality
      f.input :interior
    end
    f.actions
  end

  index do
    selectable_column
    id_column

    column :user do |comment|
      link_to comment.user.name, admin_user_path(comment.user)
    end

    column :place do |comment|
      link_to comment.place.title, admin_place_path(comment.place)
    end

    column :body
    column :food_quality
    column :service_quality
    column :interior

    actions
  end

  show do
    attributes_table do
      row :user
      row :place
      row :body
      row :food_quality
      row :service_quality
      row :interior
    end
  end
end
