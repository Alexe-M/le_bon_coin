class Article < ApplicationRecord
belongs_to :vendor, class_name: "User", foreign_key: 'vendor_id'
has_one :order
has_many :buyers, through: :orders, source: :user

validate :article_not_sold, on: :create

def article_not_sold
  if sold? 
    errors.add(:base, "cet article n'est plus disponible")
  end
end

end
