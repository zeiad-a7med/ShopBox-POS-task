import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopbox_pos/core/routes/route_utils.dart';
import 'package:shopbox_pos/features/products/presentation/controller/products_page_controller.dart';
import 'package:shopbox_pos/features/products/presentation/widgets/custom_loading.dart';
import 'package:shopbox_pos/features/products/presentation/widgets/product_card.dart';
import 'package:shopbox_pos/features/shoppingCart/domain/models/cart/cart.dart';
import 'package:shopbox_pos/features/shoppingCart/presentation/controller/cart_controller.dart';

class ProductsPage extends ConsumerStatefulWidget {
  const ProductsPage({super.key});

  @override
  ConsumerState<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends ConsumerState<ProductsPage> {
  final scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    final provider = productsPageControllerProvider(
      scrollController: scrollController,
    );
    final controller = ref.read(provider.notifier);
    final state = ref.watch(provider);

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 150.w,
              child: Image.asset('assets/images/app_logo.png'),
            ),
            const Spacer(),
            Stack(
              clipBehavior: Clip.none,
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.shopping_cart_outlined,
                    size: 35,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    RouteUtils.goToShoppingCart();
                  },
                ),
                Positioned(
                  right: 4,
                  top: 4,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    constraints: const BoxConstraints(
                      minWidth: 20,
                      minHeight: 20,
                    ),
                    child: Consumer(
                      builder: (context, ref, _) {
                        final cartState = ref.watch(cartControllerProvider);
                        return Text(
                          (cartState.value?.totalItems ?? 0).toString(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                          textAlign: TextAlign.center,
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        backgroundColor: const Color.fromARGB(255, 71, 156, 118),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await controller.refresh();
        },
        child: Consumer(
          builder: (context, ref, _) {
            if (state.isLoading) {
              return const Center(child: CustomLoadingWidget());
            } else if (state.hasError) {
              return Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.error, size: 60, color: Colors.redAccent),
                    const SizedBox(height: 12),
                    Text(
                      'Something went wrong',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(
                      state.error.toString(),
                      style: Theme.of(context).textTheme.bodySmall,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () => controller.refresh(),
                      child: const Text('Retry'),
                    ),
                  ],
                ),
              );
            } else if (state.requireValue.products.isEmpty) {
              return Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.inventory_2_outlined,
                      size: 80,
                      color: Colors.grey,
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'No products found',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ],
                ),
              );
            } else {
              final products = state.requireValue.products;
              return SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: GridView.builder(
                    controller: scrollController,
                    itemCount: products.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.45,
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 12,
                        ),
                    itemBuilder: (ctx, i) => ProductItem(products[i]),
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
