module ApplicationHelper
  # Devuelve clases extra si el campo tiene errores
  def field_classes(object, base_classes, attr)
    has_error = object && object.errors[attr].present?
    base = base_classes
    err = " border-red-500 ring-1 ring-red-500"
    has_error ? (base + err) : base
  end

  # Muestra el primer error del campo
  def field_error_text(object, attr)
    return unless object && object.errors[attr].present?
    content_tag(:p, object.errors[attr].first, class: "mt-1 text-sm text-red-600")
  end
end
