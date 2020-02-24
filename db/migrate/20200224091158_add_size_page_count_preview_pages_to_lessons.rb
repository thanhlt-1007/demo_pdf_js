class AddSizePageCountPreviewPagesToLessons < ActiveRecord::Migration[5.2]
  def change
    add_column :lessons, :size, :integer
    add_column :lessons, :page_count, :integer
    add_column :lessons, :preview_pages, :string
  end
end
