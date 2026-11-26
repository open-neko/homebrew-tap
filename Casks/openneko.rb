cask "openneko" do
  version "6.3.1"

  on_macos do
    on_arm do
      sha256 "f8743271c664bf9c72b2636bcc33116c3f947840616d46c47a67230e3ac769cf"
      url "https://github.com/open-neko/openneko/releases/download/v#{version}/openneko-native_#{version}_darwin_arm64.tar.gz"
    end
    on_intel do
      sha256 "ef93118d357671d1760cd51874452b1c6538e16605492686f45c37bf3419797f"
      url "https://github.com/open-neko/openneko/releases/download/v#{version}/openneko-native_#{version}_darwin_amd64.tar.gz"
    end
  end
  on_linux do
    on_arm do
      sha256 "412ede8714a5b40421225f9b091aaa971ed6a2925f57e03ab398c40f39175070"
      url "https://github.com/open-neko/openneko/releases/download/v#{version}/openneko-native_#{version}_linux_arm64.tar.gz"
    end
    on_intel do
      sha256 "4966756e06aeca8aad5f86fbbc81a4b2ae695823d34f402e02929f4b2f256102"
      url "https://github.com/open-neko/openneko/releases/download/v#{version}/openneko-native_#{version}_linux_amd64.tar.gz"
    end
  end

  name "OpenNeko"
  desc "Operator CLI and runtime for OpenNeko"
  homepage "https://openneko.app"

  livecheck do
    skip "Written by the OpenNeko release workflow."
  end

  binary "bin/openneko"

  postflight do
    if OS.mac?
      system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", staged_path.to_s]
    end
  end

  caveats <<~EOS
    Run OpenNeko with Docker: `openneko setup`.
    Run it without Docker, against your PostgreSQL database:
      openneko start --native -d --database-url 'postgres://USER:PASSWORD@HOST:5432/DATABASE'
  EOS
end
