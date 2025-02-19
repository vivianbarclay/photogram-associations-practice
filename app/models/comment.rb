# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  body       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  author_id  :integer
#  photo_id   :integer
#

class Comment < ApplicationRecord
  validates :body, presence: true
  validates :author_id, presence: true

  # Direct Associations
  belongs_to :photo, inverse_of: :comments, required: true
  belongs_to :commenter, class_name: "User", foreign_key: "author_id"
end
