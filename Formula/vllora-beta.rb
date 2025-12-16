class VlloraBeta < Formula
  desc "vllora - Multi-provider AI gateway server"
  homepage "https://github.com/vllora/vllora"
  version "0.1.19-prerelease-2"  # Update this with your version
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vllora/vllora/releases/download/v0.1.19-prerelease-2/vllora-macos-aarch64"
      sha256 "751e77c9072e9167e1235582f36997ceca8371ec60d8929b020a255ead0eeadd"  # Run: shasum -a 256 ai-gateway-aarch64
    else
      url "https://github.com/vllora/vllora/releases/download/v0.1.19-prerelease-2/vllora-macos-x86_64"
      sha256 "401ed0e9ec2cf02e781a5603a8a970216b18ec68e13237ef427392598b4971c9"  # Run: shasum -a 256 ai-gateway-x86_64
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vllora/vllora/releases/download/v0.1.19-prerelease-2/vllora-linux-aarch64"
      sha256 "68c7a6ccad02012cd9e5a174db3728a9381a07ea9b90d745d14a14dd179ab115"  # Will be updated by CI
    else
      url "https://github.com/vllora/vllora/releases/download/v0.1.19-prerelease-2/vllora-linux-x86_64"
      sha256 "3ab5a96ccca362c7253f0c9ae369feaf616af91e572e3266465b15c524301a56"  # Run: shasum -a 256 ai-gateway-x86_64
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
