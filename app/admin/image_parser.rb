require 'nokogiri'
require 'open-uri'

ActiveAdmin.register_page 'Image Parser' do

  page_action :parse_url, method: :post do
    @images = Array.new
    @categories = Category.all
    @url = params[:image_parser][:parse_link]
    site_root = @url.split('/')[0] + '//' + @url.split('/')[2]
    valid_url = /^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?$/ix.match(@url).nil?
    if valid_url
      redirect_to :back, alert: 'Invalid domain name'
    else
      page = Nokogiri::HTML(open(@url))
      page.css('img').each do |img|
        if img['src'].include? ('http')
          @images << img['src']
        else
          @images << site_root + img['src']
        end
      end
      render 'admin/image_parser/parse_url'
    end
  end

  page_action :save_data, method: :post do
    image = Image.new(params[:image])
    if image.save
      render 'admin/image_parser/parse_url'
    else
      render js: "alert('Image cannot be saved')", status: :error
    end
  end

  sidebar :tips do
    ul do
      li 'Paste the url you want to parse'
      li 'After submit you are going to see the list of images parser was able to get from the url you have pasted'
      li 'You can save images'
      li 'Dont forget to type image title before save'
      li 'You can remove images before or after save'
    end
  end

  content do
    semantic_form_for :image_parser, url: admin_image_parser_parse_url_url, builder: ActiveAdmin::FormBuilder do |f|
      f.inputs 'Url to parse' do
        f.input :parse_link
      end
      f.actions
    end
  end

end