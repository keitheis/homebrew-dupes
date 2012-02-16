require 'formula'

class Perl < Formula
  url 'http://www.cpan.org/src/5.0/perl-5.14.2.tar.gz'
  homepage 'http://www.perl.org/'
  md5 '3306fbaf976dcebdcd49b2ac0be00eb9'

  def options
    [['--use-threads', 'Enable perl threads']]
  end

  def threads?
      ARGV.include? '--use-threads'
  end

  def install
    system("rm -f config.sh Policy.sh")
    args = [
        '-des',
        "-Dprefix=#{prefix}",
        "-Dman1dir=#{prefix}/share/man/man1",
        "-Dman3dir=#{prefix}/share/man/man3",
        '-Duseshrplib',
        '-Duselargefiles',
    ]
    if threads?
        args << '-Dusethreads'
    end
    system './Configure', *args
    system "make"
    system "make test"
    system "make install"
  end

  def caveats; <<-EOS.undent
      Builds without threads by default.  Use --use-threads to build with
      threads.
      EOS
  end
end
