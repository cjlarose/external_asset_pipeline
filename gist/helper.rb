# frozen_string_literal: true

module ExternalAssetPipeline
  class AssetNotFound < StandardError; end

  module Helper
    # Overrides the built-in
    # `ActionView::Helpers::AssetUrlHelper#compute_asset_path` to use the
    # external asset pipeline, in the same manner that sprockets-rails does:
    # https://github.com/rails/sprockets-rails/blob/v3.2.1/lib/sprockets/rails/helper.rb#L74-L96
    def compute_asset_path(source, _options = {})
      value_in_asset_manifest = ExternalAssetPipeline.manifest.find(source)

      return value_in_asset_manifest if value_in_asset_manifest

      raise AssetNotFound,
            "The asset #{source.inspect} is not present in the asset manifest"
    end
  end
end
