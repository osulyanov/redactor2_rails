module Redactor2Rails
  class Engine < Rails::Engine
    isolate_namespace Redactor2Rails

    initializer 'redactor2_devise' do |app|
      ActionController::Base.send :include, Redactor2Rails::Devise
    end
  end
end
