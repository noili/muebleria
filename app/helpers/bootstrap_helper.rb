module BootstrapHelper
  def close_button
    button_tag('&times;'.html_safe, type: 'button',
               class: 'close', data: { dismiss: 'alert'  })
  end
end
