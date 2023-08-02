import 'package:flutter_riverpod/flutter_riverpod.dart';

final StateNotifierProvider<LoadingNotifier, bool> loadingStateProvider =
    StateNotifierProvider<LoadingNotifier, bool>((ref) {
  return LoadingNotifier();
});

class LoadingNotifier extends StateNotifier<bool> {
  LoadingNotifier() : super(false);

  void setLoading(bool isLoading) {
    state = isLoading;
  }
}
