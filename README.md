<h1 align="center">
ByteMyBriefs's Neovim Config
</h1>

<!-- TODO: -->
<p align="center">
  <img alt="meme" src="https://filiphalas.com/static/img/posts/vscode-meme.jpeg" />
</p>

You should probably just use VSCode like your coworkers who have personal lives.

Nevertheless, here's an nvim config if you must suffer.

> Note: This config extends NvChad. NvChad comes with pre-configured LSP
> support, Treesitter, and nvim-cmp. Nevertheless, these can be fully customized
> to your liking in './chadrc'. Please refer to the
> [NvChad documentation](https://nvchad.com/) for more information.

## 🛠️ Installation / Setup

### 🕓 Estimated Setup Time: 15 minutes

1. **Neovim**: First, install Neovim. Installation instructions for all
   platforms can be found
   [here](https://github.com/neovim/neovim/wiki/Installing-Neovim).

2. **NvChad**: Next, set up NvChad per their
   [instructions](https://nvchad.com/docs/quickstart/install).

   > **Note**: NvChad reccomends having a Nerd font installed (as do I).
   > Installation is easy. A helpful tutorial can be found
   > [here](https://www.geekbits.io/how-to-install-nerd-fonts-on-mac/). A list
   > of popular nerd fonts can be found at
   > [NerdFonts.com](https://www.nerdfonts.com/).

3. **Clone this Repository**: Once NvChad is installed, delete the
   `./lua/custom` directory.
   - Next, simply clone this repository into that folder like so:
   ```
   npx degit https://github.com/ByteMyBriefs/nvim-config lua/custom
   ```
   - Run `nvim` in your current directory to open Neovim. Lazy.nvim (your new
     plugin manager) will automatically begin installing all plugins, LSP
     servers, etc.

You should now be good to go ☺️.

**(Optional) Configure AI Plugins**: Lastly, for those of you that want to take
advantage, we need to quickly set up your AI tooling.

- **Copilot.lua && cmp-copilot**: Enter the command `"Copilot auth` and login to
  your Github account. If you have any issues, please see their full
  documentation [here](https://github.com/zbirenbaum/copilot.lua).

> **Note**: An active Copilot account is required.

- **ChatGPT.nvim && NeoAI**: Set an environment variable named `$OPENAI_API_KEY`
  with your OpenAI API key (which you can obtain
  [here](https://platform.openai.com/account/api-keys)). Configuration settings
  for ChatGPT.nvim and neoai.nvim can be found
  [here](https://github.com/jackMort/ChatGPT.nvim) and
  [here](https://github.com/Bryley/neoai.nvim) respectively.

> **Note**: An active OpenAI API Key is required, but a free key will likely
> last you a very long time by itself.

## Primary Features

In addition to the theming and UI provided by NvChad, this configuration also
offers:

### Out-of-the-Box Support for Major Modern Languages

- **Python**: LSP, flake8
- **Javascript / Typescript**: LSPs, Eslint server, Prettier server
- **Rust**: Rust-tools by [simrat39](https://github.com/simrat39) (includes
  Rust-Analyzer and full debugging support) and Rustfmt
- **Go**: LSP, Gofmt, Goimports

As well as full IDE support for two web frameworks:

- Svelte (goat 🐐), and
- React.

### Custom UI/UX

- **[NvChad](https://github.com/NvChad/NvChad)**

- **[Noice](https://github.com/folke/noice.nvim)** by folke

- **[LspLines](https://git.sr.ht/~whynothugo/lsp_lines.nvim)** by whynothugo

- (Extra) **[Neovide](https://neovide.dev/) Support**

### Enhanced Motion

- **[Leap](https://github.com/ggandor/leap.nvim)** by ggandor

- **[NeoScroll](https://github.com/karb94/neoscroll.nvim)** by karb94

### Basic AI Integrations

- **[Copilot.lua](https://github.com/zbirenbaum/copilot.lua)** by zbirenbaum

- **[Cmp-copilot](https://github.com/zbirenbaum/copilot-cmp)** by zbirenbaum

- **[ChatGpt](https://github.com/jackMort/ChatGPT.nvim)** by jackMort

- **[NeoAI](https://github.com/Bryley/neoai.nvim)** by Bryley

## Support

Neovim can be annoying. If you have issues, email me at
[austinsmith766@gmail.com](mailto:austinsmith766@gmail.com).

## 🎪 Showcase

![Splash Screen](https://github.com/ByteMyBriefs/nvim-config/blob/main/.github/screenshots/splash.png?raw=true)

![Default View of Editor](https://github.com/ByteMyBriefs/nvim-config/blob/main/.github/screenshots/buf.png?raw=true)

![Noice Cmdline - Dracula](https://github.com/ByteMyBriefs/nvim-config/blob/main/.github/screenshots/cmd_dracula.png?raw=true)

![Split Buffers](https://github.com/ByteMyBriefs/nvim-config/blob/main/.github/screenshots/splitbufs.png?raw=true)

![Keymap](https://github.com/ByteMyBriefs/nvim-config/blob/main/.github/screenshots/keymap.png?raw=true)
