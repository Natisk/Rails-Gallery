ActiveAdmin.register Category do

  index do
    selectable_column
    column :id
    column :title
    default_actions
  end

  show do
    panel 'Category Details' do
      attributes_table_for category do
        row :title
      end
    end
  end

  form html: {enctype: 'multipart/form-data'} do |f|
    f.semantic_errors :base
    f.inputs 'Category', multipart: true do
      f.input :title
    end
    f.actions
  end

  controller do
    def create
      @category = Category.new(params[:category])
      if @category.save
        redirect_to admin_category_url(@category), notice: 'Category was successfully created.'
      else
        render :new
      end
    end

    def update
      @category = Category.find(params[:id])
      if @category.update_attributes(params[:category])
        redirect_to admin_category_url(@category), notice: 'Technology was successfully updated.'
      else
        render :edit
      end
    end
  end

end