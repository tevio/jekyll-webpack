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

      runtime_error = stdout =~ /error/i

      raise Error, stderr if stderr.size > 0
      raise Error, stdout if !runtime_error.nil?
    end
  end
end

Jekyll::Hooks.register :site, :post_write do |site|
  Jekyll::Webpack.build(site)
end
