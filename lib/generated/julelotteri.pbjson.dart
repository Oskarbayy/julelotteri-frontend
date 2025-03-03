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
    {'1': 'id', '3': 1, '4': 1, '5': 3, '10': 'id'},
    {'1': 'number', '3': 2, '4': 1, '5': 5, '10': 'number'},
    {'1': 'name', '3': 3, '4': 1, '5': 9, '10': 'name'},
    {'1': 'won', '3': 4, '4': 1, '5': 8, '10': 'won'},
  ],
};

/// Descriptor for `Player`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List playerDescriptor = $convert.base64Decode(
    'CgZQbGF5ZXISDgoCaWQYASABKANSAmlkEhYKBm51bWJlchgCIAEoBVIGbnVtYmVyEhIKBG5hbW'
    'UYAyABKAlSBG5hbWUSEAoDd29uGAQgASgIUgN3b24=');

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

@$core.Deprecated('Use importExcelFileRequestDescriptor instead')
const ImportExcelFileRequest$json = {
  '1': 'ImportExcelFileRequest',
  '2': [
    {'1': 'file_data', '3': 1, '4': 1, '5': 12, '10': 'fileData'},
  ],
};

/// Descriptor for `ImportExcelFileRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List importExcelFileRequestDescriptor = $convert.base64Decode(
    'ChZJbXBvcnRFeGNlbEZpbGVSZXF1ZXN0EhsKCWZpbGVfZGF0YRgBIAEoDFIIZmlsZURhdGE=');

@$core.Deprecated('Use importExcelFileResponseDescriptor instead')
const ImportExcelFileResponse$json = {
  '1': 'ImportExcelFileResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
  ],
};

/// Descriptor for `ImportExcelFileResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List importExcelFileResponseDescriptor = $convert.base64Decode(
    'ChdJbXBvcnRFeGNlbEZpbGVSZXNwb25zZRIYCgdzdWNjZXNzGAEgASgIUgdzdWNjZXNz');

