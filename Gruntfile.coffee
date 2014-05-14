module.exports = (grunt) ->

  # Load grunt tasks automatically
  require("load-grunt-tasks") grunt

  # Time how long tasks take. Can help when optimizing build times
  require("time-grunt") grunt

  grunt.initConfig
    # .env
    env:
      dev:
        src: "./bin/.env"

    express:
      options: {}
      web:
        options:
          script: "./bin/www"
          port: process.env.PORT

    # running `grunt coffee` will compile once
    coffee:
      dist:
        files: [
          expand: true
          flatten: false
          cwd: "./src"
          src: ["{,*/}*.coffee"]
          dest: "./"
          ext: ".js"
        ]

    # running `grunt jade` will compile once (not sure why u would tho)
    jade:
      html:
        options:
          pretty: true
          client: false
        files:
          "./": ["./views/{,*/}*.jade"]

    # running `grunt less` will compile once
    less:
      development:
        options:
          paths: ["./styles"]
          yuicompress: true

        files:
          "./public/stylesheets/style.css": "./src/stylesheets/{,*/}*.less"


    clean: [
      "./public/stylesheets/{,*/}*.css"
      "./public/javascripts/{,*/}*.js"
    ]

    open:
      dev:
        path: "http://127.0.0.1:" + process.env.PORT
        app: "Google Chrome"

    watch:
      frontend:
        options:
          livereload: true
        files: [
          "./public/stylesheets/{,*/}*.css"
          "./views/{,*/}*.jade"
          "./public/javascripts/{,*/}*.js"
          "./public/images/{,*/}*.{png,jpg,jpeg,gif,webp,svg}"
          "./Gruntfile.*"
        ]

      less:
        files: "./src/stylesheets/{,*/}*.less"
        tasks: ["less"]

      coffee:
        files: "./src/{,*/}*.coffee"
        tasks: ["coffee:dist"]

      web:
        files: [
          "{,*/}*.js"
          "test/**/*.js"
        ]
        tasks: ["express:web"]
        options:
          nospawn: true #Without this option specified express won"t be reloaded
          atBegin: true

    parallel:
      web:
        options:
          stream: true

        tasks: [
          {
            grunt: true
            args: ["clean"]
          }
          {
            grunt: true
            args: ["watch:frontend"]
          }
          {
            grunt: true
            args: ["watch:coffee"]
          }
          {
            grunt: true
            args: ["watch:less"]
          }
          {
            grunt: true
            args: ["watch:web"]
          }
          {
            grunt: true
            args: ["open:dev"]
          }
          {
            grunt: true
            args: ["open:dev"]
          }
        ]

  grunt.registerTask "web", "launch webserver and watch tasks", [
    "env:dev"
    "parallel:web"
    ]

  grunt.registerTask "default", ["web"]
