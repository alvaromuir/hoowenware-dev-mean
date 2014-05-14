module.exports = (grunt) ->
  grunt.initConfig
    express:
      options: {}
      web:
        options:
          script: "./bin/www"
          port: 3000

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
          "./": ['./views/{,*/}*.jade']

    # running `grunt less` will compile once
    less:
      development:
        options:
          paths: ["./styles"]
          yuicompress: true

        files:
          "./public/stylesheets/main.css": "./src/styles/{,*/}*.less"

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
        files: "./src/styles/{,*/}*.less"
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
          nospawn: true #Without this option specified express won't be reloaded
          atBegin: true

    parallel:
      web:
        options:
          stream: true

        tasks: [
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
        ]


  # Load grunt tasks automatically
  require("load-grunt-tasks") grunt

  # Time how long tasks take. Can help when optimizing build times
  require("time-grunt") grunt

  grunt.registerTask "web", "launch webserver and watch tasks", [
    "parallel:web"
    "open:server"
    ]

  grunt.registerTask "default", ["web"]
