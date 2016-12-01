module BeersHelper
  def style_selected(beer, style)
    if beer.beer_type == style
      return "selected"
    end
  end

  def provider_selected(beer, provider)
    if beer.provider == provider
      return "selected"
    end
  end

  def package_selected(beer, package)
    if beer.package == package
      return "selected"
    end
  end

  def characteristic_selected(beer, characteristic)
    if beer.beer_characteristics.include? characteristic
      return "selected"
    end
  end

  def boolean_to_text(value)
    if value
      return "Sim"
    else
      return "Não"
    end
  end
end
