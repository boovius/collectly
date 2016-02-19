module ApplicationHelper
  def toastr_flash
    flash_messages = []
    flash.keys.each do |key|
      message = flash[key]
      case key
      when 'success'
        type = 'success'
      when 'notice'
        type = 'info'
      when 'alert'
        type = 'warning'
      when 'error'
        type = 'error'
      else
        type = 'info'
      end
      text = "<script>toastr.#{type}('#{message}');</script>"
      flash_messages << text.html_safe if message
    end
    flash_messages.join("\n").html_safe
  end
end
