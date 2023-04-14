PREFIX ?= /usr/local

default:
	cat laniakea-trusted | xargs -I '{}' echo '{}' | sed 's/:.*//' > keys.txt
	cat keys.txt | xargs gpg --receive-keys
	cat keys.txt | xargs gpg  --export --armor > laniakea.gpg

install:
	install -Dm 644 laniakea-trusted -t $(DESTDIR)/$(PREFIX)/share/pacman/keyrings/
	install -Dm 644 laniakea.gpg -t $(DESTDIR)/$(PREFIX)/share/pacman/keyrings/

clean:
	rm -f keys.txt
	rm -f laniakea.gpg
