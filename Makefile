CI_COMMIT_TAG ?= $(shell git describe --tags)
CI_COMMIT_SHA ?= $(shell git rev-parse HEAD)
DATE = $(shell date '+%b %_d %Y, %H:%M:%S')

GO_LDFLAGS += -X main.Tag=$(CI_COMMIT_TAG) -X main.Commit=$(CI_COMMIT_SHA) -X 'main.BuildTime=$(DATE)'

BIN = gomuks

.PHONY: all
all:
	go build $(GOFLAGS) -ldflags "$(GO_LDFLAGS)" -o $(BIN)

.PHONY: install
install:
	go install $(GOFLAGS) -ldflags "$(GO_LDFLAGS)"
