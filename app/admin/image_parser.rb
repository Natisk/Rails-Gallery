ActiveAdmin.register_page 'Image Parser' do

  page_action :parse_url, method: :post do
    url = params[:parse_link]
    page = Nokogiri::HTML(open(url))
    images = page.css('img')['src']
  end

  sidebar :tips do
    ul do
      li 'Paste the url you want to parse'
    end
  end

  content do
    semantic_form_for :image_parser, url: admin_image_parser_url, builder: ActiveAdmin::FormBuilder do |f|
      f.inputs 'Url to parse' do
        f.input :parse_link
      end
      f.actions
    end
  end

end