class VlloraBeta < Formula
  desc "vllora - Multi-provider AI gateway server"
  homepage "https://github.com/vllora/vllora"
  version "0.1.12-prerelease-8"  # Update this with your version
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vllora/vllora/releases/download/v0.1.12-prerelease-8/vllora-macos-aarch64"
      sha256 "90d4a8b44f37c553eceba03733d1a8e008be3cda28831d3e35beb42f14609b54"  # Run: shasum -a 256 ai-gateway-aarch64
    else
      url "https://github.com/vllora/vllora/releases/download/v0.1.12-prerelease-8/vllora-macos-x86_64"
      sha256 "c015f5e914d3892d527cc398b28970b2eb5b9595ab558ed757a7e3beb3af72e6"  # Run: shasum -a 256 ai-gateway-x86_64
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vllora/vllora/releases/download/v0.1.12-prerelease-8/vllora-linux-aarch64"
      sha256 "3014972f5e5e218362d8a56cfc179df6f5cb2a819151222388ec90800fc4682f"  # Will be updated by CI
    else
      url "https://github.com/vllora/vllora/releases/download/v0.1.12-prerelease-8/vllora-linux-x86_64"
      sha256 "2a4822bb83c34796a56c7472c992d00cb769b0e699f98020984aa0ed005618f2"  # Run: shasum -a 256 ai-gateway-x86_64
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
