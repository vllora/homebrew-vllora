class Vllora < Formula
  desc "vllora - Multi-provider AI gateway server"
  homepage "https://github.com/vllora/vllora"
  version "0.1.22"  # Update this with your version
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vllora/vllora/releases/download/v0.1.22/vllora-macos-aarch64"
      sha256 "7d9aaa62ca41eae25981afc50e895afb0a1bbc0dae5f1341c17eda1605b262bc"  # Run: shasum -a 256 ai-gateway-aarch64
    else
      url "https://github.com/vllora/vllora/releases/download/v0.1.22/vllora-macos-x86_64"
      sha256 "a0efff8337080e36343cf85a450289a9602367b8327517129e88152d47d04405"  # Run: shasum -a 256 ai-gateway-x86_64
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vllora/vllora/releases/download/v0.1.22/vllora-linux-aarch64"
      sha256 "8528feddd6ee2e29817c6b693b012240b862c898591966175351d849bb117c0a"  # Will be updated by CI
    else
      url "https://github.com/vllora/vllora/releases/download/v0.1.22/vllora-linux-x86_64"
      sha256 "fab8e45145f1be9bfa5586a10cbd02da2e40934223ddfcb9dcb19254d9a10fbf"  # Run: shasum -a 256 ai-gateway-x86_64
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
