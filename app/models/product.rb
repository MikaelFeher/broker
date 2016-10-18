class Product < ApplicationRecord
	CITIES = ['Skurup', 'Beddingestrand']
	# scope :skurup, -> {where(city: 'Skurup')}
	# scope :beddingestrand, ->{where(city: 'Beddingestrand')}
end
