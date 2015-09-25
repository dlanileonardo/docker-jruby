# `adocker` is alias to `azk docker`
all:
	# latest
	adocker build -t dlanileonardo/jruby ./9.0.0.0/jre

	# 1.7.20
	adocker build -t dlanileonardo/jruby ./1.7.20/jre

	# version tagged
	adocker build -t dlanileonardo/jruby:1.7-jdk ./1.7.20/jdk

--no-cache:
	# latest
	adocker build --rm --no-cache -t azukiapp/jruby ./1.7.20/jre

	# version tagged
	adocker build --rm --no-cache -t azukiapp/jruby:1.7-jdk ./1.7.20/jdk
