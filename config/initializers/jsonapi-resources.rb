JSONAPI.configure do |config|
  # :underscored_key, :camelized_key, :dasherized_key, or custom
  # jsで扱い易いようにJSONのkeyをlowerCamelCaseにする。
  config.json_key_format = :camelized_key
  # :none, :offset, :paged, or a custom paginator name
  # pagenationの形式をoffsetに変更
  config.default_paginator = :offset
end
