// Package proto holds the protobuf and corresponding generated code for the runtime service
//
//go:generate protoc -I . --go_out=. --go-grpc_out=. runtime.proto
package proto
