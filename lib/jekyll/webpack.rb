# frozen_string_literal: true

require "jekyll/webpack/version"
require "jekyll"
require "open3"

module Jekyll
  module Webpack
    class Error < StandardError; end

    def self.build(site)
      site_dest = site.dest

      only_in = site.config.dig('webpack', 'only_in')
      if only_in
        entries = []
        array_or_scalar(only_in) { |entry| entries << site_dest.end_with?(entry) }
        return unless entries.any? true
      end

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
        array_or_scalar(cleanup_files) do |dest_for_clean|
          path = File.expand_path(dest_for_clean, site.dest)

          if File.exists?(path) || Dir.exists?(path)
            FileUtils.rm_rf(path)
          end
        end
      end
    end

    private

    def self.array_or_scalar(value)
      if Array === value
        value.each do |entry|
          yield entry
        end
      else
        yield value
      end
    end
  end
end

Jekyll::Hooks.register :site, :post_write do |site|
  Jekyll::Webpack.build(site)
end
