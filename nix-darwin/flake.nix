{
  description = "Example nix-darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs }:
  let
    configuration = { pkgs, ... }: {
      homebrew = {
        enable = true;
        brews = [
        "fish"
        "carapace"
        ];
        casks = [
          "lulu"
          "oversight"
          "reikey"
          "utm"
          "utm"
          "alt-tab"
          "transmission"
          "vlc"
          "obs"
          "spotify"
          "mullvadvpn"
          "google-chrome"
          "gitbutler"
          "firefox"
          "telegram"
        ];

        masApps = {
          Xcode = 497799835;
          "Color Slurp" = 1287239339;
          "Ausweis app" = 948660805;
          "Blackmagic Disk Speed Test" = 425264550;
        };

      };


      # List packages installed in system profile. To search by name, run:
      # $ nix-env -qaP | grep wget
      environment.systemPackages =
        [ 
          pkgs.rustup
          pkgs.nushell
          pkgs.neovim
          pkgs.git
          pkgs.go
          pkgs.wezterm
          pkgs.ripgrep
          pkgs.gitui
          pkgs.volta
          pkgs.delta
          pkgs.bat
          pkgs.bottom
          pkgs.fd
          pkgs.starship
          pkgs.kondo
          pkgs.tokei
          pkgs.zoxide
          pkgs.stow
          pkgs.lua
          pkgs.luarocks
          pkgs.ffmpeg
          pkgs.yt-dlp
        ];

        environment.shellAliases = {
          v = "nvim";
        };

        environment.variables = {
          EDITOR = "nvim";
        };


    system.primaryUser = "home";

      # Necessary for using flakes on this system.
      nix.settings.experimental-features = "nix-command flakes";

      # Enable alternative shell support in nix-darwin.
      # programs.fish.enable = true;

      # Set Git commit hash for darwin-version.
      system.configurationRevision = self.rev or self.dirtyRev or null;

      # Used for backwards compatibility, please read the changelog before changing.
      # $ darwin-rebuild changelog
      system.stateVersion = 5;

      # The platform the configuration will be used on.
      nixpkgs.hostPlatform = "aarch64-darwin";

      system.defaults.NSGlobalDomain.AppleScrollerPagingBehavior = true;
      system.defaults.NSGlobalDomain.AppleShowAllExtensions = true;
      # This will take effect after reboot
      system.defaults.NSGlobalDomain.KeyRepeat = 1;
      system.defaults.NSGlobalDomain.NSAutomaticCapitalizationEnabled = false;
      system.defaults.NSGlobalDomain.NSAutomaticSpellingCorrectionEnabled = false;
      system.defaults.NSGlobalDomain.NSDocumentSaveNewDocumentsToCloud = false;
      system.defaults.NSGlobalDomain.NSNavPanelExpandedStateForSaveMode = true;
      system.defaults.NSGlobalDomain.NSNavPanelExpandedStateForSaveMode2 = true;


      #Configures the trackpad tap behavior. Mode 1 enables tap to click.
      system.defaults.NSGlobalDomain."com.apple.mouse.tapBehavior" = 1;
      system.defaults.trackpad.Clicking = true;


      system.defaults.NSGlobalDomain."com.apple.swipescrolldirection" = false;


      system.defaults.SoftwareUpdate.AutomaticallyInstallMacOSUpdates = false;

      system.defaults.WindowManager.EnableTiledWindowMargins = false;

      # Apple menu > System Preferences > Security and Privacy > Firewall
      # Allows any downloaded Application that has been signed to accept incoming requests. Default is 0.
      system.defaults.alf.allowdownloadsignedenabled = 1;

      system.defaults.controlcenter.BatteryShowPercentage = true;

      system.defaults.controlcenter.Bluetooth = true;


      system.defaults.dock.autohide = true;
      # Set the minimize/maximize window effect. The default is genie.
      system.defaults.dock.mineffect = null;
      system.defaults.dock.minimize-to-application = true;
      system.defaults.dock.persistent-apps = [
          "/System/Applications/App Store.app"
          "/System/Applications/Calendar.app"
          "/Applications/Brave Browser.app"
          "/Applications/Spotify.app"
          "/Applications/Wezterm.app"
      ];
      system.defaults.dock.show-recents = false;

      # Disable hot corner actions
      system.defaults.dock.wvous-bl-corner = 1;
      system.defaults.dock.wvous-br-corner = 1;
      system.defaults.dock.wvous-tl-corner = 1;
      system.defaults.dock.wvous-tr-corner = 1;


      system.defaults.finder.AppleShowAllExtensions = true;
      system.defaults.finder.FXEnableExtensionChangeWarning = false;
      #Change the default finder view. “icnv” = Icon view, “Nlsv” = List view, “clmv” = Column View, “Flwv” = Gallery View The default is icnv.
      system.defaults.finder.FXPreferredViewStyle = "Nlsv";

      system.defaults.finder.NewWindowTarget = "Home";

      system.defaults.finder.ShowPathbar = true;
      system.defaults.finder.ShowStatusBar = true;

      system.defaults.loginwindow.GuestEnabled = false;


      system.defaults.CustomUserPreferences = {};

      power.sleep.computer = 480;
      power.sleep.display = 60;

      security.pam.services.sudo_local.touchIdAuth = true;
    };
  in
  {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#homes-Mac-mini
    darwinConfigurations."homes-Mac-mini" = nix-darwin.lib.darwinSystem {
      modules = [ configuration ];
    };
  };
}
