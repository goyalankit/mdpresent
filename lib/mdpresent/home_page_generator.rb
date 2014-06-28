require 'erubis'
require 'parseconfig'

module Mdpresent
  class HomePageGenerator
    def generate
      puts "Generating home page..."
      # file with template variables
      home_page_input = File.read('home.erubis')

      # create eruby object
      home_page_eruby = Erubis::Eruby.new(home_page_input)

      link_desc_map = get_link_description_map

      # generate home.html page
      File.write('index.html', home_page_eruby.result(:link_desc => link_desc_map))
    end

    def get_link_description_map
      project_root = `git rev-parse --show-toplevel`.strip

      # get the directory names from www directory
      Dir.chdir("#{project_root}/www")
      presentation_dirs = Dir.glob("*").select {|f| File.directory? f}
      custom_desc = get_custom_description

      # go back to home directory
      Dir.chdir("#{project_root}")

      link_desc = {}
      presentation_dirs.each do |dir_name|
        if custom_desc.keys.include?(dir_name)
          link_desc["./www/#{dir_name}"] = custom_desc[dir_name]
        else
          link_desc["./www/#{dir_name}"] = dir_name
        end
      end

      link_desc
    end

    def get_custom_description
      if File.exists?('mdpfile')
        config = ParseConfig.new('mdpfile')
        return config.params
      else
        return {}
      end
    end
  end
end
