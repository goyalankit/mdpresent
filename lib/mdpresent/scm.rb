module Mdpresent
  class Git

    class << self
      def git_installed?
        Logger.log("Checking if git is installed...")
        success = Command.execute I18n.t("commands.git.which")

        fail I18n.t("errors.git_which_failed") unless success
      end

      def is_git_repo?
        Logger.log("Checking if already a git repo")
        Command.execute I18n.t("commands.git.status")
      end

      def git_init
        Logger.log("Initializing git repo now...")
        success = Command.execute I18n.t("commands.git.init")

        fail I18n.t("errors.git_init_failed") unless success
      end

      def setup_git
        Logger.log("Setting up git...")
        # check if git is installed
        git_installed?

        # initialize the repo if not already
        git_init unless is_git_repo?
      end

      def heroku_remote_present?
        Command.execute I18n.t("commands.git.heroku_remote")
      end

      def origin_remote_present?
        puts "Checking if remote present..."
        Command.execute I18n.t("commands.git.origin_remote")
      end

      def git_add_remote user_name, repo_name
        puts "Adding remote..."
        Command.execute I18n.t("commands.github.add_remote", {user_name: user_name.strip, repo_name: repo_name.strip})
      end

      def gh_pages_branch_present?
        puts "Adding branch for github pages.."
        Command.execute I18n.t("commands.git.gh_pages_remote")
      end
    end # end of class << self

  end # end of class Git
end # end of Module
