///Clase para establecer la estructura de las respuestas del servidor Backend
class ResponseDto<T> {
  final T? data;
  final String? message;
  final bool success;

  ResponseDto({this.data, this.message = '', this.success = false});

  factory ResponseDto.fromJson(Map<String, dynamic> json) {
    return ResponseDto(
      data: json['data'],
      message: json['message'],
      success: json['success'],
    );
  }
}
