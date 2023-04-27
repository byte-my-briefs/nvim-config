<h1 align="center">
ByteMyBriefs's Neovim Config
</h1>

<p align="center">
<a href="https://github.com/ByteMyBriefs/nvim-config/commits/main"><img alt="Last commit" src="https://img.shields.io/github/last-commit/avocadeys/NVCat?colorA=363a4f&colorB=f5e0dc&style=for-the-badge"></a>
<a><img src="https://img.shields.io/github/languages/code-size/ByteMyBriefs/nvim-config?colorA=363a4f&colorB=b4befe&style=for-the-badge"></a>
</p>

This repository contains my current Neovim configuration. I primarily decided to
publish it so that my friends who are interested in Neovim can easily make the
transition from other editors. However, anyone else who is interested can
certainly benefit from it as well.

It is an extension of [NvChad](https://github.com/NvChad/NvChad) and will not
work without it. Though I used to run my own bootstrapped config, NvChad is just
absolutely beautiful, and using it saves a lot of headache when it comes to
configuring our UI.

> Note: NvChad comes with some basic batteries included. Most pertinently,
> NvChad comes with LSP support, Treesitter, and nvim-cmp already
> pre-configured. These, however, can be fully customized to our liking in
> './chadrc'. Please refer to their [documentation](https://nvchad.com/) for
> more information.

## 🎪 Showcase

![Splash Screen](https://github.com/ByteMyBriefs/nvim-config/blob/main/.github/screenshots/splash.png?raw=true)

![Default View of Editor](https://github.com/ByteMyBriefs/nvim-config/blob/main/.github/screenshots/buf.png?raw=true)

![Noice Cmdline - Dracula](https://github.com/ByteMyBriefs/nvim-config/blob/main/.github/screenshots/cmd_dracula.png?raw=true)

![Split Buffers](https://github.com/ByteMyBriefs/nvim-config/blob/main/.github/screenshots/splitbufs.png?raw=true)

![Keymap](https://github.com/ByteMyBriefs/nvim-config/blob/main/.github/screenshots/keymap.png?raw=true)

## 🛠️ Installation / Setup

### 🕓 Estimated Setup Time: 15 minutes

1. **Neovim**: First, install Neovim. Installation instructions for all
   platforms can be found
   [here](https://github.com/neovim/neovim/wiki/Installing-Neovim).

2. **NvChad**: Next, set up NvChad per their
   [instructions](https://nvchad.com/docs/quickstart/install).

   > **Note**: They reccomend having a Nerd font installed (and I do as well).
   > Installation is easy and a great tutorial can be found
   > [here](https://www.geekbits.io/how-to-install-nerd-fonts-on-mac/).
   > Additionally, please see [NerdFonts.com](https://www.nerdfonts.com/) for a
   > fantastic collection of the most popular nerd fonts.

3. **Clone this Repository**: Once NvChad is installed, delete the
   `./lua/custom` directory.
   - Next, simply clone this repository into that folder like so:
   ```
   npx degit https://github.com/ByteMyBriefs/nvim-config lua/custom
   ```
   - Now, simply open up Neovim. Lazy.nvim (your new plugin manager) will
     automatically begin installing all plugins, LSP servers, etc. After that...

🎊🎉 VOILA 🎉🎊.

You should now be good to go ☺️.

**(Optional) Configure AI Plugins**: Lastly, for those of you that want to take
advantage, we need to quickly set up your AI tooling. These should be very
quick.

- **Copilot.lua && cmp-copilot**: Once all plugins are installed, simply enter
  the command `"Copilot auth` and login to your Github account. If you have any
  issues, please see their full documentation
  [here](https://github.com/zbirenbaum/copilot.lua).

> **Note**: An active Copilot account is required.

- **ChatGPT.nvim && NeoAI**: Set environment variable called $OPENAI_API_KEY
  which you can obtain [here](https://platform.openai.com/account/api-keys).
  Full instructions can be found
  [here](https://github.com/jackMort/ChatGPT.nvim) and
  [here](https://github.com/Bryley/neoai.nvim) respectively.

> **Note**: An active OpenAI API Key is required, but a free key will likely
> last you a very long time by itself.

## Primary Features

In addition to the theming and UI provided by NvChad, this configuration also
offers:

### First-Class AI Integration

- **[Copilot.lua](https://github.com/zbirenbaum/copilot.lua)** by zbirenbaum

- **[Cmp-copilot](https://github.com/zbirenbaum/copilot-cmp)** by zbirenbaum

- **[ChatGpt](https://github.com/jackMort/ChatGPT.nvim)** by jackMort

- **[NeoAI](https://github.com/Bryley/neoai.nvim)** by Bryley

### Out-of-the-Box Support for All Major Languages

- **Python**: LSP, flake8
- **Javascript / Typescript**: LSPs, Eslint server, Prettier server
- **Rust**: Rust-tools by [simrat39](https://github.com/simrat39) (includes
  Rust-Analyzer and full debugging support) and Rustfmt
- **Go**: LSP, Gofmt, Goimports

**As well as full IDE support for**:

- **Svelte**, and
- **React**.

### Enhanced Motion

- **[Leap](https://github.com/ggandor/leap.nvim)** by ggandor

- **[NeoScroll](https://github.com/karb94/neoscroll.nvim)** by karb94

### Beautiful UI

- **[NvChad](https://github.com/NvChad/NvChad)**

- **[Noice](https://github.com/folke/noice.nvim)** by folke

- **[LspLines](https://git.sr.ht/~whynothugo/lsp_lines.nvim)** by whynothugo

- (Extra) **[Neovide](https://neovide.dev/) Support**

## Conclusion (Parting Words)

Lastly, please keep in mind that **working with Neovim can be hard and
confusing** at times. This is especially true when you are first getting into
it. Please feel free to reach out to me on here any time you need help; I am
**more than happy** to help anyone get comfortable using it themselves.
