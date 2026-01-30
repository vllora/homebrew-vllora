class Vllora < Formula
  desc "vllora - Multi-provider AI gateway server"
  homepage "https://github.com/vllora/vllora"
  version "0.1.23"  # Update this with your version
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vllora/vllora/releases/download/v0.1.23/vllora-macos-aarch64"
      sha256 "5c17485e3e06612ea716f3782673d882e28c9115f053802ad9a2fb6d06a0430f"  # Run: shasum -a 256 ai-gateway-aarch64
    else
      url "https://github.com/vllora/vllora/releases/download/v0.1.23/vllora-macos-x86_64"
      sha256 "d34c69d2f92a1675aa89168c8828dda9220c73f84a68bcde03768b76a4c37ac3"  # Run: shasum -a 256 ai-gateway-x86_64
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vllora/vllora/releases/download/v0.1.23/vllora-linux-aarch64"
      sha256 "1f4c9423812f9d34ff739866bdeff71750af31a25a5b2cac9e8d308bbd1d2606"  # Will be updated by CI
    else
      url "https://github.com/vllora/vllora/releases/download/v0.1.23/vllora-linux-x86_64"
      sha256 "b6e35c7d8c966e55de068933f0e420b2678c120c0cb40f9477dbf61eb7f2f0cc"  # Run: shasum -a 256 ai-gateway-x86_64
    end
  end
  def install
    if OS.mac?
      if Hardware::CPU.arm?
        bin.install "vllora-macos-aarch64" => "vllora"
      else
        bin.install "vllora-macos-x86_64" => "vllora"
      end
    elsif OS.linux?
      if Hardware::CPU.arm?
        bin.install "vllora-linux-aarch64" => "vllora"
      else
        bin.install "vllora-linux-x86_64" => "vllora"
      end
    end
  end
  def caveats
    # <<~EOS
    #   Server is running on port 8080 and UI can be accessed at http://localhost:8084
    # EOS
  end
  test do
    system "#{bin}/vllora", "--version"
  end
end
