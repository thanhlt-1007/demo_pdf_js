class Lesson < ApplicationRecord
  mount_uploader :document, DocumentUploader

  validates :name, :description, :document,
    :size, :page_count, :preview_pages, presence: true

  scope :newest, -> {order created_at: :desc, id: :desc}
end
