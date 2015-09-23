# == Schema Information
#
# Table name: items
#
#  id         :integer          not null, primary key
#  title      :string
#  body       :text
#  list_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Item < ActiveRecord::Base

  belongs_to :list
  belongs_to :user

  validates :title, presence: true
end
