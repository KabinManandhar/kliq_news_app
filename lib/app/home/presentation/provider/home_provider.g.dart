// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$homeAPIServiceHash() => r'36605ce79162b093f6eaf306c94fd125123a4762';

/// See also [homeAPIService].
@ProviderFor(homeAPIService)
final homeAPIServiceProvider = AutoDisposeProvider<HomeApiService>.internal(
  homeAPIService,
  name: r'homeAPIServiceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$homeAPIServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef HomeAPIServiceRef = AutoDisposeProviderRef<HomeApiService>;
String _$homeRepositoryHash() => r'0306a19d64b9e094be13b1ba35836b96316def55';

/// See also [homeRepository].
@ProviderFor(homeRepository)
final homeRepositoryProvider = AutoDisposeProvider<IHomeRepository>.internal(
  homeRepository,
  name: r'homeRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$homeRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef HomeRepositoryRef = AutoDisposeProviderRef<IHomeRepository>;
String _$getNewsArticleUseCaseHash() =>
    r'b310a30b3f95710d011997b599fab543967a2f6e';

/// See also [getNewsArticleUseCase].
@ProviderFor(getNewsArticleUseCase)
final getNewsArticleUseCaseProvider =
    AutoDisposeProvider<GetLatestNewsArticlesUseCase>.internal(
  getNewsArticleUseCase,
  name: r'getNewsArticleUseCaseProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getNewsArticleUseCaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetNewsArticleUseCaseRef
    = AutoDisposeProviderRef<GetLatestNewsArticlesUseCase>;
String _$homeNotifierHash() => r'b9d3b0b84c93b1810de33315a514d779ba66fc69';

/// See also [HomeNotifier].
@ProviderFor(HomeNotifier)
final homeNotifierProvider = NotifierProvider<HomeNotifier, HomeState>.internal(
  HomeNotifier.new,
  name: r'homeNotifierProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$homeNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$HomeNotifier = Notifier<HomeState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
