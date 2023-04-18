# ByteMyBriefs's Neovim Config

This repository contains my current Neovim configuration. It is, and always,
will remain up to date. I primarily decided to publish it so that my friends who
are interested can easily make the transition to Nvim from other editors.
However, anyone else who is interested can certainly benefit from it as well.

It is an extension of [NvChad](https://github.com/NvChad/NvChad) and will not
work without it. Though I used to run my own bootstrapped config, NvChad is just
absolutely beautiful, and using it saves a lot of headache when it comes to
configuring our UI. Outsourcing this decision to those much more adept at design
than me only makes sense.

## 🎪 Showcase

![Start Screen](https://github.com/ByteMyBriefs/nvim-config/blob/main/.github/demo/start_screen.png?raw=true)

![Default View of Editor](https://github.com/ByteMyBriefs/nvim-config/blob/main/.github/demo/default.png?raw=true)

![Noice Cmdline](https://github.com/ByteMyBriefs/nvim-config/blob/main/.github/demo/noice.png?raw=true)

## 🛠️ Installation

### 🕓 Estimated Setup Time: 15 minutes

1. **Neovim**: The first step is to install Neovim itself. Installation
   instructions for all platforms can be found
   [here](https://github.com/neovim/neovim/wiki/Installing-Neovim).

2. **NvChad**: Next, set up NvChad per their
   [instructions](https://nvchad.com/docs/quickstart/install).

   > **Note**: They reccomend having a Nerd font installed (and I do as well).
   > It will allow you to take full advantage of their beautiful UI, and
   > especially any and all glyph/icon-related features. Installation is easy
   > and a great tutorial can be found
   > [here](https://www.geekbits.io/how-to-install-nerd-fonts-on-mac/).
   > Additionally, please see [NerdFonts.com](https://www.nerdfonts.com/) for a
   > fantastic collection of the most popular nerd fonts.

3. **Clone this Repository**: Once NvChad is installed, delete all of the
   contents of `./lua/custom`.
   - Once that is done, simply clone this repository into that folder.
   - Next, quit Neovim and open it back up.
   - Lazy.nvim (your new plugin manager) will download all of the plugins you
     need and then...

🎊🎉 VOILA 🎉🎊.

You should now be good to go ☺️.

**(Optional) Configure AI Plugins**: Lastly, for those of you that want to take
advantage, we need to quickly set up your AI tooling. These should be very
quick.

++ **Copilot.lua && cmp-copilot**: Once all plugins are installed, simply enter
the command `"Copilot auth` and login to your Github account. If you have any
issues, please see their full documentation
[here](https://github.com/zbirenbaum/copilot.lua).

> **Note**: An active Copilot account is required.

++ **ChatGPT.nvim && NeoAI**: Set environment variable called $OPENAI_API_KEY
which you can obtain [here](https://platform.openai.com/account/api-keys). Full
instructions can be found [here](https://github.com/jackMort/ChatGPT.nvim) and
[here](https://github.com/Bryley/neoai.nvim) respectively.

> **Note**: An active OpenAI API Key is required, but a free key will likely
> last you a very long time by itself.

## Primary Features

In addition to the theming and UI provided by NvChad, this configuration also
offers:

### First-Class AI Integration

- **Copilot.lua** by [zbirenbaum](https://github.com/zbirenbaum)

- **Cmp-copilot** by [zbirenbaum](https://github.com/zbirenbaum)

- **ChatGpt** by [jackMort](https://github.com/jackMort)

- **NeoAI** by [Bryley](https://github.com/Bryley)

#### Out-of-the-Box Support for All Major Languages

- **LSPs && Linters && Formatters**

- **Node.js/Javascript/Typescript**, as well as support for:

- **Svelte**, and

- **React**

As well as linting and formatting using Null-ls with:

- **Eslint, Prettier, etc.**

- **Rust, Rust-analyzer, Rust tools**

* **Enhanced Motion**

  - **Leap**

  - **NeoScroll**

* **Beautiful UI**

  - **NvChad**

  - **Noice**

  - **LspLines**

  - (Extra) **Neovide Support**

## Conclusion (Parting Words)

Lastly, please keep in mind that **working with Neovim can be hard and
confusing** at times. This is especially true when you are first getting into
it. Please feel free to reach out to me on here any time you need help; I am
**more than happy** to help anyone get comfortable using it themselves.
