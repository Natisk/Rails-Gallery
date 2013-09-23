require 'nokogiri'
require 'open-uri'

ActiveAdmin.register_page 'Image Parser' do

  page_action :parse_url, method: :post do
    @images = Array.new
    url = params[:image_parser][:parse_link]
    page = Nokogiri::HTML(open(url))
    page.css('img').each do |img|
      @images << img['src']
    end
    puts @images
    render 'admin/image_parser/parse_url'
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