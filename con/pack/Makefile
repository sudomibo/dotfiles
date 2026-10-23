SHELL=/usr/bin/bash
PM=/usr/bin/podman
NAME=pack

build:
	$(PM) build . --tag $(NAME)

run:
	$(PM) run --label $(NAME) -d $(NAME)

ps:
	$(PM) ps -q --filter "label=$(NAME)"

login:
	$(PM) exec -it $(shell $(PM) ps -q -n 1 --filter "label=$(NAME)") /bin/bash -l

clean:
	$(PM) rm -f $(shell $(PM) ps -q -n 1 --filter "label=$(NAME)")

