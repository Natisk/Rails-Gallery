ActiveAdmin.register_page 'Image Parser' do

  page_action :parse_url

  sidebar :tips do
    ul do
      li 'Paste the url you want to parse'
    end
  end

  content do
    para 'Hello World'
  end

end