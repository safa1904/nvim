# Safanvim Configuration
<br>
<img width="1800" alt="image" src="https://github.com/safa1904/nvim/assets/100108435/e2b4676d-f812-4eed-976a-b2685add3e98">
<br>

[![safa1904](https://custom-icon-badges.demolab.com/badge/made%20by%20-safa1904-556bf2?logo=github&logoColor=white&labelColor=101827)](https://github.com/safa1904)
[![License](https://img.shields.io/github/license/safa1904/nvim?color=dddddd&labelColor=000000)](https://github.com/safa1904/nvim/blob/main/LICENSE)
[![Top Language](https://img.shields.io/github/languages/top/safa1904/nvim?logo=github&logoColor=%23007ACC&label=lua)](https://www.lualang.org/)
[![Contributors](https://img.shields.io/github/contributors/safa1904/nvim?style=flat&color=orange&label=Contributors)](https://github.com/safa1904/nvim/graphs/contributors)

## 📝 Description

**safanvim** is a well-designed and fully functional IDE that is built with
Lua. This setup is tailored to suit my workflow and preferences. Feel free to explore and use any parts of it that you find interesting.

## 🔧Installation

1. Clone this repository to your local machine:

    ```bash
    git clone: https://github.com/safa1904/nvim.git
    ```
2. Automatic plugin installation (and lazy loading!) via `lazy.vim`

3. Restart Neovim.

## 📋 Key Features
- brightens your login with a friendly welcome.
- elevates your experience with a welcoming dashboard, presenting a variety of options such as creating
  a new file or quickly accessing recent documents, providing
  a user-friendly starting point for your sessions.
- Size aware, dynamically changes UI elements when resized.
-  Automatic LSP integrations via `Mason`, with modular format for adding LSP
  options per server.
- Swiftly execute files with <leader>rr through Coderunner.nvim.
- Expedite DAP setup with mason-nvim-dap.nvim for effortless debugging!
- No need to remember _all_ keybinds, `<leader>` pops up a helpful keybind
  guide, provided by `which-key.nvim`
  <details>
    <summary>Which-Key photo </summary>
  <img width="1795" alt="image" src="https://github.com/safa1904/nvim/assets/100108435/ea5d681c-f546-4cb0-b4a9-0e5cc9df8858">
  </details>

- Integrate [Lazygit](https://github.com/jesseduffield/lazygit)  seamlessly into Neovim for convenient source control management without having to leave the editor.



## 🎨 Custom Key Bindings

I have customized key bindings to streamline my workflow. Some notable ones include:

- `<leader> + w` - Save the current file.
- `<leader> + q` - Quit Neovim.
You can find the complete list of key bindings in the [keymapping.lua](lua/config/keymappings.lua) file.

## ➕ Additional Notes

- This configuration assumes you have Neovim 0.5 or later installed.

- Feel free to customize this configuration to fit your own preferences. The goal is to create a setup that works best for you.

## 👩‍🔧 Issues and Contributions

If you encounter any issues or have suggestions for improvements, please open an issue or create a pull request. Your feedback is highly appreciated!

## 💎Acknowledgements
- [D.Fender](https://github.com/dfendr)
- [chris@machine](https://github.com/ChristianChiarulli)

