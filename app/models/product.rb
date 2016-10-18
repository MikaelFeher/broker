class Product < ApplicationRecord

	belongs_to :category
	
	# CITIES = ['Skurup', 'Beddingestrand']
	# scope :skurup, -> {where(city: 'Skurup')}
	# scope :beddingestrand, ->{where(city: 'Beddingestrand')}
end
