module.exports = {
  plugins: [
    require("daisyui"),
    require("@tailwindcss/typography")
  ],
  content: [
    './app/views/**/*.html.erb',
    './app/helpers/**/*.rb',
    './app/assets/stylesheets/**/*.css',
    './app/javascript/**/*.js'
  ]
}
