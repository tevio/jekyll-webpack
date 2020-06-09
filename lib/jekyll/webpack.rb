# frozen_string_literal: true

require "jekyll/webpack/version"
require "jekyll"

module Jekyll
  module Webpack
    class Error < StandardError; end

    def self.build(site)
      site_dest = site.dest
      Dir.chdir(site_dest) do
        `../node_modules/.bin/webpack`
      end
    end
  end
end

Jekyll::Hooks.register :site, :post_write do |site|
  Jekyll::Webpack.build(site)
end
