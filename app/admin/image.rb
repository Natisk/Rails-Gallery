ActiveAdmin.register Image do

  index do
    selectable_column
    column :img_name do |category|
      unless category.img_name.blank?
        image_tag(category.img_name.url, width: 50, height: 50 )
      end
    end
    column :id
    column :title
    default_actions
  end

  show do
    panel 'Image Details' do
      attributes_table_for image do
        #row :image do |category|
        #  unless category.image.blank?
        #    image_tag(category.image.img_name.url)
        #  end
        #end
        row :title
        row :img_name
      end
    end
  end

  form html: {enctype: 'multipart/form-data'} do |f|
    f.semantic_errors :base
    f.inputs 'Category', multipart: true do
      f.input :title
      f.input :img_name, as: :file, hint: f.object.img_name.nil? ? f.template.content_tag(:span, 'no map yet') : f.template.image_tag(f.object.img_name.url(:thumb))
    end
    f.actions
  end

  #controller do
  #  def create
  #    @category = Category.new(params[:category])
  #    if @category.save
  #      redirect_to admin_category_url(@category), notice: 'Category was successfully created.'
  #    else
  #      render :new
  #    end
  #  end
  #
  #  def update
  #    @category = Category.find(params[:id])
  #    if @category.update_attributes(params[:category])
  #      redirect_to admin_category_url(@category), notice: 'Technology was successfully updated.'
  #    else
  #      render :edit
  #    end
  #  end
  #end

end