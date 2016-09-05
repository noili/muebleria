module BootstrapHelper

  ALERT_TYPES = { success: 'alert-success',
                  error: 'alert-danger',
                  alert: 'alert-warning',
                  notice: 'alert-info' }

  def close_button
    button_tag('&times;'.html_safe, type: 'button',
               class: 'close', data: { dismiss: 'alert'  })
  end

  def alert_class(flash_type)
    ALERT_TYPES.fetch(flash_type.to_sym)
  end

  def turn_list_group_item(visit, turn_zones)
    "list-group-item #{'list-group-item-warning' if visit && !turn_zones.include?(visit.client.zone)}"
  end
end
