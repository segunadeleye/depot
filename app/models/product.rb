class Product < ActiveRecord::Base
  has_many :line_items
  has_many :orders, through: :line_items
  before_destroy :ensure_not_referenced_by_any_line_item

  private

    # ensure that there are no line items referencing this product
    def ensure_not_referenced_by_any_line_item
      if line_items.empty?
        return true
      else
        errors.add(:base, 'Line Items present')
        return false
      end
    end

  validates :title, :description, :image_url, presence: true
  validates :price, numericality: {greater_than_or_equal_to: 0.01}
  validates :title, uniqueness: true

  #note: allow blank prevents multiple error in case image_url field is blank.
  validates :image_url, allow_blank: true, format: {
    with:    %r{\.(gif|jpg|png)\Z}i,
    message: 'must be a URL for .gif, .png or .jpg image.'
  }
  validates :title, length: { minimum: 10 }

  # Get's the most recently updated product which will be the only product updated on the view [store/index.html.erb]
  def self.latest
    Product.order(:updated_at).last
  end
end
