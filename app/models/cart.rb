class Cart < ActiveRecord::Base
  # attr_accessible :title, :body
  has_many :line_items, dependent: :destroy # при удалении корзины удаляются и товары в ней
end
