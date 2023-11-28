class Component < ApplicationRecord
  belongs_to :bike_component
  has_many :bikes, through: :bike_components
end
