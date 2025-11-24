class VlloraBeta < Formula
  desc "vllora - Multi-provider AI gateway server"
  homepage "https://github.com/vllora/vllora"
  version "0.1.10-prerelease-3"  # Update this with your version
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vllora/vllora/releases/download/v0.1.10-prerelease-3/vllora-macos-aarch64"
      sha256 "ecbd5a993266264f8b67f669c01139e0d568df0f3c72bbef1eaf2d7b00e4b5cc"  # Run: shasum -a 256 ai-gateway-aarch64
    else
      url "https://github.com/vllora/vllora/releases/download/v0.1.10-prerelease-3/vllora-macos-x86_64"
      sha256 "82331e50319e3e20f3bb59b1935018e34f2482e1a5f4239e56051974b5aa9622"  # Run: shasum -a 256 ai-gateway-x86_64
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vllora/vllora/releases/download/v0.1.10-prerelease-3/vllora-linux-aarch64"
      sha256 "526b30e543d4367b44491a4f5df2817c50faf063eb3438df1fd53396f426a23f"  # Will be updated by CI
    else
      url "https://github.com/vllora/vllora/releases/download/v0.1.10-prerelease-3/vllora-linux-x86_64"
      sha256 "2256156af7ca9642123e000ea16ea3284a2ab5a30bf4c6071b89b185d4640f44"  # Run: shasum -a 256 ai-gateway-x86_64
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
