
require 'thor'
require 'mdpresent'
module Mdpresent
  class CLI < Thor

    desc "new", "create a new project for presentations"
    def new dir_name
      begin
        # create directory if it doesn't exist already
        FileUtils.mkdir_p(dir_name) unless File.directory?(dir_name)

        # copy the template files to user directory
        FileUtils.cp_r(Dir.glob("#{Mdpresent.root}/lib/mdpresent/templates/*") , dir_name)
      rescue
        puts $!, $@
      end
    end

    desc "setup heroku", "setup the platform. Currently only \"heroku\" is supported"
    def setup platform
      abort I18n.t :platform_not_supported, { platform: platform } unless PLATFORMS.include?(platform.downcase)
      Heroku.setup
    end

    desc "generate file", "generate file from markdown"
    def generate file
      Command.generate_presentation file
    end
  end
end
