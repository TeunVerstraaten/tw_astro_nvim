return {
  "nomnivore/ollama.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },

  cmd = {
    "Ollama",
    "OllamaModel",
    "OllamaServe",
    "OllamaServeStop",
  },

  keys = {
    {
      "<leader>oo",
      ":<c-u>lua require('ollama').prompt()<cr>",
      mode = { "n", "v" },
      desc = "Ollama prompt",
    },
  },

  opts = {
    model = "llama3",
    url = "http://127.0.0.1:11434",
  },
}
