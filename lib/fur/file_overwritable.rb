module Fur
  module FileOverwritable
    def overwrite_on_file string, filename
      file = File.new filename, 'w+'
      file.write string
      file.close
    end
  end
end
