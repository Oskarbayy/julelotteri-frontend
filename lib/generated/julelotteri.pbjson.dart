//
//  Generated code. Do not modify.
//  source: julelotteri.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use playerDescriptor instead')
const Player$json = {
  '1': 'Player',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
  ],
};

/// Descriptor for `Player`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List playerDescriptor = $convert.base64Decode(
    'CgZQbGF5ZXISDgoCaWQYASABKAVSAmlkEhIKBG5hbWUYAiABKAlSBG5hbWU=');

@$core.Deprecated('Use playerListDescriptor instead')
const PlayerList$json = {
  '1': 'PlayerList',
  '2': [
    {'1': 'players', '3': 1, '4': 3, '5': 11, '6': '.julelotteri.Player', '10': 'players'},
  ],
};

/// Descriptor for `PlayerList`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List playerListDescriptor = $convert.base64Decode(
    'CgpQbGF5ZXJMaXN0Ei0KB3BsYXllcnMYASADKAsyEy5qdWxlbG90dGVyaS5QbGF5ZXJSB3BsYX'
    'llcnM=');

