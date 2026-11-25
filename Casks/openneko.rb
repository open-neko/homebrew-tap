cask "openneko" do
  version "6.1.0"

  on_macos do
    on_arm do
      sha256 "091608694200c398277b91f01353757dca2321e5a57325fed3f82c24b34592c0"
      url "https://github.com/open-neko/openneko/releases/download/v#{version}/openneko-native_#{version}_darwin_arm64.tar.gz"
    end
    on_intel do
      sha256 "118dd5a0364353a1d797f6b66f74e95ba38c605907c67e2a8ff6e88b1f80a1f4"
      url "https://github.com/open-neko/openneko/releases/download/v#{version}/openneko-native_#{version}_darwin_amd64.tar.gz"
    end
  end
  on_linux do
    on_arm do
      sha256 "5a5804d49f946b3ee13d938406ddd97c234fd61d13b87a77f2df352790096a36"
      url "https://github.com/open-neko/openneko/releases/download/v#{version}/openneko-native_#{version}_linux_arm64.tar.gz"
    end
    on_intel do
      sha256 "db8b6194c6609dd323fb43c157815ff58c3e2447b0c07b48da2bd4e5df0e1a77"
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
