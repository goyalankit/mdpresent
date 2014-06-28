
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
      case platform.downcase
      when "heroku"
        Heroku.setup
      when "github"
        Github.setup
      end
    end

    desc "generate file", "generate file from markdown"
    def generate file
      Command.generate_presentation file
    end

    desc "update_home", "update the home page with new presentations"
    def update_home
      home_page_generator = HomePageGenerator.new
      home_page_generator.generate
    end

    desc "open", "open app in browser"
    def open
      case Mdpresent.platform
      when :heroku
        Heroku.open
      when :github
        Github.open
      end
    end

    desc "deploy", "deploy app to production"
    def deploy
      case Mdpresent.platform
      when :heroku
        Heroku.deploy
      when :github
        Github.deploy
      end
    end

    desc "watch", "auto-update the presentation files"
    def watch file
      Command.execute I18n.t("commands.mdpress.watch", {file: file})
    end
  end
end
