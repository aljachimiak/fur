module Fur
  module Stachable
    def copy_working_dir_to_stache
      `cp -R ./* .fur/stache/`
    end
  end
end
