return {
  {
    "ahmedkhalf/project.nvim",
    opts = {
      patterns = {
          ".git", "package.json", ".terraform", "go.mod", "requirements.yml"
      },
      -- detection_methods = { "lsp", "pattern" },
      detection_methods = {"pattern"}
    }
  }
}
