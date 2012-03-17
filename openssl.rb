require 'formula'

class Openssl < Formula
  homepage 'http://www.openssl.org'
  url 'http://www.openssl.org/source/openssl-1.0.1.tar.gz'
  sha1 'a6476d33fd38c2e7dfb438d1e3be178cc242c907'

  keg_only :provided_by_osx,
    "The OpenSSL provided by Leopard (0.9.7) is too old for some software."

  def install
    system "./config", "--prefix=#{prefix}",
                       "--openssldir=#{etc}/openssl",
                       "zlib-dynamic",
                       "shared"
    ENV.deparallelize # Parallel compilation fails
    system "make"
    system "make test"
    system "make", "MANDIR=#{man}", "MANSUFFIX=ssl", "install"
  end

  def caveats; <<-EOS.undent
    Note that the libraries built tend to be 32-bit only, even on 64-bit
    capable platforms.
    EOS
  end
end
