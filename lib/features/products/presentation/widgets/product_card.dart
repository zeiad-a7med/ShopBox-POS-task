import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopbox_pos/features/products/domain/models/product/product.dart';

class ProductItem extends StatefulWidget {
  final Product product;

  const ProductItem(this.product, {super.key});

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  int quantity = 1;

  void increment() => setState(() => quantity++);
  void decrement() => setState(() {
    if (quantity > 1) quantity--;
  });

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(15);
    final product = widget.product;

    return Material(
      elevation: 3,
      borderRadius: borderRadius,
      child: InkWell(
        borderRadius: borderRadius,
        onTap: () {
          // Navigate to product details or show modal
        },
        child: ClipRRect(
          borderRadius: borderRadius,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Product Image
              AspectRatio(
                aspectRatio: 1,
                child:
                    product.thumbnail != null && product.thumbnail!.isNotEmpty
                    ? FadeInImage.assetNetwork(
                        placeholder: 'assets/images/placeholder.jpg',
                        image: product.thumbnail!,
                        fit: BoxFit.cover,
                      )
                    : Image.asset('assets/images/placeholder.jpg', fit: BoxFit.cover),
              ),

              // Details Container
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title
                    Text(
                      product.title ?? 'No Title',
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),

                    const SizedBox(height: 4),

                    // Rating
                    if (product.rating != null)
                      RatingBarIndicator(
                        rating: product.rating!,
                        itemBuilder: (context, index) =>
                            const Icon(Icons.star, color: Colors.amber),
                        itemCount: 5,
                        itemSize: 16.0,
                        direction: Axis.horizontal,
                      ),

                    const SizedBox(height: 4),

                    // Description
                    Text(
                      product.description ?? 'No description available',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),

                    const SizedBox(height: 8),

                    // Quantity Controls
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.remove_circle_outline),
                          onPressed: decrement,
                        ),
                        Text(
                          quantity.toString(),
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        IconButton(
                          icon: const Icon(Icons.add_circle_outline),
                          onPressed: increment,
                        ),
                        const Spacer(),

                        // 🛒 Add to Cart Button
                        ElevatedButton.icon(
                          onPressed: () {
                            // Handle add to cart with `quantity`
                          },
                          icon: const Icon(Icons.add_shopping_cart, size: 18),
                          label: const Text('Add'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.deepPurple,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 6,
                            ),
                            textStyle: const TextStyle(fontSize: 14),
                          ),
                        ),
                      ],
                    ),

                    if (product.price != null)...[
                      // Pricing
                      10.verticalSpace,
                      ProductPricingWidget(
                        price: product.price!,
                        discount: product.discountPercentage,
                      ),
                    ]
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProductPricingWidget extends StatelessWidget {
  final double price;
  final double? discount;
  const ProductPricingWidget({super.key, required this.price, this.discount});
  @override
  Widget build(BuildContext context) {
     return Padding(
       padding: const EdgeInsets.all(8.0),
       child: Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: 3.w,
          runSpacing: 4.h,
          children: [
           
           if (discount != null)
            Container(
              padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
              decoration: BoxDecoration(
                color: Colors.green.shade100,
                borderRadius: BorderRadius.circular(4.r),
              ),
              child: Text(
                '${discount?.toStringAsFixed(0)}% off ',
                style: TextStyle(
                  color: Colors.green.shade800,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          Text('${price.toStringAsFixed(0)} EGP')
          ],
        ),
     );
  }
}
