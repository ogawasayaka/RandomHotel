module.exports = {
  content: [
    './app/views/**/*.html.erb',
    './app/helpers/**/*.rb',
    './app/assets/stylesheets/**/*.css',
    './app/javascript/**/*.js'
  ],
	plugins: [require("daisyui")],
  
  daisyui: {
    themes: [
      {
        mytheme: {
              "primary": "#fef3c7",
              "secondary": "#facc15",
              "accent": "#84cc16",
              "neutral": "#fde047",
              "base-100": "#ecfccb",
              "info": "#d9f99d",
              "success": "#e0f2fe",
              "warning": "#f59e0b",
              "error": "#a8a29e",
        },
      },
    ],
  },
}
