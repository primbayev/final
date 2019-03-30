ActiveAdmin.register User do

  permit_params :name, :email, :admin, :active, pictures: []

  form do |f|
    f.inputs do
      f.input :name
      f.input :email
      f.input :admin
      f.input :active

      f.inputs do
        f.input :pictures, as: :file, input_html: { multiple: true }
      end

    end
    f.actions
  end

  index do
    selectable_column
    id_column

    column :name do |user|
      link_to user.name, admin_user_path(user)
    end

    column :email
    column :admin
    column :active

    actions
  end

  show do
    attributes_table do
      row :name
      row :email
      row :admin
      row :active
      row :pictures do

        ul do
          user.pictures.each do |img|
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
