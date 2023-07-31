// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Report {
  int? reportId;
  String? reportName;
  String? reportDescription;
  DateTime? madeAt;
  int? reportTypeId;
  int? userId;
  int? adminId;
  String? reportAnswer;
  DateTime? answeredAt;
  bool? isDeleted;
  Report({
    this.reportId,
    this.reportName,
    this.reportDescription,
    this.madeAt,
    this.reportTypeId,
    this.userId,
    this.adminId,
    this.reportAnswer,
    this.answeredAt,
    this.isDeleted,
  });

  Report copyWith({
    int? reportId,
    String? reportName,
    String? reportDescription,
    DateTime? madeAt,
    int? reportTypeId,
    int? userId,
    int? adminId,
    String? reportAnswer,
    DateTime? answeredAt,
    bool? isDeleted,
  }) {
    return Report(
      reportId: reportId ?? this.reportId,
      reportName: reportName ?? this.reportName,
      reportDescription: reportDescription ?? this.reportDescription,
      madeAt: madeAt ?? this.madeAt,
      reportTypeId: reportTypeId ?? this.reportTypeId,
      userId: userId ?? this.userId,
      adminId: adminId ?? this.adminId,
      reportAnswer: reportAnswer ?? this.reportAnswer,
      answeredAt: answeredAt ?? this.answeredAt,
      isDeleted: isDeleted ?? this.isDeleted,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'reportId': reportId,
      'reportName': reportName,
      'reportDescription': reportDescription,
      'madeAt': madeAt?.millisecondsSinceEpoch,
      'reportTypeId': reportTypeId,
      'userId': userId,
      'adminId': adminId,
      'reportAnswer': reportAnswer,
      'answeredAt': answeredAt?.millisecondsSinceEpoch,
      'isDeleted': isDeleted,
    };
  }

  factory Report.fromMap(Map<String, dynamic> map) {
    return Report(
      reportId: map['reportId'] != null ? map['reportId'] as int : null,
      reportName:
          map['reportName'] != null ? map['reportName'] as String : null,
      reportDescription: map['reportDescription'] != null
          ? map['reportDescription'] as String
          : null,
      madeAt: map['madeAt'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['madeAt'] as int)
          : null,
      reportTypeId:
          map['reportTypeId'] != null ? map['reportTypeId'] as int : null,
      userId: map['userId'] != null ? map['userId'] as int : null,
      adminId: map['adminId'] != null ? map['adminId'] as int : null,
      reportAnswer:
          map['reportAnswer'] != null ? map['reportAnswer'] as String : null,
      answeredAt: map['answeredAt'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['answeredAt'] as int)
          : null,
      isDeleted: map['isDeleted'] != null ? map['isDeleted'] as bool : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Report.fromJson(String source) =>
      Report.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Report(reportId: $reportId, reportName: $reportName, reportDescription: $reportDescription, madeAt: $madeAt, reportTypeId: $reportTypeId, userId: $userId, adminId: $adminId, reportAnswer: $reportAnswer, answeredAt: $answeredAt, isDeleted: $isDeleted)';
  }

  @override
  bool operator ==(covariant Report other) {
    if (identical(this, other)) return true;

    return other.reportId == reportId &&
        other.reportName == reportName &&
        other.reportDescription == reportDescription &&
        other.madeAt == madeAt &&
        other.reportTypeId == reportTypeId &&
        other.userId == userId &&
        other.adminId == adminId &&
        other.reportAnswer == reportAnswer &&
        other.answeredAt == answeredAt &&
        other.isDeleted == isDeleted;
  }

  @override
  int get hashCode {
    return reportId.hashCode ^
        reportName.hashCode ^
        reportDescription.hashCode ^
        madeAt.hashCode ^
        reportTypeId.hashCode ^
        userId.hashCode ^
        adminId.hashCode ^
        reportAnswer.hashCode ^
        answeredAt.hashCode ^
        isDeleted.hashCode;
  }
}
