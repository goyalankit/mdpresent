require 'i18n'

I18n.load_path = Dir["#{File.expand_path '../..', __FILE__}/lib/*.yml"]
I18n.enforce_available_locales = false
I18n.default_locale = :en

module I18n
  def t key, options={}
    I18n.translate(key, options)
  end
end
