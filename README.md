# Imperavi Redactor for Rails 3.x - 4 Asset Pipeline 

redactor2_rails integrates Imperavi Redactor for Rails Asset Pipeline (Rails 4, 3.x versions are supported)

[![Gem Version](https://badge.fury.io/rb/redactor2_rails.svg)](https://badge.fury.io/rb/redactor2_rails)

In order to use this gem, you must purchase a license from Imperavi 
(https://imperavi.com/redactor/buy), download Redactor II files from them, 
and place redactor.js file in the following location:

    `app/assets/javascripts/`
    
And redactor.css file in the following location:

    `app/assets/stylesheets/`

## Installation

Add this line to your application's Gemfile:

    gem 'redactor2_rails'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install redactor2_rails

### Generate models for store uploading files

#### ActiveRecord + carrierwave
Add this lines to your application's Gemfile:

    gem "carrierwave"
    gem "mini_magick"

And then execute:
    
    $ rails generate redactor2:install

or

    $ rails generate redactor2:install --devise

    # --devise option generate user_id attribute for asset(Imeg, File) models. 
    # For more details show Devise gem.
    # Now, Pictures and Documents uploading available only for signed in users
    # All uploaded files will stored with current user_id
    # User will choose only own uploaded Images and Files

    $ rake db:migrate

#### Mongoid + carrierwave
Add this lines to your application's Gemfile:

    gem "carrierwave"
    gem "carrierwave-mongoid", :require => "carrierwave/mongoid"
    gem "mini_magick"

    $ rails generate redactor2:install

### Include the Redactor assets

Add to your `application.js`:

      //= require redactor2_rails
      //= require redactor

Add to your `application.css`:

      *= require redactor

### Initialize Redactor

For each textarea that you want to use with Redactor, 
add the "redactor" class and ensure it has a unique ID:

    <%= text_area_tag :editor, "", :class => "redactor", :rows => 40, :cols => 120 %>
    
You need to put your textarea inside the form with `authenticity_token` field.

### Custom Your redactor

If you need change some config in redactor, you can

    $ rails generate redactor2:config

Then generate `app/assets/javascripts/redactor2_rails/config.js`.

See the [Redactor Documentation](http://imperavi.com/redactor/docs/settings/) for a full list of configuration options.


If You Want To setup a new language in Redactor you should do three things:

In you file `app/assets/javascripts/redactor2_rails/config.js` set option

    "lang":'ru'

Place lang files in the following location:
   
    `app/assets/javascripts/langs/`

and

Add to your `application.js`:

    //= require langs/ru

#### Setting a max image size with carrierwave

If you want to set a maximum image size used when a user uploads an image via carrierwave, open the uploader file and add add the following:

    # app/uploaders/redactor2_rails_picture_uploader.rb:33

    process :resize_to_limit => [500, -1]

The above example will set the image to have a maximum width of 500px.

### Using plugins

After including the desired plugins they can be configured in the redactor config file as normal.

To add it into the editor add 'plugins' attributes to config.js file and specify which ones do you want to use:

      $('.redactor').redactor(
        { "plugins": ['fullscreen',
                    'textdirection',
                    'clips']
        });
        
Full details of these can be found at [Redactor Plugins](http://imperavi.com/redactor/plugins/)

### Defining a Devise User Model

By default redactor2_rails uses the `User` model.

You may use a different model by:

1. Run a migration to update the user_id column in the
2. Overriding the user class in an initializer.
3. Overriding the authentication helpers in your controller.

Create a new Migration: `rails g rename_user_id_to_new_user_id`

    # db/migrate/...rename_user_id_to_new_user_id.rb

    class RenameUserIdToNewUserId < ActiveRecord::Migration
      def up
        rename_column :redactor2_assets, :user_id, :admin_user_id
      end

      def down
        rename_column :redactor2_assets, :admin_user_id, :user_id
      end
    end

    # config/initializers/redactor2.rb
    # Overrides the user class

    module RedactorRails
      def self.devise_user
        %s(admin_user) # name of your user class
      end

      # You may override this to support legacy schema.
      # def self.devise_user_key
      #   "#{self.devise_user.to_s}_id".to_sym
      # end
    end

    # app/controllers/application_controller.rb

    class ApplicationController < ActionController::Base
      ...

      def redactor2_authenticate_user!
        authenticate_admin_user! # devise before_filter
      end

      def redactor2_current_user
        current_admin_user # devise user helper
      end
    end

## Statement

`redactor2_rails` base on [SammyLin/redactor-rails](https://github.com/SammyLin/redactor-rails) project.


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

You may use `Redactor` for non-commercial websites for free, however, we do not guarantee any technical support.

Redactor has [3 different licenses](http://imperavi.com/redactor/download/) for commercial use.
For details please see [License Agreement](http://imperavi.com/redactor/license/).
