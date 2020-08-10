package pkg

import (
	"testing"

	"golang.org/x/crypto/ssh"
)

func Test_HandleChannels(t *testing.T) {
	type args struct {
		chans <-chan ssh.NewChannel
	}
	tests := []struct {
		name string
		args args
	}{
		// TODO: Add test cases.
	}
	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			HandleChannels(tt.args.chans)
		})
	}
}

func Test_handleChannel(t *testing.T) {
	type args struct {
		newChannel ssh.NewChannel
	}
	tests := []struct {
		name string
		args args
	}{
		// TODO: Add test cases.
	}
	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			handleChannel(tt.args.newChannel)
		})
	}
}

func Test_parseDims(t *testing.T) {
	type args struct {
		b []byte
	}
	tests := []struct {
		name  string
		args  args
		want  uint32
		want1 uint32
	}{
		// TODO: Add test cases.
	}
	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			got, got1 := parseDims(tt.args.b)
			if got != tt.want {
				t.Errorf("parseDims() got = %v, want %v", got, tt.want)
			}
			if got1 != tt.want1 {
				t.Errorf("parseDims() got1 = %v, want %v", got1, tt.want1)
			}
		})
	}
}

func TestSetWinsize(t *testing.T) {
	type args struct {
		fd uintptr
		w  uint32
		h  uint32
	}
	tests := []struct {
		name string
		args args
	}{
		// TODO: Add test cases.
	}
	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			SetWinsize(tt.args.fd, tt.args.w, tt.args.h)
		})
	}
}
