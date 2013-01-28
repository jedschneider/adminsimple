require 'rails'

module Adminsimple
  class Engine < ::Rails::Engine
    engine_name 'adminsimple'

    initializer "adminsimple.controllers" do
      ActiveSupport.on_load :action_controller do
        ActionController::Base.send :include, Pjax
      end
    end

    initializer "adminsimple.view_helpers" do
      ActiveSupport.on_load :action_view do
        ActionView::Base.send :include, Adminsimple::ViewHelpers
        ActionView::Base.send :include, Adminsimple::Modules::WidgetBoxHelpers
      end
    end

  end
end
