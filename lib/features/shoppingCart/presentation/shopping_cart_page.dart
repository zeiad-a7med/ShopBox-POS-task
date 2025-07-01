import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopbox_pos/features/shoppingCart/domain/models/cart/cart.dart';
import 'package:shopbox_pos/features/shoppingCart/presentation/controller/cart_controller.dart';
import 'package:shopbox_pos/features/shoppingCart/presentation/widgets/cart_item_widget.dart';

class ShoppingCartPage extends ConsumerStatefulWidget {
  const ShoppingCartPage({super.key});

  @override
  ConsumerState<ShoppingCartPage> createState() => ShoppingCartPageState();
}

class ShoppingCartPageState extends ConsumerState<ShoppingCartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white, size: 30),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          'Shopping Cart',
          style: TextStyle(
            color: Colors.white,
            fontSize: 23.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 71, 156, 118),
      ),
      body: Consumer(
        builder: (context, ref, _) {
          // final cartAsync = ref.watch(cartProvider);
          // final cartNotifier = ref.read(cartProvider.notifier);
          final provider = cartControllerProvider;
          final controller = ref.read(provider.notifier);
          final state = ref.watch(provider);
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state.hasError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.error, size: 60, color: Colors.red[400]),
                  SizedBox(height: 16.h),
                  Text(
                    'Error loading cart',
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.red[600],
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    '${state.error}',
                    style: TextStyle(fontSize: 14.sp, color: Colors.grey[600]),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            );
          } else if (state.requireValue.items.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.shopping_cart_outlined,
                    size: 80,
                    color: Colors.grey[400],
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    'Your cart is empty',
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey[600],
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    'Add some products to get started',
                    style: TextStyle(fontSize: 14.sp, color: Colors.grey[500]),
                  ),
                ],
              ),
            );
          } else {
            final cart = state.requireValue;
            return Column(
              children: [
                // Cart Items List
                Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.all(16.w),
                    itemCount: cart.items.length,
                    itemBuilder: (context, index) {
                      final item = cart.items[index];
                      return CartItemWidget(
                        item: item,
                        onQuantityChanged: (newQuantity) {
                          controller.updateQuantity(item.product, newQuantity);
                        },
                        onRemove: () {
                          controller.removeItem(item.product);
                        },
                      );
                    },
                  ),
                ),

                // Combo Section
                if (cart.getComboItems().isNotEmpty) ...[
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(16.w),
                    margin: EdgeInsets.symmetric(horizontal: 16.w),
                    decoration: BoxDecoration(
                      color: Colors.amber.shade50,
                      borderRadius: BorderRadius.circular(12.r),
                      border: Border.all(color: Colors.amber.shade200),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.local_offer,
                              color: Colors.amber.shade700,
                            ),
                            SizedBox(width: 8.w),
                            Text(
                              'Combo Applied!',
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.amber.shade800,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8.h),
                        ...cart.getComboItems().map(
                          (comboItem) => Padding(
                            padding: EdgeInsets.only(bottom: 10.h),
                            child: RichText(
                              text: TextSpan(
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: Colors.amber.shade700,
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: comboItem.comboTitle,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  TextSpan(
                                    text: comboItem.comboDescription,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16.h),
                ],

                // Total and Actions
                Container(
                  padding: EdgeInsets.all(16.w),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 4,
                        offset: const Offset(0, -2),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total Items:',
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            '${cart.totalItems}',
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total Amount:',
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '${cart.totalAmount.toStringAsFixed(2)} EGP',
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                              color: const Color.fromARGB(255, 71, 156, 118),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16.h),
                      Row(
                        children: [
                          Expanded(
                            child: OutlinedButton(
                              onPressed: () {
                                controller.clearCart();
                              },
                              style: OutlinedButton.styleFrom(
                                padding: EdgeInsets.symmetric(vertical: 12.h),
                                side: BorderSide(color: Colors.red.shade300),
                              ),
                              child: Text(
                                'Clear Cart',
                                style: TextStyle(color: Colors.red.shade600),
                              ),
                            ),
                          ),
                          SizedBox(width: 12.w),
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () async {
                                // Show payment method selection sheet
                                controller.requestPayment();
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color.fromARGB(
                                  255,
                                  71,
                                  156,
                                  118,
                                ),
                                padding: EdgeInsets.symmetric(vertical: 12.h),
                              ),
                              child: Text(
                                'Checkout',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}