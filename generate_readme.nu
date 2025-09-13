
let readme_template = "
# Wallpaper Archive for Linux Window Managers & Desktops

A collection of high-quality wallpapers suitable for all major Linux window managers and desktop environments. These backgrounds are curated to complement dynamic tiling, modern aesthetics, and to enhance the overall desktop experience—whether you\'re using Hyprland, Sway, i3, GNOME, KDE Plasma, XFCE, or any other environment.

## About

This repository contains handpicked wallpapers that work beautifully across a wide range of setups. While many are optimized for minimal, sleek configurations (such as Hyprland), they are equally at home on desktops and window managers of all kinds.

## Contents

- High-resolution backgrounds (minimum 1920x1080)
- Various themes and styles
- Suitable for transparency and blur effects if your environment supports them

## Wallpaper Previews

> All wallpapers are at least 1920x1080. Scroll down to see them all!

### Static Wallpapers

<p align=\"center\">
"

# Get all files in Static-Wallpapers/ with image extensions, sorted
let images = ls Static-Wallpapers | sort-by name

let img_tags = $images | each {|it| 
    $"<img src=\"Static-Wallpapers/($it.name | path basename)\" width=\"300\">"
} | str join "\n"

let dynamic_note = "
</p>

---

### Dynamic Wallpapers

**Note:** Dynamic wallpapers (.mp4, .webm) cannot be previewed directly in GitHub. Please browse the Dynamic-Wallpapers/ folder to see the available animated wallpapers.

## Organization

Wallpapers are organized by their type:

- `Dynamic-Wallpapers/` — Contains all the dynamic wallpapers
- `Static-Wallpapers/` — Contains all the static wallpapers


## Contributing

Contributions are welcome! If you'd like to add wallpapers:

1. Fork this repository
2. Add your wallpapers (1920x1080 minimum resolution)
3. Create a pull request

## License

This is a curated archive of wallpapers collected from various open sources and repositories.
All wallpapers belong to their original creators. This archive does not claim ownership of any content.
Please respect the original creators of the wallpapers. This collection is for personal use only.

> Usage: Personal use only. Do not redistribute or use for commercial purposes without permission from the original author.
> If you're a creator and would like your artwork removed or credited, please open an issue.  
"

# Concatenate all parts and write to README.md
let final_readme = $readme_template + "\n" + $img_tags + "\n" + $dynamic_note
echo $final_readme | save -f README.md

echo $"README.md generated with ($images | length) static wallpapers."