module BootstrapFlashHelper
  def bootstrap_flash
    flash_messages = []

    flash.each do |key, value|
      key = key.to_sym
      key = :success if key == :notice
      key = :danger  if key == :alert
      key = :danger  if key == :error

      flash_messages << content_tag(:div, value, class: "alert alert-#{key}") if value.present?
    end

    flash_messages.join('').html_safe
  end
end
