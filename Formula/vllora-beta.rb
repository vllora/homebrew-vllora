class VlloraBeta < Formula
  desc "vllora - Multi-provider AI gateway server"
  homepage "https://github.com/vllora/vllora"
  version "0.1.14-prerelease-4"  # Update this with your version
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vllora/vllora/releases/download/v0.1.14-prerelease-4/vllora-macos-aarch64"
      sha256 "d724f6ce1252530515195a96e230517df099987592fa0e73b736b5b01a0133e0"  # Run: shasum -a 256 ai-gateway-aarch64
    else
      url "https://github.com/vllora/vllora/releases/download/v0.1.14-prerelease-4/vllora-macos-x86_64"
      sha256 "00b098e85aea150aa6f7bfbd62a0e047a51a495496a28abc161714ab3ee38d8a"  # Run: shasum -a 256 ai-gateway-x86_64
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vllora/vllora/releases/download/v0.1.14-prerelease-4/vllora-linux-aarch64"
      sha256 "f2f30069acfdc1b3e132cd335184946f1ebc678b6450801315c8b76c6d54a41e"  # Will be updated by CI
    else
      url "https://github.com/vllora/vllora/releases/download/v0.1.14-prerelease-4/vllora-linux-x86_64"
      sha256 "8331dc91ad1261509f2c1666d5361aa8ed54fdaee0e9521ccd1a2256a1f7d327"  # Run: shasum -a 256 ai-gateway-x86_64
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
