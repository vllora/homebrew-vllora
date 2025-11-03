class VlloraBeta < Formula
  desc "vllora - Multi-provider AI gateway server"
  homepage "https://github.com/vllora/vllora"
  version "0.1.1-prerelease-1"  # Update this with your version
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vllora/vllora/releases/download/v0.1.1-prerelease-1/vllora-macos-aarch64"
      sha256 "8fd63609f042b8109b3f338dc43564a7e608050c586d2c07889d7d18ac2b49a2"  # Run: shasum -a 256 ai-gateway-aarch64
    else
      url "https://github.com/vllora/vllora/releases/download/v0.1.1-prerelease-1/vllora-macos-x86_64"
      sha256 "858508bc65bd0f13e018b973468fa032c3a5f448fdcc6f3677598229573de983"  # Run: shasum -a 256 ai-gateway-x86_64
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vllora/vllora/releases/download/v0.1.1-prerelease-1/vllora-linux-aarch64"
      sha256 "f880f9c90bbdd0480225f4ebff8a631431c333306073926d66e60bdcca14da9e"  # Will be updated by CI
    else
      url "https://github.com/vllora/vllora/releases/download/v0.1.1-prerelease-1/vllora-linux-x86_64"
      sha256 "ac556dd5f93ed64f101fad6e4687e09124db4ed8e810599aa79dfa295542c8a7"  # Run: shasum -a 256 ai-gateway-x86_64
    end
  end
  def install
    if OS.mac?
      if Hardware::CPU.arm?
        bin.install "vllora-macos-aarch64" => "vllora-beta"
      else
        bin.install "vllora-macos-x86_64" => "vllora-beta"
      end
    elsif OS.linux?
      if Hardware::CPU.arm?
        bin.install "vllora-linux-aarch64" => "vllora-beta"
      else
        bin.install "vllora-linux-x86_64" => "vllora-beta"
      end
    end
  end
  def caveats
    # <<~EOS
    #   Server is running on port 8080 and UI can be accessed at http://localhost:8084
    # EOS
  end
  test do
    system "#{bin}/vllora-beta", "--version"
  end
end
