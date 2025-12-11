class VlloraBeta < Formula
  desc "vllora - Multi-provider AI gateway server"
  homepage "https://github.com/vllora/vllora"
  version "0.1.16-prerelease-1"  # Update this with your version
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vllora/vllora/releases/download/v0.1.16-prerelease-1/vllora-macos-aarch64"
      sha256 "d8020aabdd5dd363f8694b14d43e02de5dd70ea13abeef843d5924409cefac3b"  # Run: shasum -a 256 ai-gateway-aarch64
    else
      url "https://github.com/vllora/vllora/releases/download/v0.1.16-prerelease-1/vllora-macos-x86_64"
      sha256 "c846bd53c374f1dfa3ea354cf27e92bed5372303509ff510682b06f070efda4c"  # Run: shasum -a 256 ai-gateway-x86_64
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vllora/vllora/releases/download/v0.1.16-prerelease-1/vllora-linux-aarch64"
      sha256 "1de93fc2313f527497b56c6a6e5e7a57a980483d8977d93407688c096182986f"  # Will be updated by CI
    else
      url "https://github.com/vllora/vllora/releases/download/v0.1.16-prerelease-1/vllora-linux-x86_64"
      sha256 "a52e360e31adaafe3c636468173749d264bf2813f115b695f03788ad35e259d9"  # Run: shasum -a 256 ai-gateway-x86_64
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
