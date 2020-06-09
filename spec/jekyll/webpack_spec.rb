# frozen_string_literal: true

RSpec.describe Jekyll::Webpack do
  Jekyll.logger.log_level = :error

  let(:config_overrides) { {} }
  let(:configs) do
    Jekyll.configuration(
      config_overrides.merge(
        "skip_config_files" => false,
        "collections"       => { "docs" => { "output" => true } },
        "source"            => fixtures_dir,
        "destination"       => fixtures_dir("_site")
      )
    )
  end
  let(:webpacker)    { described_class }
  let(:site)        { Jekyll::Site.new(configs) }
  let(:posts)        { site.posts.docs.sort.reverse }

  before(:each) do
    site.reset
    site.read
    (site.pages | posts | site.docs_to_write).each { |p| p.content.strip! }
    site.render
    site.write
  end

  it "has a version number" do
    expect(Jekyll::Webpack::VERSION).not_to be nil
  end

  it "does something useful" do
    expect(false).to eq(true)
  end
end
