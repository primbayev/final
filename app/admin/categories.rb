ActiveAdmin.register Category do
  permit_params :title, :description

  form do |f|
    f.inputs do
      f.input :title
      f.input :description
    end
    f.actions
  end

  index do
    selectable_column
    id_column

    column :title do |category|
      link_to category.title, admin_category_path(category)
    end

    column :description

    actions
  end

  show do
    attributes_table do
      row :title
      row :description

    end
  end

end
