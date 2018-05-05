module ApplicationHelper
  def toast_flash
    flash_messages = []
    flash.each do |type, message|
      type = 'success' if type == 'notice'
      type = 'error' if type == 'alert'
      
      text = "<script>
      Snackbar.show({
        text: '#{message}',
        customClass:'snackbar-#{type}',
        pos: 'bottom-center',
        duration: 5000000
        });
      </script>"
      flash_messages << text.html_safe if message
    end
    flash_messages.join("\n").html_safe
  end
end
