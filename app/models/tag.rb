class Tag < ApplicationRecord
  belongs_to :project, optional: true, touch: true
  belongs_to :category, touch: true

  validates :category, uniqueness: { scope: :project }

  def category_name
    category && category.name
  end

  def category_name=(category_name)
    self.category = Category.find_or_create_by(name: category_name.downcase) unless category_name.blank?
  end
end
