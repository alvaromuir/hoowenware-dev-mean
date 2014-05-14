# Transportations model

module.exports =
  model:
    trip_id: String
    user_id: String
    transporation_type: String
    service_number: String
    seat_number: String
    price: Number
    departure_city: String
    departure_datetime: Date
    arrival_city: String
    arrival_datetime: Date
    is_active: Boolean

  methods: {}
  validators: {}
  virtuals: {}
  hooks:
    pre: {}
    post: {}
