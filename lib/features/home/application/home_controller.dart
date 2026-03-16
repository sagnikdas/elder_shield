import 'package:elder_shield/application/app_providers.dart';
import 'package:elder_shield/features/messages/data/message_repository.dart';
import 'package:elder_shield/features/settings/data/settings_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Controller for Home screen specific state and one-off logic.
class HomeController extends AutoDisposeAsyncNotifier<HomeState> {
  @override
  Future<HomeState> build() async {
    final settings = ref.read(settingsServiceProvider);
    final repo = ref.read(messageRepositoryProvider);

    final trustedContacts = await settings.getTrustedContacts();
    final todayRiskCount = await repo.fetchTodayRiskCount();

    return HomeState(
      trustedContacts: trustedContacts,
      todayRiskCount: todayRiskCount,
    );
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(build);
  }
}

class HomeState {
  const HomeState({
    required this.trustedContacts,
    required this.todayRiskCount,
  });

  final List<TrustedContact> trustedContacts;
  final int todayRiskCount;
}

final homeControllerProvider =
    AutoDisposeAsyncNotifierProvider<HomeController, HomeState>(
  HomeController.new,
);

