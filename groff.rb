require 'formula'

class Groff < Formula
  homepage 'http://www.gnu.org/software/groff/'
  url 'http://ftpmirror.gnu.org/groff/groff-1.21.tar.gz'
  mirror 'http://ftp.gnu.org/gnu/groff/groff-1.21.tar.gz'
  md5 '8b8cd29385b97616a0f0d96d0951c5bf'

  def install
    system "./configure", "--prefix=#{prefix}", "--without-x"
    system "make install"
  end
end
