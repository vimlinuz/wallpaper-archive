let header = "# Wallpaper Archive for Linux Window Managers & Desktops\n
\n
A collection of high-quality wallpapers suitable for all major Linux window managers and desktop environments. These backgrounds are curated to complement dynamic tiling, modern aesthetics, and to enhance the overall desktop experience—whether you're using Hyprland, Sway, i3, GNOME, KDE Plasma, XFCE, or any other environment.\n
\n
## About\n
\n
This repository contains handpicked wallpapers that work beautifully across a wide range of setups. While many are optimized for minimal, sleek configurations (such as Hyprland), they are equally at home on desktops and window managers of all kinds.\n
\n
## Contents\n
\n
- High-resolution backgrounds (minimum 1920x1080)\n
- Various themes and styles\n
- Suitable for transparency and blur effects if your environment supports them\n
\n
## Wallpaper Previews\n
\n
> All wallpapers are at least 1920x1080. Scroll down to see them all!\n
\n
### Static Wallpapers\n
\n
<p align=\\\"center\\\">\n"

let footer = "</p>\n
\n
---\n
\n
### Dynamic Wallpapers\n
\n
**Note:** Dynamic wallpapers (.mp4, .webm) cannot be previewed directly in GitHub. Please browse the \\`Dynamic-Wallpapers/\\` folder to see the available animated wallpapers.\n
\n
## Organization\n
\n
Wallpapers are organized by their type:\n
\n
- \\`Dynamic-Wallpapers/\\` — Contains all the dynamic wallpapers\n
- \\`Static-Wallpapers/\\` — Contains all the static wallpapers\n
\n
## Usage\n
\n
Clone this repository to your local machine:\n
\n
\\`\\`\\`bash\n
git clone https://github.com/santoshxshrestha/wallpaper-archive.git\n
\\`\\`\\`\n
\n
### How to Set Wallpapers\n
\n
Below are examples for popular Linux window managers and desktop environments. Replace \\`/path/to/wallpaper-archive/your-wallpaper.jpg\\` with your chosen wallpaper.\n
\n
#### Hyprland\n
\n
Add to your configuration file (\\`~/.config/hypr/hyprland.conf\\`):\n
\n
\\`\\`\\`\n
exec-once = swaybg -i /path/to/wallpaper-archive/your-wallpaper.jpg\n
\\`\\`\\`\n
\n
Or, with Hyprpaper:\n
\n
\\`\\`\\`\n
preload = ~/path/to/wallpaper-archive/your-wallpaper.jpg\n
wallpaper = , ~/path/to/wallpaper-archive/your-wallpaper.jpg\n
\\`\\`\\`\n
\n
#### Sway\n
\n
\\`\\`\\`\n
exec-once = swaybg -i /path/to/wallpaper-archive/your-wallpaper.jpg\n
\\`\\`\\`\n
\n
#### i3 / dwm / Openbox (using feh)\n
\n
\\`\\`\\`\n
feh --bg-scale /path/to/wallpaper-archive/your-wallpaper.jpg\n
\\`\\`\\`\n
\n
#### GNOME\n
\n
Right-click the desktop and select \\\"Change Background\\\", then browse to the cloned folder and select a wallpaper.\n
Or, from the terminal:\n
\n
\\`\\`\\`\n
gsettings set org.gnome.desktop.background picture-uri \\\"file:///path/to/wallpaper-archive/your-wallpaper.jpg\\\"\n
\\`\\`\\`\n
\n
#### KDE Plasma\n
\n
- Right-click the desktop → \\\"Configure Desktop and Wallpaper\\\" → Add Image → Select from the wallpaper-archive.\n
\n
#### XFCE\n
\n
- Right-click desktop → \\\"Desktop Settings\\\" → Add → Browse to wallpaper-archive.\n
\n
#### Cinnamon, LXQt, MATE, etc.\n
\n
- Use the standard desktop settings dialog to browse to the wallpaper-archive and pick your image.\n
\n
#### For Dynamic Wallpapers\n
\n
For environments that support dynamic wallpapers, you can use \\`mpvpaper\\`:\n
\n
\\`\\`\\`\n
mpvpaper -s -o \\\"no-audio loop\\\" eDP-1 ~/path/to/wallpaper-archive/your-wallpaper.mp4\n
\\`\\`\\`\n
\n
_If your environment isn’t listed here, please open an issue or PR with setup instructions!_\n
\n
## Contributing\n
\n
Contributions are welcome! If you'd like to add wallpapers:\n
\n
1. Fork this repository\n
2. Add your wallpapers (1920x1080 minimum resolution)\n
3. Create a pull request\n
\n
## License\n
\n
This is a curated archive of wallpapers collected from various open sources and repositories.\n
All wallpapers belong to their original creators. This archive does not claim ownership of any content.\n
Please respect the original creators of the wallpapers. This collection is for personal use only.\n
\n
> Usage: Personal use only. Do not redistribute or use for commercial purposes without permission from the original author.\n
> If you're a creator and would like your artwork removed or credited, please open an issue.\n"

$header | save --force README.md

ls "Static-Wallpapers" | where type == "file" | where name =~ '\\.(jpg|jpeg|png|webp)$' | sort-by name | each {
    echo $" <img src=\\\"Static-Wallpapers/($it.name)\\\" width=\\\"300\\\">" | save --append README.md
}

$footer | save --append README.md