cask "openneko" do
  version "6.2.0"

  on_macos do
    on_arm do
      sha256 "6bd90b8b972584b8cdae78b3a1e2ec6d8374ae5c909f9785761c7f75353be1b2"
      url "https://github.com/open-neko/openneko/releases/download/v#{version}/openneko-native_#{version}_darwin_arm64.tar.gz"
    end
    on_intel do
      sha256 "c7205fcf2b42e9b935f09ec3334217db7cdd980f0d66bf2282b108408beead86"
      url "https://github.com/open-neko/openneko/releases/download/v#{version}/openneko-native_#{version}_darwin_amd64.tar.gz"
    end
  end
  on_linux do
    on_arm do
      sha256 "b6a1118fe71b5463dae9009c0bb5f810f377b665a1b732245821771937c0a5d3"
      url "https://github.com/open-neko/openneko/releases/download/v#{version}/openneko-native_#{version}_linux_arm64.tar.gz"
    end
    on_intel do
      sha256 "4fa659a7c2d18f27a3d4936574b7448e6e82e0e4d22f77acd9b90e51b7660e3c"
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
