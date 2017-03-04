class ItemResource < JSONAPI::Resource
  immutable
  attributes :name
end
