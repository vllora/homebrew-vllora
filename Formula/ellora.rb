class Ellora < Formula
    desc "Ellora - Multi-provider AI gateway server"
    homepage "https://github.com/langdb/ellora"
    version "0.4.0-prerelease-5"  # Update this with your version

    on_macos do
      if Hardware::CPU.arm?
        url "https://github.com/langdb/ai-gateway/releases/download/v0.4.0-prerelease-5/ai-gateway-macos-aarch64"
        sha256 "b77713bfc7780ab631e6a266eb31566ebde54a41da74d05f80fa7036da8ea153"  # Run: shasum -a 256 ai-gateway-aarch64  
      else
        url "https://github.com/langdb/ai-gateway/releases/download/v0.4.0-prerelease-5/ai-gateway-macos-x86_64"
        sha256 "4d54c68a40baaed38d05d6024c08575564a45d57ba89bd6aef5e6d91efab28c2"  # Run: shasum -a 256 ai-gateway-x86_64
      end
    end

    on_linux do
    #   if Hardware::CPU.arm?
    #     url "https://github.com/langdb/ai-gateway/releases/download/v0.3.2/ai-gateway-linux-aarch64"
    #     sha256 "f9dbe7dfbe1f7a6a817f0d3a674d54ad07062496e5753106d42d916ef450b7b2"  # Run: shasum -a 256 ai-gateway-aarch64
    #   else
    url "https://github.com/langdb/ai-gateway/releases/download/v0.4.0-prerelease-5/ai-gateway-linux-x86_64"
    sha256 "7471db2ebf26d8ece206123e0e472e5964300df98b3483c5e8e73add0af9e755"  # Run: shasum -a 256 ai-gateway-x86_64
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