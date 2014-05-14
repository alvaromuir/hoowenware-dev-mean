# Lodgings model

module.exports =
  model:
    lodging_type: String
    name: String
    link: String
    contact: String
    checkin_datetime: Date
    checkout_datetime: Date
    address: String
    star_rating: Number
    reviews_link: String
    notes: String
    
  methods: {}
  validators: {}
  virtuals: {}
  hooks:
    pre: {}
    post: {}
