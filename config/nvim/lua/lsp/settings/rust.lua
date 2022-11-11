return {
  settings = {
    ["rust-analyzer"] = {
      lens = {
        enable = true,
      },
      checkOnSave = {
        command = "clippy",
      },
    },
  },
}
