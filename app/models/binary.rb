class Binary < ApplicationRecord
  # before_destroy :reset_meta_data_connection
  validates :name, presence: true
  validates :extension, presence: true
  validates :data_url, presence: true

  belongs_to :folder
  has_many :comments
  has_many :likes, as: :likeable

  enum status: %w(active inactive)

  # default_scope { where(status: "active") }
  default_scope { where(status: "active") }
  def url
    folder.url + '/' + name + '.' + extension
  end

  private

  def reset_meta_data_connection
    meta = MetaDataFile.find(self.id)
    meta.update_attributes(binaries_id: nil)
  end
end
