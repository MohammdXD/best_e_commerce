import 'package:best_e_commerce/Module/Proudect_API.dart';
import 'package:best_e_commerce/Provider/favorit_provider.dart';
import 'package:best_e_commerce/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class ProductCard extends StatelessWidget {
  final ProudectApi product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FavoriteProvider>(context);
    final isFavorite = provider.isFavorite(product);

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
        margin: EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(30),
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: const BorderRadius.all(Radius.circular(20)),
              ),
              child: Image.network(
                product.image,
                width: 125,
                height: 125,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(Icons.error, size: 50, color: Colors.grey);
                },
              ),
            ),
            SizedBox(height: 5),
            Text(
              product.title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            Spacer(),
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
                Spacer(),
                IconButton(
                  onPressed: () {
                    provider.toggleFavorite(product);
                  },
                  icon: SvgPicture.asset(
                    isFavorite
                        ? "assets/icons/Heart Icon_2.svg" // Red filled heart
                        : "assets/icons/Heart Icon.svg", // Grey outline heart
                    color: isFavorite ? Colors.red : Colors.grey,
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
