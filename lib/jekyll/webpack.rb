# frozen_string_literal: true

require "jekyll/webpack/version"
require "jekyll"
require "open3"

module Jekyll
  module Webpack
    class Error < StandardError; end

    def self.build(site)
      site_dest = site.dest

      stdout, stderr, status = Open3.capture3(
        "../node_modules/.bin/webpack",
        chdir: File.expand_path(site_dest)
      )

      runtime_error = stdout =~ /ERROR in|SyntaxError/

      raise Error, stderr if stderr.size > 0
      raise Error, stdout if !runtime_error.nil?

      cleanup(site)
    end

    def self.cleanup(site)
      cleanup_files = site.config.dig('webpack', 'cleanup_files')

      if cleanup_files
        if Array === cleanup_files
          cleanup_files.each do |dest_for_clean|
            if Dir.exists?(File.expand_path(dest_for_clean, site.dest))
              FileUtils.rm_rf(File.expand_path(dest_for_clean, site.dest))
            end
          end
        else
          if Dir.exists?(File.expand_path(cleanup_files, site.dest))
            FileUtils.rm_rf(File.expand_path(dest_src_for_clean, site.dest))
          end
        end
      end
    end
  end
end

Jekyll::Hooks.register :site, :post_write do |site|
  Jekyll::Webpack.build(site)
end
