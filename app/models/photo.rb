# == Schema Information
#
# Table name: photos
#
#  id             :integer          not null, primary key
#  caption        :text
#  comments_count :integer
#  image          :string
#  likes_count    :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  owner_id       :integer
#

class Photo < ApplicationRecord
  validates :owner_id, presence: true

  # Direct Associations
  belongs_to :poster, class_name: "User", foreign_key: "owner_id", inverse_of: :own_photos
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  # Ensure `comments_count` and `likes_count` automatically update
  has_many :comments, dependent: :destroy, counter_cache: true
  has_many :likes, dependent: :destroy, counter_cache: true

  # Indirect Associations
  has_many :fans, through: :likes, source: :fan
end
