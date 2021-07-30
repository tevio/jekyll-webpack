# frozen_string_literal: true

require 'tmpdir'
require 'listen'

module Jekyll
  module Webpack
    class Debouncer
      attr_reader :site, :dist_path, :config, :run_once, :has_run, :run_every_n, :watch_nodes, :listener

      def initialize(site, debounce_config)
        @config = debounce_config
        @run_once = debounce_config.dig('run_once')
        @run_every_n = debounce_config.dig('every')
        @watch_nodes = debounce_config.dig('watch')

        if @watch_nodes
          if Array === @watch_nodes
            watch_paths = @watch_nodes.map { |file| File.join(site.source, file) }
          else
            watch_paths = [@watch_nodes]
          end

          @listener = Listen.to(*watch_paths) do |modified, added, removed|
            @has_run = false
          end
          @listener.start
        end

        @run_counter = 0
        @has_run = false
        @site = site
        @dist_tmpdir = Dir.mktmpdir("jekyll_webpack_dist_#{File.split(site.dest).last}")
        @dist_path = File.expand_path('dist', site.dest)
      end

      def build
        if run_once || watch_nodes
          if has_run
            restore_dist
          else
            yield
            extract_dist
          end
        elsif run_every_n
          if !has_run
            yield
            @run_counter += 1
            extract_dist
          elsif run_every_n == @run_counter
            yield
            @run_counter = 0
            extract_dist
          else
            restore_dist
            @run_counter += 1
          end
        end

        @has_run = true
      end

      def extract_dist
        FileUtils.cp_r(dist_path, @dist_tmpdir)
      end

      def restore_dist
        FileUtils.cp_r(File.join(@dist_tmpdir, 'dist'), File.join(site.dest, 'dist'))
      end
    end
  end
end
