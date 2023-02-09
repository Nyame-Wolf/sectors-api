class Industry < ApplicationRecord
  has_many :sub_sectors, class_name: 'Industry', foreign_key: 'sector_id'

  belongs_to :sector, class_name: 'Industry', optional: true
end
