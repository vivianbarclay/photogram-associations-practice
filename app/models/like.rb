# == Schema Information
#
# Table name: likes
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  fan_id     :integer
#  photo_id   :integer
#

class Like < ApplicationRecord
  validates :fan_id, presence: true
  validates :photo_id, presence: true, uniqueness: { scope: :fan_id }

  # Direct Associations
  belongs_to :fan, class_name: "User", foreign_key: "fan_id"
  belongs_to :photo, required: true
end
