// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ReportType {
  int? reportTypeId;
  String? reportName;
  bool? isDeleted;
  ReportType({
    this.reportTypeId,
    this.reportName,
    this.isDeleted,
  });

  ReportType copyWith({
    int? reportTypeId,
    String? reportName,
    bool? isDeleted,
  }) {
    return ReportType(
      reportTypeId: reportTypeId ?? this.reportTypeId,
      reportName: reportName ?? this.reportName,
      isDeleted: isDeleted ?? this.isDeleted,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'reportTypeId': reportTypeId,
      'reportName': reportName,
      'isDeleted': isDeleted,
    };
  }

  factory ReportType.fromMap(Map<String, dynamic> map) {
    return ReportType(
      reportTypeId:
          map['reportTypeId'] != null ? map['reportTypeId'] as int : null,
      reportName:
          map['reportName'] != null ? map['reportName'] as String : null,
      isDeleted: map['isDeleted'] != null ? map['isDeleted'] as bool : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ReportType.fromJson(String source) =>
      ReportType.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'ReportType(reportTypeId: $reportTypeId, reportName: $reportName, isDeleted: $isDeleted)';

  @override
  bool operator ==(covariant ReportType other) {
    if (identical(this, other)) return true;

    return other.reportTypeId == reportTypeId &&
        other.reportName == reportName &&
        other.isDeleted == isDeleted;
  }

  @override
  int get hashCode =>
      reportTypeId.hashCode ^ reportName.hashCode ^ isDeleted.hashCode;
}
