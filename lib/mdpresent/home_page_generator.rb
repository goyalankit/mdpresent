require 'erubis'


module Mdpresent
  class HomePageGenerator
    def generate
      # file with template variables
      home_page_input = File.read('home.erubis')

      # create eruby object
      home_page_eruby = Erubis::Eruby.new(home_page_input)

      link_desc_map = get_link_description_map

      # generate home.html page
      File.write('home.html', home_page_eruby.result(:link_desc => link_desc_map))
    end

    def get_link_description_map
      { "http://linkedin.com" => "LinkedIn.com", "http://google.com" => "Google.com" }
    end
  end
end
