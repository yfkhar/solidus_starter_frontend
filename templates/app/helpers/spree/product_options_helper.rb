# frozen_string_literal: true

module Spree
  module ProductOptionsHelper
    def product_variants_with_options
      @product.variants_and_option_values_for(current_pricing_options)
    end

    def sorted_option_values(variant)
      variant.option_values.sort_by { |value| value.option_type.position }.map(&:id)
    end

    def sorted_option_types(product)
      product.option_types.sort_by(&:position)
    end

    # move to model
    def option_values(option_type)
      @product.variants.map do |variant|
        variant.option_values.find { |option_value| option_value.option_type_id == option_type.id }
      end.compact.uniq
    end
  end
end
