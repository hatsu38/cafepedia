json.set! :stores do
  json.array! @stores do |store|
    json.extract! store,
      :id,
      :name,
      :prefecture,
      :city,
      :town,
      :tyo,
      :ban,
      :go,
      :access,
      :tel,
      :weekday_start,
      :weekday_finish,
      :saturday_start,
      :saturday_finish,
      :sunday_start,
      :sunday_finish,
      :hp,
      :wifi,
      :socket,
      :smoking,
      :mainstore_id,
      :mainstore,
      :created_at,
      :updated_at
  end
end
