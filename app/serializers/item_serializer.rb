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

class ItemSerializer < ActiveModel::Serializer
  attributes :id, :title, :body, :created_at, :list_id

  def title
    object.title
  end

  def body
    object.body
  end

  def created_at
    object.created_at.strftime('%B %d, %Y')
  end
end
