require("pretty-fold").setup({
  config = {
    sections = {
      left = { 'content' },
      right = { ' ', 'number_of_folded_lines', ': ', 'precentage', ' ', function(config)
        return config.fill_char:rep(3)
      end }
    },

    fill_char = '-'
  }
})
