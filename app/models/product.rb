class Product < ActiveRecord::Base
  attr_accessible :description, :image_url, :price, :title, :photo, :id_category
  
  has_many :line_items
  
  before_destroy :ensure_not_referenced_by_any_line_item
  
  validates :title, :description, presence: true

  validates :price, numericality: {greater_than_or_equal_to: 0.01 }
  
  validates :title, uniqueness: true
  
  
   has_attached_file :photo, :styles => { :thumb  => "200x200>", :middle  => "400x400>"  },
                  :url  => "/assets/competitions/:id/:style/:basename.:extension",
                  :path => ":rails_root/public/assets/competitions/:id/:style/:basename.:extension"

  
  validates_attachment_size :photo, :less_than => 5.megabytes
  validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png', 'image/gif', 'image/jpg' ]


  private
  
  def ensure_not_referenced_by_any_line_item
    if line_items.empty?
      return true
      
    else 
      
      return false
    end
  end
end
