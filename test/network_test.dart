import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:shopbox_pos/core/Helpers/Dio/dio_helper.dart';

import 'network_test.mocks.dart';

@GenerateMocks([Dio])
void main() {
  late MockDio mockDio;

  setUp(() {
    mockDio = MockDio();
    DioHelper.init();
    DioHelper.dio = mockDio; // Make sure you made `dio` public in DioHelper
  });

  group('DioHelper Tests', () {
    test('GET success', () async {
      final fakeResponse = Response(
        requestOptions: RequestOptions(path: '/test'),
        statusCode: 200,
        data: {'success': true},
      );

      when(mockDio.get(
        any,
        queryParameters: anyNamed('queryParameters'),
      )).thenAnswer((_) async => fakeResponse);

      final result = await DioHelper.get('/test');
      expect(result.statusCode, 200);
      expect(result.data['success'], true);
    });

    test('POST failure (500)', () async {
      when(mockDio.post(
        any,
        data: anyNamed('data'),
        queryParameters: anyNamed('queryParameters'),
      )).thenThrow(DioException(
        requestOptions: RequestOptions(path: '/test'),
        response: Response(
          requestOptions: RequestOptions(path: '/test'),
          statusCode: 500,
          data: {'error': 'Internal Server Error'},
        ),
        type: DioExceptionType.badResponse,
      ));

      final result = await DioHelper.post('/test', data: {'key': 'value'});
      expect(result.statusCode, 500);
      expect(result.data['error'], true);
    });

    test('PUT success', () async {
      final fakeResponse = Response(
        requestOptions: RequestOptions(path: '/update'),
        statusCode: 200,
        data: {'updated': true},
      );

      when(mockDio.put(
        any,
        data: anyNamed('data'),
        queryParameters: anyNamed('queryParameters'),
      )).thenAnswer((_) async => fakeResponse);

      final result = await DioHelper.put('/update', data: {'name': 'Test'});
      expect(result.statusCode, 200);
      expect(result.data['updated'], true);
    });

    test('DELETE timeout failure', () async {
      when(mockDio.delete(
        any,
        data: anyNamed('data'),
        queryParameters: anyNamed('queryParameters'),
      )).thenThrow(DioException(
        requestOptions: RequestOptions(path: '/delete'),
        type: DioExceptionType.connectionTimeout,
      ));

      final result = await DioHelper.delete('/delete');
      expect(result.statusCode, 500);
      expect(result.data['error'], true);
    });
  });
}