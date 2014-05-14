# Users model

module.exports =
  model:
        email: String
        name: String
        userName: String
        displayName: String
        status: String
        photoUrl: String
        website: String
        aboutMe: String
        social: {}
        completedBasicProfile:
          type: Boolean
          default: false
        validated:
          type: Boolean
          default: false
        verified:
          type: Boolean
          default: false
        createdOn:
          type: Date
          default: new Date()
        lastUpdated:
          type: Date

  methods: {}
  validators: {}
  virtuals: {}
  hooks:
    pre: {}
    post: {}
