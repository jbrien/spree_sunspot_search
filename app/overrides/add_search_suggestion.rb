# unfortunately it doesn't look like sunspot has spell check support yet
#   https://github.com/sunspot/sunspot/pull/43
#   https://github.com/climbingrose/sunspot/commit/7c92c536d6eb500b10dcc7d6fa33870429bdbc82

# Deface::Override.new(:virtual_path => "spree/products/index",
#                       :name => "show_search_partials_suggestion",
#                       :insert_top => "[data-hook='search_results']",
#                       :partial => "spree/products/suggestion",
#                       :disabled => false)
