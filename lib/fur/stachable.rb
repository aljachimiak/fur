module Fur
  module Stachable
    def copy_working_dir_to_stache
      `cp -R ./* .fur/stache`
    end

    def remove_stache
      `rm -r .fur/stache/*`
    end
  end
end
