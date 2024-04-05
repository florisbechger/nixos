
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Packages
  environment.systemPackages = with pkgs; [

    ansible
    appimage-run
    buttercup-desktop
    dmidecode
    filezilla
    firefox
    geany
    git
    gparted
    grsync
    hdparm
    htop
    hwinfo
    inxi
    libreoffice
    librewolf
    lshw
    lvm2
    meld
    neofetch
    nmap
    parted
    pciutils
    ranger
    sieve-connect
    smartmontools
    tlp
    tree
    wget

    # megasync
    # nomachine-client
    # slack
    # thunderbird
    # vscode

  ];

  # Automatic Upgrades.
  system.autoUpgrade.channel = https://nixos.org/channels/nixos-23.11;
  system.autoUpgrade.enable = false;
  system.autoUpgrade.allowReboot = false;

  # Automatic Garbage Collection.
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };

  # Last entries.
  system.copySystemConfiguration = true;
  system.stateVersion = "23.11";

}

