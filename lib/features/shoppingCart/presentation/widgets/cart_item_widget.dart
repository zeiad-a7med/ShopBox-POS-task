import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopbox_pos/features/shoppingCart/domain/models/cart_item/cart_item.dart';

class CartItemWidget extends StatelessWidget {
  final CartItem item;
  final Function(int) onQuantityChanged;
  final VoidCallback onRemove;

  const CartItemWidget({
    super.key,
    required this.item,
    required this.onQuantityChanged,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 12.h),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Padding(
        padding: EdgeInsets.all(12.w),
        child: Row(
          children: [
            // Product Image
            ClipRRect(
              borderRadius: BorderRadius.circular(8.r),
              child: SizedBox(
                width: 60.w,
                height: 60.w,
                child: item.product.thumbnail != null && item.product.thumbnail!.isNotEmpty
                    ? Image.network(
                        item.product.thumbnail!,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            color: Colors.grey[300],
                            child: Icon(Icons.image, color: Colors.grey[600]),
                          );
                        },
                      )
                    : Container(
                        color: Colors.grey[300],
                        child: Icon(Icons.image, color: Colors.grey[600]),
                      ),
              ),
            ),
            
            SizedBox(width: 12.w),
            
            // Product Details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.product.title ?? 'Unknown Product',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  
                  if (item.isCombo) ...[
                    SizedBox(height: 4.h),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
                      decoration: BoxDecoration(
                        color: Colors.amber.shade100,
                        borderRadius: BorderRadius.circular(4.r),
                      ),
                      child: Text(
                        item.comboName ?? 'Combo',
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: Colors.amber.shade800,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                  
                  SizedBox(height: 4.h),
                  
                  Text(
                    '${item.product.price?.toStringAsFixed(2) ?? '0.00'} EGP',
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.grey[600],
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            
            // Quantity Controls
            Column(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      onPressed: () {
                        if (item.quantity > 1) {
                          onQuantityChanged(item.quantity - 1);
                        }
                      },
                      icon: Icon(
                        Icons.remove_circle_outline,
                        size: 24.sp,
                        color: item.quantity > 1 ? Colors.red : Colors.grey,
                      ),
                    ),
                    
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Text(
                        '${item.quantity}',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    
                    IconButton(
                      onPressed: () {
                        onQuantityChanged(item.quantity + 1);
                      },
                      icon: Icon(
                        Icons.add_circle_outline,
                        size: 24.sp,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
                
                SizedBox(height: 8.h),
                
                // Remove Button
                TextButton.icon(
                  onPressed: onRemove,
                  icon: Icon(
                    Icons.delete_outline,
                    size: 16.sp,
                    color: Colors.red,
                  ),
                  label: Text(
                    'Remove',
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: Colors.red,
                    ),
                  ),
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                    minimumSize: Size.zero,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
} 