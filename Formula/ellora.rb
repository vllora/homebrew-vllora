class Ellora < Formula
    desc "Ellora - Multi-provider AI gateway server"
    homepage "https://github.com/langdb/ellora"
    version "0.4.0-prerelease-5"  # Update this with your version

    on_macos do
      if Hardware::CPU.arm?
        url "https://github.com/langdb/ai-gateway/releases/download/v0.4.0-prerelease-7/ai-gateway-macos-aarch64"
        sha256 "4732eec74d2511f554069240f836c3bd3fe12a6ae7c229c5c162f679f95a34e6"  # Run: shasum -a 256 ai-gateway-aarch64  
      else
        url "https://github.com/langdb/ai-gateway/releases/download/v0.4.0-prerelease-7/ai-gateway-macos-x86_64"
        sha256 "5708f242fbb06bd19524f5bb0c4e9a3089e61eea636549d435e173d068c9a231"  # Run: shasum -a 256 ai-gateway-x86_64
      end
    end

    on_linux do
    #   if Hardware::CPU.arm?
    #     url "https://github.com/langdb/ai-gateway/releases/download/v0.3.2/ai-gateway-linux-aarch64"
    #     sha256 "f9dbe7dfbe1f7a6a817f0d3a674d54ad07062496e5753106d42d916ef450b7b2"  # Run: shasum -a 256 ai-gateway-aarch64
    #   else
    url "https://github.com/langdb/ai-gateway/releases/download/v0.4.0-prerelease-7/ai-gateway-linux-x86_64"
    sha256 "f0946cc903e840b5b306ccd1788ae516f8f00870bc6ef5246fb027c449b9c227"  # Run: shasum -a 256 ai-gateway-x86_64
    #   end
    end

    def install
      if OS.mac?
        if Hardware::CPU.arm?
          bin.install "ai-gateway-macos-aarch64" => "ellora"
        else
          bin.install "ai-gateway-macos-x86_64" => "ellora"
        end
      elsif OS.linux?
        bin.install "ai-gateway-linux-x86_64" => "ellora"
      end
    end

    def caveats
      <<~EOS
        After starting, server will be running on port http://localhost:8080 and UI can be accessed at http://localhost:8084
      EOS
    end

    test do
      system "#{bin}/ai-gateway", "--version"
    end
  end