cask "openneko" do
  version "6.2.1"

  on_macos do
    on_arm do
      sha256 "a9ad88a08fb1f37b5f459c89a172172bde8baf87b0f959e6d1db8586a2f6f87f"
      url "https://github.com/open-neko/openneko/releases/download/v#{version}/openneko-native_#{version}_darwin_arm64.tar.gz"
    end
    on_intel do
      sha256 "6e7f000ac0c50ac5bac37259ac58a69b255fbf50388577fe871cde98928fd638"
      url "https://github.com/open-neko/openneko/releases/download/v#{version}/openneko-native_#{version}_darwin_amd64.tar.gz"
    end
  end
  on_linux do
    on_arm do
      sha256 "4c1f1e97d79c9af5b94f9c29f8649eba556055e2eadd3573c1473d145e03d2ff"
      url "https://github.com/open-neko/openneko/releases/download/v#{version}/openneko-native_#{version}_linux_arm64.tar.gz"
    end
    on_intel do
      sha256 "892dc57fe6c40ee6afd1eb6e02ef12068996fa206526cd1a1b0d5bf99d7b470a"
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
