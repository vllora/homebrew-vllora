class Vllora < Formula
  desc "vllora - Multi-provider AI gateway server"
    homepage "https://github.com/langdb/vllora"
    version "0.4.0-prerelease-11"  # Update this with your version
    on_macos do
      if Hardware::CPU.arm?
        url "https://github.com/langdb/ai-gateway/releases/download/v0.4.0-prerelease-11/ai-gateway-macos-aarch64"
        sha256 "b655de22488f98ec8ec633911ed86a93a0c8a4e7395fa0caa8f86683ab87c6a7"  # Run: shasum -a 256 ai-gateway-aarch64
      else
        url "https://github.com/langdb/ai-gateway/releases/download/v0.4.0-prerelease-11/ai-gateway-macos-x86_64"
        sha256 "63d79680f3ad5767ae672843a3af4ed58854fb158329356f5eb0fedcb51451c7"  # Run: shasum -a 256 ai-gateway-x86_64
      end
    end
    on_linux do
    #   if Hardware::CPU.arm?
    #     url "https://github.com/langdb/ai-gateway/releases/download/v0.3.2/ai-gateway-linux-aarch64"
    #     sha256 "f9dbe7dfbe1f7a6a817f0d3a674d54ad07062496e5753106d42d916ef450b7b2"  # Run: shasum -a 256 ai-gateway-aarch64
    #   else
        url "https://github.com/langdb/ai-gateway/releases/download/v0.4.0-prerelease-11/ai-gateway-linux-x86_64"
        sha256 "53bf1449fba0b371e9a636bd6af92a85b448252c993eb7e69983deab149e4440"  # Run: shasum -a 256 ai-gateway-x86_64
    #   end
    end
    def install
      if OS.mac?
        if Hardware::CPU.arm?
          bin.install "ai-gateway-macos-aarch64" => "vllora"
        else
          bin.install "ai-gateway-macos-x86_64" => "vllora"
        end
      elsif OS.linux?
        bin.install "ai-gateway-linux-x86_64" => "vllora"
      end
    end
    def caveats
      # <<~EOS
      #   Server is running on port 8080 and UI can be accessed at http://localhost:8084
      # EOS
    end
    test do
      system "#{bin}/ai-gateway", "--version"
    end
  end