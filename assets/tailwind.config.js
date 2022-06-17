// See the Tailwind configuration guide for advanced usage
// https://tailwindcss.com/docs/configuration
module.exports = {
  daisyui: {
    themes: [
      {
        mytheme: {
          "primary": "#038223",
          "secondary": "#1fd192",
          "accent": "#c9e6ff",
          "neutral": "#16141F",
          "base-100": "#F9FAFA",
          "info": "#5FCEF7",
          "success": "#27BE89",
          "warning": "#C36909",
          "error": "#EE4F51",
        },
      },
    ],
  },
  content: [
    './js/**/*.js',
    '../lib/*_web.ex',
    '../lib/*_web/**/*.*ex'
  ],
  theme: {
    extend: {},
  },
  plugins: [
    require('@tailwindcss/forms'),
    require("daisyui")
  ]
}
