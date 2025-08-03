# 0xNiri

Personal dotfiles for the [Niri](https://github.com/YaLTeR/niri) Wayland compositor.

> Theme: [Catppuccin Mocha](https://github.com/catppuccin)

## Preview

https://github.com/user-attachments/assets/91898320-7f52-4a83-97ac-d512cce48e85

## Features

- Waybar auto-hide script.
- Consistent **Catppuccin Mocha** theme across all apps.
- Full desktop-like experience on a minimal **Niri** setup.

## Tools & Utilities

| Category | Application |
| - | - |
| Compositor | [`niri`](https://github.com/YaLTeR/niri) |
| Bar | [`waybar`](https://github.com/Alexays/Waybar) |
| Terminal | [`kitty`](https://github.com/kovidgoyal/kitty) |
| Notification | [`swaync`](https://github.com/ErikReider/SwayNotificationCenter) |
| Wallpaper Manager | [`swaybg`](https://github.com/swaywm/swaybg) / [`swww`](https://github.com/LGFae/swww) |
| Clipboard Manager | [`cliphist`](https://github.com/sentriz/cliphist) |
| Launcher | [`fuzzel`](https://codeberg.org/dnkl/fuzzel) |
| Power Menu | [`wlogout`](https://github.com/ArtsyMacaw/wlogout) |
| Screen Locker | [`gtklock`](https://github.com/jovanlanik/gtklock) |
| On-Screen Display | [`avizo`](https://github.com/heyjuvi/avizo) |
| File Manager | [`nautilus`](https://gitlab.gnome.org/GNOME/nautilus) / [`yazi`](https://github.com/sxyazi/yazi) |
| Shell | [`fish`](https://github.com/fish-shell/fish-shell) |
| Display Manager | [`ly`](https://github.com/fairyglade/ly) |

## Installation

> [!NOTE]
> This setup is intended for Arch-based distributions.

### Clone the repo
```bash
git clone https://github.com/rickinshah/niri-dotfiles ~/.dotfiles
cd ~/.dotfiles
```

### Installation

#### 1. Install required packages

##### Install `yay`
```bash
sudo pacman -S --needed base-devel git
git clone https://aur.archlinux.org/yay.git ~/yay
cd ~/yay
makepkg -si
rm -rf ~/yay
```

##### Install packages
```bash
cd ~/.dotfiles
yay -S --needed --noconfirm $(cat packages.txt)
```

#### 2. Set `fish` as default shell
```bash
chsh -s /bin/fish
```

#### 3. Setup config files
```fish
cp -r ~/.dotfiles/.config/. ~/.config/
```

#### 4. Setup scripts

##### Move scripts to `~/.local/share/bin`
```fish
mkdir -p ~/.local/share/bin
cp -r ~/.dotfiles/bin/. ~/.local/share/bin
```

##### Add `~/.local/share/bin` to `PATH` variable
```fish
fish_add_path -a ~/.local/share/bin
```

> [!WARNING]
> Some keybindings or systemd services may not work if `~/.local/share/bin` is not added to your `PATH` variable.

#### 5. Start the essential startup applications. [Refer to this section](#startup-applications)

#### 6. `Logout` or `Restart`

## Startup Applications

Startup applications are managed using `systemd` — as recommended in [official Niri documentation](https://github.com/YaLTeR/niri/wiki/Example-systemd-Setup)

Custom unit files are stored in: `~/.config/systemd/user`

### Essential Services

| Service | Purpose |
| - | - |
| `avizo.service` | OSD for volume/brightness |
| `cliphist.service` | Clipboard Manager |
| `polkit-gnome.service` | Polkit auth agent |
| `swaybg.service` | Blur Wallpaper(overview mode) |
| `swww-wallpaper.service` | Wallpaper |
| `waybar.service` | Status bar |
| `xwayland-satellite.service` | Xwayland support |

### Optional Services

| Service | Purpose |
| - | - |
| `auto-hide-waybar.service` | Auto hide waybar |
| `check-updates.service` | Check updates and notify |
| `kdeconnect-indicator.service` | KDE Connect |
| `niri-screen-time.service` | Screen Time |
| `wlsunset.service` | Night Mode |

Enable services with:
```fish
systemctl --user add-wants niri.service <service>.service
```

For example:
```fish
systemctl --user add-wants niri.service waybar.service
systemctl --user add-wants niri.service avizo.service
```

## Credits

- [Wallpapers](https://github.com/orangci/walls-catppuccin-mocha)
