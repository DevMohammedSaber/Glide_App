final List<ServiceModel> services = [
  ServiceModel(
    name: 'Compact',
    value: 'compact',
    beforePrice: '20 \$',
    afterPrice: '15 \$',
    time: '30 min',
    count: '2',
  ),
  ServiceModel(
    name: 'Luxury',
    value: 'luxury',
    beforePrice: '18 \$',
    afterPrice: '13 \$',
    time: '25 min',
    count: '4',
  ),
  ServiceModel(
    name: 'Van',
    value: 'van',
    beforePrice: '25 \$',
    afterPrice: '20 \$',
    time: '40 min',
    count: '3',
  ),
  ServiceModel(
    name: 'Mid Size',
    value: 'mid-size',
    beforePrice: '30 \$',
    afterPrice: '24 \$',
    time: '60 min',
    count: '1',
  ),
  ServiceModel(
    name: 'Full Size',
    value: 'full-size',
    beforePrice: '15 \$',
    afterPrice: '10 \$',
    time: '35 min',
    count: '5',
  ),
  ServiceModel(
    name: 'Suv',
    value: 'suv',
    beforePrice: '17 \$',
    afterPrice: '12 \$',
    time: '35 min',
    count: '3',
  ),
];

class ServiceModel {
  final String name;
  final String value;
  final String beforePrice;
  final String afterPrice;
  final String time;
  final String count;

  ServiceModel({
    required this.value,
    required this.name,
    required this.beforePrice,
    required this.afterPrice,
    required this.time,
    required this.count,
  });

  factory ServiceModel.fromMap(Map<String, dynamic> map) {
    return ServiceModel(
      name: map['service'],
      value: map['value'],
      beforePrice: map['beforePrice'],
      afterPrice: map['afterPrice'],
      time: map['time'],
      count: map['count'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'value': value,
      'service': name,
      'beforePrice': beforePrice,
      'afterPrice': afterPrice,
      'time': time,
      'count': count,
    };
  }
}
