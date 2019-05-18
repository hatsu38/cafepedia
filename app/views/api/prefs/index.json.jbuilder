# frozen_string_literal: true

json.set! :prefs do
  json.array! @prefs do |pref|
    json.extract! pref,
      :id,
      :name
  end
end
