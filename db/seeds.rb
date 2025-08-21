# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

admin_email = ENV.fetch("ADMIN_EMAIL", "loldlm1@gmail.com")
admin_pass  = ENV.fetch("ADMIN_PASSWORD", "changeme123")

user = User.find_or_initialize_by(email: admin_email)
if user.new_record?
  user.password = admin_pass
  user.password_confirmation = admin_pass
  user.save!
  puts "[seed] Admin creado: #{admin_email}"
else
  puts "[seed] Admin ya existe: #{admin_email}"
end

# (Opcional) Si ya tienes proyectos existentes, asígnalos al admin:
WebProject.where(user_id: nil).update_all(user_id: user.id)

projects = [
  {
    title: "DailyDrip (Rails App)",
    description: <<~MD
      **Responsabilidades**
      - Implementación de nuevas funcionalidades y corrección de bugs críticos.
      - Integración de features que aumentaron la retención de usuarios.
    MD
  },
  {
    title: "Phaast (Elixir/Phoenix)",
    description: <<~MD
      **Highlights**
      - Desarrollo desde cero con arquitectura escalable.
      - CI/CD y pruebas unitarias para despliegues confiables.
    MD
  },
  {
    title: "Agency Rocket (Elixir/Phoenix)",
    description: <<~MD
      **Contribución**
      - Refactorización de lógica existente y creación de nuevas funcionalidades.
      - ORM Phoenix + PostgreSQL, integración de GraphQL.
    MD
  },
  {
    title: "LIM (Rails App)",
    description: <<~MD
      **Trabajo realizado**
      - Nuevas funcionalidades en backend y frontend.
      - Pruebas unitarias e identificación de bugs críticos.
    MD
  },
  {
    title: "QuantHub (Rails App)",
    description: <<~MD
      **Impacto**
      - Aplicación de estándares WCAG en vistas.
      - Pruebas unitarias y corrección de bugs en frontend.
    MD
  }
]

projects.each do |attrs|
  rec = WebProject.find_or_initialize_by(title: attrs[:title])
  rec.user = user
  rec.description = attrs[:description]
  rec.save!
end
