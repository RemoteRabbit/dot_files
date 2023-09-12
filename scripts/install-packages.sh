echo "-----------------------------------------------------------------
██████╗  █████╗  ██████╗██╗  ██╗ █████╗  ██████╗ ███████╗███████╗
██╔══██╗██╔══██╗██╔════╝██║ ██╔╝██╔══██╗██╔════╝ ██╔════╝██╔════╝
██████╔╝███████║██║     █████╔╝ ███████║██║  ███╗█████╗  ███████╗
██╔═══╝ ██╔══██║██║     ██╔═██╗ ██╔══██║██║   ██║██╔══╝  ╚════██║
██║     ██║  ██║╚██████╗██║  ██╗██║  ██║╚██████╔╝███████╗███████║
╚═╝     ╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝ ╚══════╝╚══════╝
-----------------------------------------------------------------"

echo "Checking for yay..."
if ! command -v yay &>/dev/null; then
	echo "yay not found, installing..."
	pacman -S --needed git base-devel
	git clone https://aur.archlinux.org/yay.git
	cd yay
	makepkg -si
	cd ..
	rm -rf yay
	yay -Y --gendb
	yay -Syu --devel
else
	echo "yay found, skipping..."
fi

packages=(
	"alacritty"
	"asciiquarium"
	"awesome"
	"bat"
	"betterlockscreen"
	"blueman"
	"bluez"
	"btop"
	"brave-nightly-bin"
	"devdocs-desktop"
	"discord"
	"elixir"
	"fd"
	"flameshot"
	"fwupd"
	"go"
	"hollywood"
	"inotify-tools"
	"lazygit"
	"mkinitcpio-firmware"
	"neofetch"
	"neovim"
	"nodejs"
	"npm"
	"pavucontrol"
	"php"
	"python-pipx"
	"pfetch"
	"picom"
	"pipewire"
	"rofi"
	"ruby"
	"rust"
	"sddm"
	"slack-desktop"
	"spotify"
	"spotifyd"
	"starship"
	"steam"
	"teams"
	"thunar"
	"trash-cli"
	"unzip"
	"vlc"
	"zellij"
	"zsh"
)

for package in "${packages[@]}"; do
	# echo "Checking for $package..."
	if ! yay -Qs "$package" &>/dev/null; then
		echo "$package not found, installing..."
		yay -S "$package" --noconfirm
	else
		echo "$package found, skipping..."
	fi
done
