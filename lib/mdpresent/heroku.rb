module Mdpresent
  class Heroku
    
    attr_accessor :heroku

    class << self
      def setup
        @heroku = Command.path("heroku")
        abort I18n.t :install_heroku_toolbelt unless @heroku

        puts "[S] Found heroku toolbelt..."

        # login to heroku
        login

        # create heroku app
        create
      end

      def login
        success = Command.execute I18n.t("commands.heroku.login")
        abort I18n.t("heroku_login_failed") unless success
      end

      def create
        puts "Creating new heroku app..."
        success = Command.execute I18n.t("commands.heroku.create")
        abort I18n.t("heroku_create_failed") unless success
      end
    end
  end
end
