class Ellora < Formula
    desc "Ellora - Multi-provider AI gateway server"
    homepage "https://github.com/langdb/ellora"
    version "0.4.0-prerelease-3"  # Update this with your version

    on_macos do
      if Hardware::CPU.arm?
        url "https://github.com/langdb/ai-gateway/releases/download/v0.4.0-prerelease-3/ai-gateway-macos-aarch64"
        sha256 "1ddf5c51c1d71bfbd4c947110a4ccb3aff8b4903f24de5f8d6b446185a1e83e2"  # Run: shasum -a 256 ai-gateway-aarch64
      else
        url "https://github.com/langdb/ai-gateway/releases/download/v0.4.0-prerelease-3/ai-gateway-macos-x86_64"
        sha256 "8f5db99654cf4072a43e8f38f83b3074cfa9ba996cb9a37a44cd033da45f4262"  # Run: shasum -a 256 ai-gateway-x86_64
      end
    end

    on_linux do
    #   if Hardware::CPU.arm?
    #     url "https://github.com/langdb/ai-gateway/releases/download/v0.3.2/ai-gateway-linux-aarch64"
    #     sha256 "f9dbe7dfbe1f7a6a817f0d3a674d54ad07062496e5753106d42d916ef450b7b2"  # Run: shasum -a 256 ai-gateway-aarch64
    #   else
        url "https://github.com/langdb/ai-gateway/releases/download/v0.4.0-prerelease-3/ai-gateway-linux-x86_64"
        sha256 "a6fa039d4520081d6c8613777481439072110816975a747355bb5ea4dc818be4"  # Run: shasum -a 256 ai-gateway-x86_64
    #   end
    end

    def install
      if OS.mac?
        if Hardware::CPU.arm?
          bin.install "ai-gateway-macos-aarch64" => "ellora"
        else
          bin.install "ai-gateway-macos-x86_64" => "ellora"
        end
      elsif OS.linux?
        bin.install "ai-gateway-linux-x86_64" => "ellora"
      end
    end

    def caveats
      <<~EOS
        After starting, server will be running on port http://localhost:8080 and UI can be accessed at http://localhost:8084
      EOS
    end

    test do
      system "#{bin}/ai-gateway", "--version"
    end
  end