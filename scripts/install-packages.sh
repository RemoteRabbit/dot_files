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
	"awesome"
	"betterlockscreen"
	"brave-nightly-bin"
	"discord"
	"go"
	"neofetch"
	"neovim"
	"npm"
	"pavucontrol"
	"pfetch"
	"picom"
	"pipewire"
	"rofi"
	"sddm"
	"slack"
	"spotify"
	"starship"
	"steam"
	"thunar"
	"trash-cli"
	"vlc"
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
