import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shopbox_pos/core/Helpers/network_helper/network_helper.dart';
import 'package:shopbox_pos/core/constants/app_settings.dart';
import 'package:shopbox_pos/features/products/domain/models/productsResponse/products_response.dart';
import 'package:shopbox_pos/features/products/domain/usecases/products/get_products_usecase.dart';
import 'package:shopbox_pos/features/products/presentation/controller/products_page_state.dart';
import 'package:shopbox_pos/utils/utils.dart';

part 'products_page_controller.g.dart';

@riverpod
class ProductsPageController extends _$ProductsPageController {
  @override
  FutureOr<ProductsPageState> build({
    required ScrollController scrollController,
  }) async {
    listenSelf((previous, next) {
      Utils.handlePagination(
        controller: scrollController,
        call: () async {
          loadMoreProducts();
        },
      );
    });
    // Check internet connection
    initNetworkConnectionProvider();

    final result = await _getProductsData();
    if (result != null) {
      final isConnected = await ref.read(networkHelperProvider).isConnected;
      state = AsyncData(
        ProductsPageState(
          connectedToNetwork: isConnected,
          isPaginating: false,
          limit: result.limit ?? AppSettings.defaultPageLimit,
          skip: result.skip ?? 0,
          products: result.products ?? [],
          hasMoreProducts: result.products?.isNotEmpty ?? false,
          total: result.total ?? 0,
        ),
      );
    } else {
      state = AsyncError('Something went wrong', StackTrace.current);
    }
    return state.requireValue;
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    final result = await _getProductsData();
    if (result != null) {
      state = AsyncData(
        ProductsPageState(
          connectedToNetwork: state.requireValue.connectedToNetwork,
          isPaginating: false,
          limit: result.limit ?? AppSettings.defaultPageLimit,
          skip: result.skip ?? 0,
          products: result.products ?? [],
          hasMoreProducts: result.products?.isNotEmpty ?? false,
          total: result.total ?? 0,
        ),
      );
    } else {
      state = AsyncError('Something went wrong', StackTrace.current);
    }
  }

  Future<void> loadMoreProducts() async {
    if (state.requireValue.isPaginating ||
        !state.requireValue.hasMoreProducts) {
      return;
    }
    state = AsyncData(state.requireValue.copyWith(isPaginating: true));
    final productsResult = await _getProductsData(
      limit: state.requireValue.limit,
      skip: state.requireValue.skip + state.requireValue.limit,
    );
    state = AsyncData(
      state.requireValue.copyWith(
        hasMoreProducts: productsResult?.products?.isNotEmpty ?? false,
        isPaginating: false,
        skip: productsResult?.skip ?? state.requireValue.skip,
        products: [
          ...state.requireValue.products,
          ...productsResult?.products ?? [],
        ],
      ),
    );
  }

  Future<ProductsResponse?> _getProductsData({int? limit, int? skip}) async {
    if (!await ref.read(networkHelperProvider).isConnected) {
      Utils.showToast('No internet connection');
      return null;
    }
    final resultData = await ref.read(
      getProductsUseCaseProvider(
        limit: limit ?? AppSettings.defaultPageLimit,
        skip: skip,
      ).future,
    );
    final data = resultData.fold(
      (failure) {
        return null;
      },
      (result) {
        return result;
      },
    );
    return data;
  }

  void initNetworkConnectionProvider() {
    INetworkHelper networkHelper = ref.read(networkHelperProvider);
    networkHelper.onConnectivityChanged.listen((
      List<ConnectivityResult> result,
    ) async {
      //Has Internet Connection
      final hasInternet = !result.contains(ConnectivityResult.none);
      if (hasInternet && state.valueOrNull?.connectedToNetwork == false) {
        state = AsyncData(
          state.requireValue.copyWith(connectedToNetwork: true),
        );
      } //No Internet Connection
      else if (!hasInternet && state.valueOrNull?.connectedToNetwork == true) {
        state = AsyncData(
          state.requireValue.copyWith(connectedToNetwork: false),
        );
      }
      networkHelper.currentNetworkState = result.first;
    });
  }
}
