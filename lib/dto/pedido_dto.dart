class PedidoDto {
  final String? fechaPedido;
  final double? subtotal;
  final int? cantidad;
  final String? ciUsuario;
  final String? fechaEntrega;

  // Constructor
  PedidoDto(
      {required this.fechaPedido,
      required this.subtotal,
      required this.cantidad,
      required this.ciUsuario,
      required this.fechaEntrega});

  factory PedidoDto.fromJson(Map<String, dynamic> json) {
    return PedidoDto(
      fechaPedido: json['fechaPedido'],
      subtotal: json['subtotal'],
      cantidad: json['cantidad'],
      ciUsuario: json['ciUsuario'],
      fechaEntrega: json['fechaEntrega'],
    );
  }
}
