module ApplicationHelper
  PAGEJS_ALIASES = { 'create' => 'new', 'update' => 'edit' }

  def pagejs
    controller = params[:controller]
    view = PAGEJS_ALIASES[pagejs_action] || pagejs_action
    "#{controller}##{view}"
  end

  def pagejs_action
    if params[:controller] == 'orders'
      "#{params[:insurance_type]}_#{params[:current_step]}"
    else
      params[:action]
    end
  end

  def centralized_logo(current_page)
    pages_with_centralized_logo = [
      'devise/registrations#edit',
      'ideas#index',
      'ideas#edit',
      'incrivel#index',
      'users#index'
    ]

    pages_with_centralized_logo.include?(current_page)
  end

  def full_width_container(current_page)
    pages_with_centralized_logo = [
      'ideas#index',
      'ideas#show',
      'ideas#new',
      'ideas#edit',
      'incrivel#index',
      'users#index'
    ]

    pages_with_centralized_logo.include?(current_page)
  end
end
