document_infos = [
  {file_name: "KB_003.pdf", size: 3_028, page_count: 2},
  {file_name: "KB_013.pdf", size: 13_264, page_count: 1},
  {file_name: "KB_055.pdf", size: 54_836, page_count: 10},
  {file_name: "KB_150.pdf", size: 142_786, page_count: 4},
  {file_name: "KB_500.pdf", size: 469_513, page_count: 5},
  {file_name: "MB_001.pdf", size: 1_042_157, page_count: 30},
  {file_name: "MB_005.pdf", size: 4_766_573, page_count: 90},
  {file_name: "MB_015.pdf", size: 14_989_472, page_count: 124},
  {file_name: "MB_032.pdf", size: 31_591_292, page_count: 18}
]

20.times do
  index = rand document_infos.length
  document = File.open(Rails.root.join "db/pdfs/#{document_infos[index][:file_name]}")
  size = document_infos[index][:size]
  page_count = document_infos[index][:page_count]
  preview_pages = (1..page_count).to_a.sample(3).sort.join(",")

  Lesson.create name: FFaker::Lorem.phrase,
    description: FFaker::Lorem.phrases.join(" "),
    document: document, size: size, page_count: page_count, preview_pages: preview_pages
end
