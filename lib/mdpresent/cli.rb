require 'thor'
require 'mdpresent'

module Mdpresent
  class CLI < Thor
    desc "new", "create a new project for presentations"
    def new(dir_name)
      begin
        # create directory if it doesn't exist already
        FileUtils.mkdir_p(dir_name) unless File.directory?(dir_name)

        # copy the template files to user directory
        FileUtils.cp_r(Dir.glob("#{Mdpresent.root}/lib/mdpresent/templates/*") , dir_name)
      rescue
        puts $!, $@
      end
    end
  end
end
