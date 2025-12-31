class VlloraBeta < Formula
  desc "vllora - Multi-provider AI gateway server"
  homepage "https://github.com/vllora/vllora"
  version "0.1.21-prerelease-12"  # Update this with your version
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vllora/vllora/releases/download/v0.1.21-prerelease-12/vllora-macos-aarch64"
      sha256 "97b9c86132b65a73659e04c2964a000c7fced2569d5f37c39ac30b9402936003"  # Run: shasum -a 256 ai-gateway-aarch64
    else
      url "https://github.com/vllora/vllora/releases/download/v0.1.21-prerelease-12/vllora-macos-x86_64"
      sha256 "829140506a20eabfe54c09bbb1a17fb6ac306479f325e10fcc7286083bddf19b"  # Run: shasum -a 256 ai-gateway-x86_64
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vllora/vllora/releases/download/v0.1.21-prerelease-12/vllora-linux-aarch64"
      sha256 "ef29485b17d085d6a6c142d3ffb7dffd233e1abc80907c06c0b0a6763a4644c5"  # Will be updated by CI
    else
      url "https://github.com/vllora/vllora/releases/download/v0.1.21-prerelease-12/vllora-linux-x86_64"
      sha256 "a21e8dadd1236b6a9344667ce79da00a07d945b62a016ab272bb8bf8ee16af6e"  # Run: shasum -a 256 ai-gateway-x86_64
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
