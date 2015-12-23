module LocalesHelper
  LOCALE_LABELS = {
    :en => "English",
    :"en-US" => "English (US)",
    :ja => "日本語",
    :zh => "中文",
    :"zh-TW" => "繁體中文"
  }

  def locale_label(locale)
    LOCALE_LABELS[locale] || "Unknown"
  end
end