ActiveAdmin.register Category do

  index do
    selectable_column
    #column :image do |category|
    #  unless category.image.blank?
    #    image_tag(category.image.img_name.url, width: 50, height: 50 )
    #  end
    #end
    column :id
    column :title
    default_actions
  end

  show do
    panel 'Category Details' do
      attributes_table_for category do
        #row :image do |category|
        #  unless category.image.blank?
        #    image_tag(category.image.img_name.url)
        #  end
        #end
        row :title
      end
    end
  end

  form html: {enctype: 'multipart/form-data'} do |f|
    f.semantic_errors :base
    f.inputs 'Category', multipart: true do
      f.input :title
      #f.inputs for: [:upload_file, f.object.upload_file || UploadFile.new] do |file|
      #  file.input :img_name, as: :file, hint: file.object.img_name.nil? ? f.template.content_tag(:span, 'no map yet') : file.template.image_tag(file.object.img_name.url(:thumb))
      #  file.input :remote_img_name_url, as: :url
      #end
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