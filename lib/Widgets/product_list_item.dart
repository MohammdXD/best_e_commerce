import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:best_e_commerce/main.dart';
import '../Moudel/Proudect_API.dart';
import '../Provider/favorit_provider.dart';

class ProductListItem extends StatelessWidget {
  final ProudectApi product;

  const ProductListItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FavoriteProvider>(context);

    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          Routes.details_product,
          arguments: product,
        );
      },
      child: Container(
        width: 180,
        margin: const EdgeInsets.only(right: 5),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 30),
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                ),
                child: Image.network(
                  product.image,
                  width: 150,
                  height: 150,
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(
                      Icons.error,
                      size: 50,
                      color: Colors.grey,
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 5),
            Text(
              product.title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            Row(
              children: [
                Text(
                  '\$${product.price}',
                  style: const TextStyle(
                    color: Colors.deepOrangeAccent,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 5),
                IconButton(
                  onPressed: () {
                    provider.toggleFavorite(product);
                  },
                  icon: SvgPicture.asset(
                    provider.isFavorite(product)
                        ? "assets/icons/Heart Icon_2.svg"
                        : "assets/icons/Heart Icon.svg",
                    color: provider.isFavorite(product)
                        ? Colors.red
                        : Colors.grey,
                    width: 20,
                    height: 20,
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
