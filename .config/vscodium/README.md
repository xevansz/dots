# Compline - VS Code Theme Extension

A minimalist dark and light color scheme for VS Code, inspired by monastic tradition. Two complementary themes designed for deep focus and contemplation.

Made by [Joshua Blais](https://github.com/jblais493/compline).

Ported to VS Code by `rivethorn` — this repository contains the VS Code extension packaging and theme files contributed by `rivethorn`.

## Themes

- **Compline** - Dark theme for evening work and contemplation
- **Lauds** - Light theme for morning clarity and focus

## Features

- Unified, muted color palette that whispers rather than shouts
- Carefully chosen contrast for accessibility
- Thoughtful use of color to guide attention without distraction
- Syntax highlighting that enhances readability across all languages

## Installation

1. Open VS Code
2. Go to Extensions (`Cmd+Shift+X` on macOS, `Ctrl+Shift+X` on Windows/Linux)
3. Search for "Compline"
4. Click Install

Or, use this [link](https://marketplace.visualstudio.com/items?itemName=rivethorn.compline)
## clone the repo and install this theme following the instructions
## Local Installation

If you want to install the theme locally from source or make modifications:

### Packaging the Theme

1. Install the required dependencies:
   ```bash
   npm install --save-dev @vscode/vsce
   ```

2. Package the extension into a `.vsix` file:
   ```bash
   npx vsce package
   ```

   This will create a `compline-1.0.0.vsix` file in the project directory.

### Installing from VSIX

1. Open VS Code
2. Press `Ctrl+Shift+X` (or `Cmd+Shift+X` on macOS) to open the Extensions view
3. Click the `...` menu (three dots) in the top right corner of the Extensions view
4. Select "Install from VSIX..."
5. Navigate to and select the `compline-1.0.0.vsix` file
6. Restart VS Code if prompted

After installation, you can activate the theme using the steps in the Usage section below.

**Note:** If you make changes to the theme files, you'll need to repackage the extension (`npx vsce package`) and reinstall it.

## Usage

1. Open the Command Palette (`Cmd+Shift+P` on macOS, `Ctrl+Shift+P` on Windows/Linux)
2. Type "Color Theme"
3. Select either "Compline" or "Lauds"

## Colors

### Compline (Dark)

- Background: `#1a1d21`
- Foreground: `#f0efeb`
- Primary accent: `#d4ccb4`
- Secondary: `#b4bcc4`

### Lauds (Light)

- Background: `#f0efeb`
- Foreground: `#1a1d21`
- Primary accent: `#8b7e52`
- Secondary: `#5a6b7a`

## License

GPL-3.0-only License. See `LICENSE` file for details.

**Credits & Contribution**

- **Original author:** Joshua Blais (`jblais493`) — original Compline theme source and palette.
- **VS Code port / packaging:** `rivethorn` — contributor who ported and packaged the themes for VS Code.

If you'd prefer the original author to publish the extension to the Visual Studio Marketplace under their publisher account, let me know and I can prepare a PR or package to share with them.
