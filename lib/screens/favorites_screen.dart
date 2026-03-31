import 'package:flutter/material.dart';
import 'package:mylearningapp/screens/home_screen.dart';
import '../widgets/app_drawer.dart';

class FavoriteItem {
  final int id;
  final String title;
  final String category;
  final double rating;
  final int reviews;
  final IconData icon;
  final Color color;

  FavoriteItem({
    required this.id,
    required this.title,
    required this.category,
    required this.rating,
    required this.reviews,
    required this.icon,
    required this.color,
  });
}

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  late List<FavoriteItem> favorites;
  bool isGridView = true;

  @override
  void initState() {
    super.initState();
    favorites = [
      FavoriteItem(
        id: 1,
        title: "Advanced Flutter",
        category: "Development",
        rating: 4.8,
        reviews: 245,
        icon: Icons.flutter_dash,
        color: Colors.blue,
      ),
      FavoriteItem(
        id: 2,
        title: "UI Design Principles",
        category: "Design",
        rating: 4.7,
        reviews: 189,
        icon: Icons.palette,
        color: Colors.purple,
      ),
      FavoriteItem(
        id: 3,
        title: "Data Science 101",
        category: "Analytics",
        rating: 4.9,
        reviews: 567,
        icon: Icons.analytics,
        color: Colors.green,
      ),
      FavoriteItem(
        id: 4,
        title: "Digital Marketing",
        category: "Marketing",
        rating: 4.6,
        reviews: 312,
        icon: Icons.campaign,
        color: Colors.orange,
      ),
      FavoriteItem(
        id: 5,
        title: "Cloud Computing",
        category: "Infrastructure",
        rating: 4.8,
        reviews: 428,
        icon: Icons.cloud,
        color: Colors.cyan,
      ),
      FavoriteItem(
        id: 6,
        title: "Machine Learning",
        category: "AI",
        rating: 4.9,
        reviews: 654,
        icon: Icons.smart_toy,
        color: Colors.red,
      ),
      FavoriteItem(
        id: 7,
        title: "Web Development",
        category: "Development",
        rating: 4.7,
        reviews: 512,
        icon: Icons.language,
        color: Colors.yellow,
      ),
      FavoriteItem(
        id: 8,
        title: "Video Editing",
        category: "Media",
        rating: 4.6,
        reviews: 234,
        icon: Icons.video_camera_back,
        color: Colors.pink,
      ),
    ];
  }

  void _removeFavorite(int id) {
    setState(() {
      favorites.removeWhere((item) => item.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    // final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      drawer: const AppDrawer(currentRoute: "Favorites"),
      appBar: AppBar(
        title: const Text("Favorites"),
        backgroundColor: Colors.deepOrange,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            );
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(8),
              ),
              child: IconButton(
                icon: Icon(isGridView ? Icons.view_list : Icons.grid_view),
                onPressed: () {
                  setState(() {
                    isGridView = !isGridView;
                  });
                },
                tooltip: isGridView ? "List View" : "Grid View",
              ),
            ),
          ),
        ],
      ),
      body: favorites.isEmpty
          ? _buildEmptyState(context)
          : SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeaderCard(context),
                  const SizedBox(height: 20),
                  isGridView
                      ? _buildGridView(context)
                      : _buildListView(context),
                  const SizedBox(height: 20),
                ],
              ),
            ),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.deepOrange.withOpacity(0.1),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(
              Icons.favorite_border,
              size: 64,
              color: Colors.deepOrange,
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            "No Favorites Yet",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            "Start adding your favorite courses and items",
            style: TextStyle(
              color: isDarkMode ? Colors.grey[400] : Colors.grey[600],
            ),
          ),
          const SizedBox(height: 24),
          ElevatedButton.icon(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
              );
            },
            icon: const Icon(Icons.explore),
            label: const Text("Explore Courses"),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.deepOrange,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeaderCard(BuildContext context) {
    // final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Colors.deepOrange, Colors.orange],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Your Favorites",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "${favorites.length} items saved",
                    style: const TextStyle(fontSize: 13, color: Colors.white70),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(
                  Icons.favorite,
                  color: Colors.white,
                  size: 28,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: LinearProgressIndicator(
              value: (favorites.length / 10).clamp(0, 1),
              minHeight: 6,
              backgroundColor: Colors.white.withOpacity(0.2),
              valueColor: AlwaysStoppedAnimation<Color>(
                Colors.white.withOpacity(0.8),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            "Complete your collection (${favorites.length}/10)",
            style: const TextStyle(fontSize: 12, color: Colors.white70),
          ),
        ],
      ),
    );
  }

  Widget _buildGridView(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      mainAxisSpacing: 16,
      crossAxisSpacing: 16,
      childAspectRatio: 0.95,
      children: favorites.map((item) {
        return _buildFavoriteCard(context, item);
      }).toList(),
    );
  }

  Widget _buildListView(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: favorites.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: _buildFavoriteListItem(context, favorites[index]),
        );
      },
    );
  }

  Widget _buildFavoriteCard(BuildContext context, FavoriteItem item) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return GestureDetector(
      onLongPress: () {
        _showDeleteDialog(context, item);
      },
      child: Container(
        decoration: BoxDecoration(
          color: isDarkMode ? Colors.grey[900] : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isDarkMode ? Colors.grey[800]! : Colors.grey[200]!,
          ),
        ),
        child: Column(
          children: [
            // Header with icon and favorite button
            Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: item.color.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(item.icon, color: item.color, size: 24),
                  ),
                  GestureDetector(
                    onTap: () {
                      _removeFavorite(item.id);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Removed ${item.title} from favorites"),
                          duration: const Duration(seconds: 2),
                        ),
                      );
                    },
                    child: const Icon(
                      Icons.favorite,
                      color: Colors.red,
                      size: 20,
                    ),
                  ),
                ],
              ),
            ),
            // Content
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    item.category,
                    style: TextStyle(fontSize: 11, color: Colors.grey[600]),
                  ),
                ],
              ),
            ),
            const Spacer(),
            // Rating
            Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.amber, size: 16),
                      const SizedBox(width: 4),
                      Text(
                        "${item.rating}",
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "(${item.reviews})",
                    style: TextStyle(fontSize: 11, color: Colors.grey[600]),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFavoriteListItem(BuildContext context, FavoriteItem item) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: isDarkMode ? Colors.grey[900] : Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isDarkMode ? Colors.grey[800]! : Colors.grey[200]!,
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: item.color.withOpacity(0.15),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(item.icon, color: item.color, size: 24),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Text(
                      item.category,
                      style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                    ),
                    const SizedBox(width: 12),
                    Icon(Icons.star, color: Colors.amber, size: 14),
                    const SizedBox(width: 2),
                    Text(
                      "${item.rating} (${item.reviews})",
                      style: const TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              _removeFavorite(item.id);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("Removed ${item.title} from favorites"),
                  duration: const Duration(seconds: 2),
                ),
              );
            },
            child: const Icon(Icons.favorite, color: Colors.red, size: 24),
          ),
        ],
      ),
    );
  }

  void _showDeleteDialog(BuildContext context, FavoriteItem item) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Remove Favorite?"),
          content: Text("Remove '${item.title}' from your favorites?"),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                _removeFavorite(item.id);
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Removed ${item.title} from favorites"),
                    duration: const Duration(seconds: 2),
                  ),
                );
              },
              child: const Text("Remove", style: TextStyle(color: Colors.red)),
            ),
          ],
        );
      },
    );
  }
}
