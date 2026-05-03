## Dotfiles

My dotfiles using [chezmoi][1].

Simplest installation:

```bash
sudo dnf install -y httpie git make zsh
bash <(http https://raw.githubusercontent.com/fgrosse/dotfiles/master/setup.sh)
```

## Post-install

After chezmoi has applied the dotfiles, install the remaining tools:

```bash
chezmoi cd
./setup-tools.sh
```

[1]: https://github.com/twpayne/chezmoi
