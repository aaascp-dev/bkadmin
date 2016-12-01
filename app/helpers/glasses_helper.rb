module GlassesHelper
  def type_selected(glass, type)
    if glass.glass_type == type
      return "selected"
    end
  end

  def provider_selected(glass, provider)
    if glass.provider == provider
      return "selected"
    end
  end
end
