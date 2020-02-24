20.times do
  file_names = ["KB_003.pdf", "KB_013.pdf", "KB_055.pdf", "KB_150.pdf", "KB_500.pdf",
    "MB_001.pdf", "MB_005.pdf", "MB_032.pdf"]

  Lesson.create name: FFaker::Lorem.phrase,
    description: FFaker::Lorem.phrases.join(" "),
    document: File.open(Rails.root.join "db/pdfs/#{file_names.sample}")
end
