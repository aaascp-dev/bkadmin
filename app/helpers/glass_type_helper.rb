module GlassTypeHelper
  def error_message(glass_type)
    glass_type.errors.messages[:name][0]
  end

  def active_status(glass_type)
    if glass_type.errors.any?
      return "active"
    end
    return ""
  end
end
