class Cliff < ActiveRecord::Base

    validates :name, presence: true, length: { minimum: 3, maximum: 25 }
    validates_uniqueness_of :name
    has_many :route_cliffs
    has_many :routes, through: :route_cliffs
end