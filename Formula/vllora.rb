class Vllora < Formula
  desc "vllora - Multi-provider AI gateway server"
  homepage "https://github.com/vllora/vllora"
  version "0.1.20"  # Update this with your version
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vllora/vllora/releases/download/v0.1.20/vllora-macos-aarch64"
      sha256 "a92cb6db9e99b0088abb381c21cc8de5bb4a571c3b60c770c14d738fa2842b2a"  # Run: shasum -a 256 ai-gateway-aarch64
    else
      url "https://github.com/vllora/vllora/releases/download/v0.1.20/vllora-macos-x86_64"
      sha256 "fe952931300316f9ec34b56b70a82f3478c2f75124379d67a29f56e7670a8ae5"  # Run: shasum -a 256 ai-gateway-x86_64
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vllora/vllora/releases/download/v0.1.20/vllora-linux-aarch64"
      sha256 "e798687ca36fea4dad8d06e896ff4d70257721b6fa9403e69fe67386d40b143f"  # Will be updated by CI
    else
      url "https://github.com/vllora/vllora/releases/download/v0.1.20/vllora-linux-x86_64"
      sha256 "84470425d335dbdcb5db67384d6b262c37428eec5b905bddcf234efd80580e10"  # Run: shasum -a 256 ai-gateway-x86_64
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
