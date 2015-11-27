module CardItemsHelper
  def selecet_options_with_data_for(cards_items)
    SHIRT_SIZES.each do |size|
      [size, "data-count" => cards_items.where(size: size).try(:count)]
    end
  end
end