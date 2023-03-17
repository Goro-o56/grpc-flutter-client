///
//  Generated code. Do not modify.
//  source: example.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'example.pb.dart' as $0;
export 'example.pb.dart';

class StringServiceClient extends $grpc.Client {
  static final _$processStrings =
      $grpc.ClientMethod<$0.StringArray, $0.StringResult>(
          '/example.StringService/ProcessStrings',
          ($0.StringArray value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.StringResult.fromBuffer(value));

  StringServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.StringResult> processStrings($0.StringArray request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$processStrings, request, options: options);
  }
}

abstract class StringServiceBase extends $grpc.Service {
  $core.String get $name => 'example.StringService';

  StringServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.StringArray, $0.StringResult>(
        'ProcessStrings',
        processStrings_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.StringArray.fromBuffer(value),
        ($0.StringResult value) => value.writeToBuffer()));
  }

  $async.Future<$0.StringResult> processStrings_Pre(
      $grpc.ServiceCall call, $async.Future<$0.StringArray> request) async {
    return processStrings(call, await request);
  }

  $async.Future<$0.StringResult> processStrings(
      $grpc.ServiceCall call, $0.StringArray request);
}
