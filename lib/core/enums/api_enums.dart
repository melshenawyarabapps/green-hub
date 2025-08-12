enum RequestStatus {
  initial,
  loading,
  loaded,
  error,
}

extension RequestStatusExtension on RequestStatus? {
  bool get isLoading => this == RequestStatus.loading;
  bool get isLoaded => this == RequestStatus.loaded;
  bool get isError => this == RequestStatus.error;
}
