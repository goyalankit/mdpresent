module Mdpresent
  class Heroku

    attr_accessor :heroku

    class << self
      def setup
        Logger.log("starting the setup...")
        @heroku = Command.path("heroku")
        abort I18n.t :install_heroku_toolbelt unless @heroku

        puts "[S] Found heroku toolbelt..."

        # login to heroku
        login

        # create heroku app
        create
      end

      def login
        # check if heroku remote is already present.
        # return, since heroku create has already been run
        if Git.heroku_remote_present?
          Logger.log("Heroku remote already present. Exiting.")
          puts "Heroku already setup."
          exit 1
        end

        success = Command.execute I18n.t("commands.heroku.login")
        abort I18n.t("errors.heroku_login_failed") unless success
      end

      def create

        # check if git is installed.
        # initialize the repo if not already
        Git.setup_git

        puts "Creating new heroku app..."
        success = Command.execute I18n.t("commands.heroku.create")
        success &&= Command.execute I18n.t("commands..git.initial_add")
        success &&= Command.execute I18n.t("commands.git.initial_commit", date_time: Time.now)
        abort I18n.t("errors.heroku_create_failed") unless success
      end

      def deploy
        success = Command.execute I18n.t("commands.heroku.deploy")
        abort I18n.t("errors.heroku_deploy_failed") unless success
      end

      def open
        success = Command.execute I18n.t("commands.heroku.open")
        abort I18n.t("errors.heroku_open_failed") unless success
      end
    end
  end
end

