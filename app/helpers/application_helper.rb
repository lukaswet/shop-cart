module ApplicationHelper
  #
  def next_locale
    case I18n.locale
      when :en
        { name: 'English', key: :ru}
      when :ru
        { name: 'Русский', key: :en}
    end
  end

  def current_path(options)
    root_path(options)
  end

end
