class HeaderNotification {
  int? id;
  int? userId;
  String? topic;
  String? message;
  Map<String, dynamic>? metadata;
  String? createdAt;
  String? updatedAt;
  bool? read;

  HeaderNotification({
    this.id,
    this.userId,
    this.topic,
    this.message,
    this.metadata,
    this.createdAt,
    this.updatedAt,
    this.read,
  });

  HeaderNotification copyWith({
    int? id,
    int? userId,
    String? topic,
    String? message,
    Map<String, dynamic>? metadata,
    String? createdAt,
    String? updatedAt,
    bool? read,
  }) {
    return HeaderNotification(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      topic: topic ?? this.topic,
      message: message ?? this.message,
      metadata: metadata ?? this.metadata,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      read: read ?? this.read,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'userId': userId,
      'topic': topic,
      'message': message,
      'metadata': metadata,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'read': read,
    };
  }

  factory HeaderNotification.fromJson(Map<String, dynamic> map) {
    return HeaderNotification(
      id: map['id'] != null ? map['id'] as int : null,
      userId: map['userId'] != null ? map['userId'] as int : null,
      topic: map['topic'] != null ? map['topic'] as String : null,
      message: map['message'] != null ? map['message'] as String : null,
      metadata: map['metadata'] != null
          ? Map<String, dynamic>.from((map['metadata'] as Map<String, dynamic>))
          : null,
      createdAt: map['createdAt'] != null ? map['createdAt'] as String : null,
      updatedAt: map['updatedAt'] != null ? map['updatedAt'] as String : null,
      read: map['read'] != null ? map['read'] as bool : null,
    );
  }

  @override
  String toString() {
    return 'HeaderNotification(id: $id, userId: $userId, topic: $topic, message: $message, metadata: $metadata, createdAt: $createdAt, updatedAt: $updatedAt, read: $read)';
  }
}
