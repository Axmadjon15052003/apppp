// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'katalog_bloc.dart';

class KatalogState {
  final List<KatalogEntities> tovar;
  final List<KatalogSecond> tovar2;
  final Status status;
  KatalogState({
    required this.tovar,
    required this.status,
    required this.tovar2
  });

  KatalogState copyWith({
    List<KatalogEntities>? tovar,
    List<KatalogSecond>? tovar2,
    Status? status,
  }) {
    return KatalogState(
      tovar: tovar ?? this.tovar,
      tovar2: tovar2 ?? this.tovar2,
      status: status ?? this.status,
    );
  }

  @override
  bool operator ==(covariant KatalogState other) {
    if (identical(this, other)) return true;
  
    return 
      listEquals(other.tovar, tovar) &&
      listEquals(other.tovar2, tovar2) &&
      other.status == status;
  }

  @override
  int get hashCode => tovar.hashCode ^ tovar2.hashCode ^ status.hashCode;

  @override
  String toString() => 'KatalogState(tovar: $tovar, tovar2: $tovar2, status: $status)';
}

enum Status {
  pure,
  loading,
  failure,
  succsess,
}
