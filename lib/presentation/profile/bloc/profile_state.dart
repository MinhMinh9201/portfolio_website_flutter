import 'package:equatable/equatable.dart';

class ProfileState extends Equatable {
  const ProfileState();
  @override
  List<Object> get props => [];
}

class ProfileLoading extends ProfileState {}

class ProfileLoaded extends ProfileState {
  final bool isCanEdit;
  final bool isEditing;
  final bool isSubmitting;
  final bool isSuccess;
  final bool isFailure;

  ProfileLoaded(
      {this.isEditing,
      this.isFailure,
      this.isSubmitting,
      this.isSuccess,
      this.isCanEdit});

  factory ProfileLoaded.viewing({bool isCanEdit}) {
    return ProfileLoaded(isEditing: false, isCanEdit: isCanEdit);
  }

  factory ProfileLoaded.editing({bool isCanEdit}) {
    return ProfileLoaded(isEditing: true, isCanEdit: isCanEdit);
  }

  factory ProfileLoaded.failure({String message}) {
    return ProfileLoaded(isFailure: true);
  }

  factory ProfileLoaded.success() {
    return ProfileLoaded(isSuccess: true);
  }

  ProfileLoaded update(
      {bool isSubmitting, bool isSuccess, bool isEditing, bool isFailure}) {
    return copyWith(
        isEditing: isEditing,
        isSubmitting: isSubmitting,
        isSuccess: isSuccess,
        isFailure: isFailure);
  }

  ProfileLoaded copyWith(
      {bool isSubmitting,
      bool isSuccess,
      bool isEditing,
      bool isFailure,
      bool isCanEdit}) {
    return ProfileLoaded(
        isCanEdit: isCanEdit ?? this.isCanEdit,
        isEditing: isEditing ?? this.isEditing,
        isSubmitting: isSubmitting ?? this.isSubmitting,
        isSuccess: isSuccess ?? this.isSuccess,
        isFailure: isFailure ?? this.isFailure);
  }
}
