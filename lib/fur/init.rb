require_relative 'stachable'
require_relative 'file_overwritable'

module Fur
  class Init
    include FileOverwritable
    include Stachable

    README_MESSAGE = 'TODO: write some things in this file that describe your project.'

    def run
      if Dir.exists? '.fur'
        puts 'Repository already initialized.'
      else
        create_readme
        create_fur_dir
        create_stache_dir
        create_diffs_dir
        create_initial_pointer
        copy_working_dir_to_stache
      
        puts 'Repository initialized in .fur.'
      end
    end

    def create_readme
      return if File.exists?('README.md')
      overwrite_on_file README_MESSAGE, 'README.md'
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
      overwrite_on_file '0', '.fur/pointer'
    end

    private

    def mkdir dir
      Dir.mkdir dir
    end
  end
end
