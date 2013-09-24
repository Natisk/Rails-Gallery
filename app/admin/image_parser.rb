require 'nokogiri'
require 'open-uri'

ActiveAdmin.register_page 'Image Parser' do

  page_action :parse_url, method: :post do
    @images = Array.new
    @categories = Category.all
    url = params[:image_parser][:parse_link]
    page = Nokogiri::HTML(open(url))
    page.css('img').each do |img|
      if img['src'].include? ('http://')
        @images << img['src']
      else
        site_root = url.split('/')[0] + '//' + url.split('/')[2]
        @images << site_root + img['src']
      end
    end
    puts @images
    puts params.inspect
    render 'admin/image_parser/parse_url'
  end

  page_action :save_data, method: :post do
    image = Image.new(params[:image])
    if image.save
      render 'admin/image_parser/parse_url'
    else
      render nothing: true
    end
  end

  sidebar :tips do
    ul do
      li 'Paste the url you want to parse'
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