module SpreeSunspotSearch
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path('../../../templates/', __FILE__)

      def add_javascripts
        default_js = 'app/assets/javascripts/store/all.js'
        if File.exist?(default_js)
          append_file default_js, "//= require store/solr_sort_by\n"
        else
          puts "#{default_js} does not exist, skipping"
        end
      end

      def copy_initializer_file
        copy_file 'spree_sunspot_search.rb', "config/initializers/spree_sunspot_search.rb"
      end
    end
  end
end
