module DeviseHelper
  def devise_error_messages!
    flash.now[:alert] = resource.errors.full_messages.join(' ') unless resource.errors.empty?
  end
end
