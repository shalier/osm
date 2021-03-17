package main

import (
	"testing"

	. "github.com/onsi/ginkgo"
	. "github.com/onsi/gomega"
)

//abra
func TestADSMain(t *testing.T) {
	RegisterFailHandler(Fail)
	RunSpecs(t, "ADSMain Test Suite")
}
