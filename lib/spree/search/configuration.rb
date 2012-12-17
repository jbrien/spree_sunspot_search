module Spree
  module Search
    class Configuration
      attr_accessor :price_ranges,
                    :option_facets,
                    :property_facets,
                    :other_facets,
                    :show_facets,
                    :fields,
                    :sort_fields,
                    :default_sort_key,
                    :default_sort_order,
                    :facet_display_limit

      def initialize
        # Price ranges to be used for faceting
        #   gets turned into a Range object for searching (MUST specify with a dash!!!)
        self.price_ranges = ["0-25", "25-50", "50-100", "100-150"]

        # Product Options for use with Faceting
        #   gets turned to #{value}_option for the facet
        self.option_facets = [:color, :size]

        # Product Properties for use with Faceting
        #   gets turned to #{value}_property for the facet
        # product properties retrieved using the new Spree::Product#property
        self.property_facets = [:brand]

        self.fields = [
          # boost gives the product title a bit of a priority
          { :type => :text, :name => :name, :opts => { :boost => 2.0 } },
          :description,
          { :type => :float, :name => :price }
        ]

        # custom facets defined as methods directly on Spree::Product
        self.other_facets = []

        # facets that have already been created and should be displayed
        # in the suggestions partial
        self.show_facets = []

        self.facet_display_limit = 1

        self.sort_fields = {
          :score => :desc,
          :price => [:asc, :desc],
        }

        self.default_sort_key = :score
        self.default_sort_order = :desc
      end

      def display_facets
        property_facets + option_facets + other_facets + show_facets
      end

    end

    class << self
      attr_accessor :configuration
    end

    def self.configure
      self.configuration ||= Spree::Search::Configuration.new
      yield configuration
    end
  end
end

# TODO move this to a more appropriate / intention revealing location
Spree::Search.configuration {}

