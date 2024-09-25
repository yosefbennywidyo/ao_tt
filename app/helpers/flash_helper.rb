module FlashHelper
  def flash_messages
    flash.each do |type, message|
      concat(content_tag(:div, class: flash_class(type)) do
        content_tag(:div, message, class: "container px-2 mx-auto py-4 text-white text-center font-medium font-sans")
      end)
    end
    nil # Avoids extra output
  end

  private

  def flash_class(type)
    case type
    when "alert"
      "bg-red-500"
    when "notice"
      "bg-green-500"
    else
      "bg-blue-500" # Default or handle other flash types if needed
    end
  end
end
