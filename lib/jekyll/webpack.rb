# frozen_string_literal: true

require "jekyll/webpack/version"
require "jekyll"

module Jekyll
  module Webpack
    class Error < StandardError; end
    # Your code goes here...

    def build(site)
      binding.pry
    end
  end
end

Jekyll::Hooks.register :site, :post_write do |site|
  Jekyll::Webpack.build(site) #if Jekyll::Webpack.buildable?(site)
end
