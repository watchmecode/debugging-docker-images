module.exports = function(grunt){

  grunt.initConfig({
    jshint: {
      options: {
        jshintrc: ".jshintrc"
      },
      app: ["web/**/*.js"]
    },

    jasmine_nodejs: {
      options: {
        specNameSuffix: "specs.js"
      },

      app: {
         specs: ["specs/**"]
      }
    },

    watch: {
      app: {
        files: ["web/**/*.js"],
        tasks: ["specs"]
      },

      views: {
        files: ["web/views/**/*.jade"],
        options: {
          livereload: true
        }
      },

      specs: {
        files: ["specs/**/*.js"],
        tasks: ["specs"]
      },
    }
  });

  grunt.loadNpmTasks("grunt-contrib-jshint");
  grunt.loadNpmTasks("grunt-contrib-watch");
  grunt.loadNpmTasks("grunt-jasmine-nodejs");

  grunt.registerTask("specs", ["jshint", "jasmine_nodejs"]);
  grunt.registerTask("default", ["watch"]);
};
