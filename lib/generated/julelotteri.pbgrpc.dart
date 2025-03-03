//
//  Generated code. Do not modify.
//  source: julelotteri.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'package:protobuf/protobuf.dart' as $pb;

import 'google/protobuf/empty.pb.dart' as $0;
import 'julelotteri.pb.dart' as $1;

export 'julelotteri.pb.dart';

@$pb.GrpcServiceName('julelotteri.LotteriService')
class LotteriServiceClient extends $grpc.Client {
  static final _$getWinner = $grpc.ClientMethod<$0.Empty, $1.Player>(
      '/julelotteri.LotteriService/GetWinner',
      ($0.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Player.fromBuffer(value));
  static final _$getPlayers = $grpc.ClientMethod<$0.Empty, $1.PlayerList>(
      '/julelotteri.LotteriService/GetPlayers',
      ($0.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.PlayerList.fromBuffer(value));
  static final _$importExcelFile = $grpc.ClientMethod<$1.ImportExcelFileRequest, $1.ImportExcelFileResponse>(
      '/julelotteri.LotteriService/ImportExcelFile',
      ($1.ImportExcelFileRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.ImportExcelFileResponse.fromBuffer(value));

  LotteriServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$1.Player> getWinner($0.Empty request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getWinner, request, options: options);
  }

  $grpc.ResponseFuture<$1.PlayerList> getPlayers($0.Empty request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getPlayers, request, options: options);
  }

  $grpc.ResponseFuture<$1.ImportExcelFileResponse> importExcelFile($1.ImportExcelFileRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$importExcelFile, request, options: options);
  }
}

@$pb.GrpcServiceName('julelotteri.LotteriService')
abstract class LotteriServiceBase extends $grpc.Service {
  $core.String get $name => 'julelotteri.LotteriService';

  LotteriServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.Empty, $1.Player>(
        'GetWinner',
        getWinner_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($1.Player value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Empty, $1.PlayerList>(
        'GetPlayers',
        getPlayers_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($1.PlayerList value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.ImportExcelFileRequest, $1.ImportExcelFileResponse>(
        'ImportExcelFile',
        importExcelFile_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.ImportExcelFileRequest.fromBuffer(value),
        ($1.ImportExcelFileResponse value) => value.writeToBuffer()));
  }

  $async.Future<$1.Player> getWinner_Pre($grpc.ServiceCall call, $async.Future<$0.Empty> request) async {
    return getWinner(call, await request);
  }

  $async.Future<$1.PlayerList> getPlayers_Pre($grpc.ServiceCall call, $async.Future<$0.Empty> request) async {
    return getPlayers(call, await request);
  }

  $async.Future<$1.ImportExcelFileResponse> importExcelFile_Pre($grpc.ServiceCall call, $async.Future<$1.ImportExcelFileRequest> request) async {
    return importExcelFile(call, await request);
  }

  $async.Future<$1.Player> getWinner($grpc.ServiceCall call, $0.Empty request);
  $async.Future<$1.PlayerList> getPlayers($grpc.ServiceCall call, $0.Empty request);
  $async.Future<$1.ImportExcelFileResponse> importExcelFile($grpc.ServiceCall call, $1.ImportExcelFileRequest request);
}
