class AdminController < AuthController
  include Pagy::Backend
  layout "admin"
end