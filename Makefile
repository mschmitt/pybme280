all:
	virtualenv --activators bash --system-site-packages .
	bin/pip3 install -U meteocalc
