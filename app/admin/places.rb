ActiveAdmin.register Place do

  permit_params :title, :description, :category_id, :user_id, :active, :main_photo, pictures: []

  form do |f|
    f.inputs do
      f.input :title
      f.input :description

      f.input :category_id, :label => 'Category', :as => :select, :collection => Category.all.map{|u| ["#{u.title}", u.id]}

      f.input :user_id, :label => 'User', :as => :select, :collection => User.all.map{|u| ["#{u.name}", u.id]}

      f.input :active

      if f.object.main_photo.attached?
        f.input :main_photo,
          :as => :file,
          :hint => image_tag(
            url_for(
              f.object.main_photo.variant(
                combine_options: {
                  gravity: 'Center',
                  crop: '50x50+0+0'
                }
              )
            )
          )
      else
        f.input :main_photo, :as => :file
      end

      f.inputs do
        f.input :pictures, as: :file, input_html: { multiple: true }
      end

    end
    f.actions
  end

  index do
    selectable_column
    id_column

    column :user do |place|
      link_to place.user.name, admin_user_path(place.user)
    end

    column :title do |place|
      link_to place.title, admin_place_path(place)
    end
    column :description
    column :category
    column :active
    column :main_photo do |place|
      if place.main_photo.attached?
        image_tag place.main_photo.variant(
          combine_options: {
            gravity: 'Center',
            crop: '50x50+0+0'
          }
        )
      end
    end

    actions
  end

  show do
    attributes_table do
      row :title
      row :description
      row :category
      row :active
      row :user

      row :main_photo do |place|
        if place.main_photo.attached?
          image_tag place.main_photo.variant(
            combine_options: {
              gravity: 'Center',
              crop: '550x550+0'
            }
          )
        end
      end

      row :pictures do

        ul do
          place.pictures.each do |img|
            li do
              image_tag(img.variant(
                combine_options: {
                  gravity: 'Center',
                  crop: '250x250+0+0'
                }
              ))
            end
          end
        end

      end
    end
  end

end
