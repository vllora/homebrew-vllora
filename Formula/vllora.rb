class Vllora < Formula
  desc "vllora - Multi-provider AI gateway server"
  homepage "https://github.com/vllora/vllora"
  version "0.1.12"  # Update this with your version
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vllora/vllora/releases/download/v0.1.12/vllora-macos-aarch64"
      sha256 "edd491c5e7ec3c6c0800d7d58bda64c99c17f2f48e54d8bba2b3f362dea3d4ba"  # Run: shasum -a 256 ai-gateway-aarch64
    else
      url "https://github.com/vllora/vllora/releases/download/v0.1.12/vllora-macos-x86_64"
      sha256 "2e9a3be96d2f5586459edeff2f6dc8193040aa6aadfe1e0c865d048f8eb2254a"  # Run: shasum -a 256 ai-gateway-x86_64
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vllora/vllora/releases/download/v0.1.12/vllora-linux-aarch64"
      sha256 "1f11128823e376118c79f8a6b0232f4a66465f9e094b383b974d3082da845854"  # Will be updated by CI
    else
      url "https://github.com/vllora/vllora/releases/download/v0.1.12/vllora-linux-x86_64"
      sha256 "f29d84a79c4660eecb01a09ede09d34b0e29060087d9fd8e2dc7f27016bab277"  # Run: shasum -a 256 ai-gateway-x86_64
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
