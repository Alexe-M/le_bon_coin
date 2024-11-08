class Order < ApplicationRecord
  belongs_to :user
  belongs_to :article

  after_create :mark_article_as_sold

  private

  def mark_article_as_sold
    article.update(sold: true)  # L'article devient vendu après une commande
  end

end
