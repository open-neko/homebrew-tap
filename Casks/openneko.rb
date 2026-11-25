cask "openneko" do
  version "6.3.0"

  on_macos do
    on_arm do
      sha256 "9393a799f7149aba2b1cb24dcef22f951b010684c03b97542d0a00a85a59afc8"
      url "https://github.com/open-neko/openneko/releases/download/v#{version}/openneko-native_#{version}_darwin_arm64.tar.gz"
    end
    on_intel do
      sha256 "3d9d7e04b9b017cabdb7b3fd37c8a0614401a498e203015358b222de9716f61a"
      url "https://github.com/open-neko/openneko/releases/download/v#{version}/openneko-native_#{version}_darwin_amd64.tar.gz"
    end
  end
  on_linux do
    on_arm do
      sha256 "6a68cc0604d27d92d80e4aff9f724c7edcdd62f49a5c06a0455ab7705bfe43e9"
      url "https://github.com/open-neko/openneko/releases/download/v#{version}/openneko-native_#{version}_linux_arm64.tar.gz"
    end
    on_intel do
      sha256 "834b883da40e7f65137d5cf37529cee6d0dc9a411c56a044bbaa0181a655f66a"
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
