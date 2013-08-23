module Fur
  class Init
    def run
      if Dir.exists? '.fur'
        puts 'Repository already initialized.'
      else
        create_fur_dir
        create_stache_dir
        create_diffs_dir
        create_initial_pointer
        copy_working_dir_to_stache
      
        puts 'Repository initialized in .fur.'
      end
    end

    def create_fur_dir
      mkdir '.fur'
    end

    def create_stache_dir
      mkdir '.fur/stache'
    end

    def create_diffs_dir
      mkdir '.fur/diffs'
    end 

    def create_initial_pointer
      file = File.new '.fur/pointer', 'w+'
      file.write '0'
      file.close
    end

    def copy_working_dir_to_stache
      `cp -R ./* .fur/stache/`
    end

    private

    def mkdir dir
      Dir.mkdir dir
    end
  end
end
