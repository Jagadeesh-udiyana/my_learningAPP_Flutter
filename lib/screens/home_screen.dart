import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';
import 'package:fl_chart/fl_chart.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      drawer: AppDrawer(currentRoute: "Home"),
      appBar: AppBar(
        title: const Text("Dashboard"),
        backgroundColor: Colors.deepOrange,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Metric Cards Section - Horizontal Scroll
            const Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: Text(
                "Today's Overview",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildMetricCard(
                    context,
                    title: "Daily Sales",
                    value: "\$2,450",
                    icon: Icons.trending_up,
                    color: Colors.blue,
                    change: "+12% from yesterday",
                  ),
                  const SizedBox(width: 16),
                  _buildMetricCard(
                    context,
                    title: "Monthly Sales",
                    value: "\$45,890",
                    icon: Icons.calendar_month,
                    color: Colors.green,
                    change: "+8% from last month",
                  ),
                  const SizedBox(width: 16),
                  _buildMetricCard(
                    context,
                    title: "Attendance",
                    value: "92%",
                    icon: Icons.people,
                    color: Colors.orange,
                    change: "85/92 present",
                  ),
                  const SizedBox(width: 16),
                  _buildMetricCard(
                    context,
                    title: "Orders",
                    value: "156",
                    icon: Icons.shopping_cart,
                    color: Colors.purple,
                    change: "+5 from today",
                  ),
                  const SizedBox(width: 16),
                  _buildMetricCard(
                    context,
                    title: "Revenue",
                    value: "\$12,890",
                    icon: Icons.attach_money,
                    color: Colors.teal,
                    change: "+18% growth",
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),

            // Weekly Sales Chart
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Weekly Sales",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: isDarkMode ? Colors.grey[900] : Colors.grey[50],
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: isDarkMode
                            ? Colors.grey[800]!
                            : Colors.grey[200]!,
                      ),
                    ),
                    child: SizedBox(
                      height: 300,
                      child: BarChart(_buildWeeklyBarChartData()),
                    ),
                  ),
                ],
              ),
            ),

            // Monthly Sales Trend Chart
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Monthly Sales Trend",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: isDarkMode ? Colors.grey[900] : Colors.grey[50],
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: isDarkMode
                            ? Colors.grey[800]!
                            : Colors.grey[200]!,
                      ),
                    ),
                    child: SizedBox(
                      height: 300,
                      child: LineChart(_buildMonthlySalesChartData()),
                    ),
                  ),
                ],
              ),
            ),

            // Attendance Distribution Chart
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Attendance Distribution",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: isDarkMode ? Colors.grey[900] : Colors.grey[50],
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: isDarkMode
                            ? Colors.grey[800]!
                            : Colors.grey[200]!,
                      ),
                    ),
                    child: SizedBox(
                      height: 250,
                      child: PieChart(_buildAttendanceChartData()),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildLegendItem("Present", Colors.green),
                      const SizedBox(width: 24),
                      _buildLegendItem("Absent", Colors.red),
                      const SizedBox(width: 24),
                      _buildLegendItem("Leave", Colors.yellow),
                    ],
                  ),
                ],
              ),
            ),

            // Revenue Breakdown Section
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Revenue by Category",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: isDarkMode ? Colors.grey[900] : Colors.grey[50],
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: isDarkMode
                            ? Colors.grey[800]!
                            : Colors.grey[200]!,
                      ),
                    ),
                    child: SizedBox(
                      height: 250,
                      child: BarChart(_buildRevenueBarChartData()),
                    ),
                  ),
                ],
              ),
            ),

            // Recent Activities Section
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Recent Activities",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  _buildActivityCard(
                    icon: Icons.shopping_bag,
                    title: "New Order",
                    description: "Order #12345 placed by John Doe",
                    time: "2 hours ago",
                    color: Colors.blue,
                  ),
                  _buildActivityCard(
                    icon: Icons.people,
                    title: "New User",
                    description: "Jane Smith joined the platform",
                    time: "4 hours ago",
                    color: Colors.green,
                  ),
                  _buildActivityCard(
                    icon: Icons.payment,
                    title: "Payment Received",
                    description: "Payment of \$5,200 received",
                    time: "6 hours ago",
                    color: Colors.purple,
                  ),
                  _buildActivityCard(
                    icon: Icons.warning,
                    title: "Low Stock Alert",
                    description: "Product 'Widget X' stock is low",
                    time: "8 hours ago",
                    color: Colors.orange,
                  ),
                ],
              ),
            ),

            // Top Products Section
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Top Selling Products",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  _buildProductTile(
                    "Widget A",
                    "245 sold",
                    "\$12,450",
                    Colors.blue,
                  ),
                  _buildProductTile(
                    "Widget B",
                    "189 sold",
                    "\$9,450",
                    Colors.green,
                  ),
                  _buildProductTile(
                    "Widget C",
                    "156 sold",
                    "\$7,890",
                    Colors.orange,
                  ),
                  _buildProductTile(
                    "Widget D",
                    "123 sold",
                    "\$6,150",
                    Colors.purple,
                  ),
                ],
              ),
            ),

            // Performance Metrics
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Performance Metrics",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  _buildMetricBar(
                    label: "Customer Satisfaction",
                    percentage: 87,
                    color: Colors.green,
                  ),
                  const SizedBox(height: 12),
                  _buildMetricBar(
                    label: "Order Fulfillment Rate",
                    percentage: 94,
                    color: Colors.blue,
                  ),
                  const SizedBox(height: 12),
                  _buildMetricBar(
                    label: "On-Time Delivery",
                    percentage: 89,
                    color: Colors.orange,
                  ),
                  const SizedBox(height: 12),
                  _buildMetricBar(
                    label: "Return Rate",
                    percentage: 12,
                    color: Colors.red,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildMetricCard(
    BuildContext context, {
    required String title,
    required String value,
    required IconData icon,
    required Color color,
    required String change,
  }) {
    // ignore: unused_local_variable
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Container(
      width: 160,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [color.withOpacity(0.8), color.withOpacity(0.5)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.3),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: Colors.white, size: 28),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  change,
                  style: const TextStyle(color: Colors.white70, fontSize: 10),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLegendItem(String label, Color color) {
    return Row(
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        const SizedBox(width: 6),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }

  Widget _buildActivityCard({
    required IconData icon,
    required String title,
    required String description,
    required String time,
    required Color color,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey[300]!),
        color: Colors.grey[50],
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: color.withOpacity(0.2),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: color, size: 24),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
          ),
          Text(time, style: const TextStyle(fontSize: 11, color: Colors.grey)),
        ],
      ),
    );
  }

  Widget _buildProductTile(
    String productName,
    String soldCount,
    String revenue,
    Color color,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey[300]!),
        color: Colors.grey[50],
      ),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: color.withOpacity(0.2),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(Icons.shopping_bag, color: color, size: 28),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productName,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  soldCount,
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
          ),
          Text(
            revenue,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
              color: color,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMetricBar({
    required String label,
    required int percentage,
    required Color color,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 13),
            ),
            Text(
              "$percentage%",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 13,
                color: color,
              ),
            ),
          ],
        ),
        const SizedBox(height: 6),
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: LinearProgressIndicator(
            value: percentage / 100,
            minHeight: 8,
            backgroundColor: Colors.grey[300],
            valueColor: AlwaysStoppedAnimation<Color>(color),
          ),
        ),
      ],
    );
  }

  BarChartData _buildWeeklyBarChartData() {
    return BarChartData(
      alignment: BarChartAlignment.spaceAround,
      maxY: 5000,
      barTouchData: BarTouchData(
        enabled: true,
        touchTooltipData: BarTouchTooltipData(
          getTooltipColor: (group) => Colors.grey[700]!,
          tooltipRoundedRadius: 8,
        ),
      ),
      titlesData: FlTitlesData(
        show: true,
        topTitles: const AxisTitles(),
        rightTitles: const AxisTitles(),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: (value, meta) {
              const titles = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
              final index = value.toInt();
              return Text(titles[index], style: const TextStyle(fontSize: 12));
            },
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: (value, meta) {
              return Text(
                '\$${(value / 1000).toStringAsFixed(0)}k',
                style: const TextStyle(fontSize: 10),
              );
            },
            reservedSize: 42,
          ),
        ),
      ),
      gridData: const FlGridData(show: true),
      borderData: FlBorderData(show: false),
      barGroups: [
        BarChartGroupData(
          x: 0,
          barRods: [BarChartRodData(toY: 3500, color: Colors.blue)],
        ),
        BarChartGroupData(
          x: 1,
          barRods: [BarChartRodData(toY: 4200, color: Colors.blue)],
        ),
        BarChartGroupData(
          x: 2,
          barRods: [BarChartRodData(toY: 3800, color: Colors.blue)],
        ),
        BarChartGroupData(
          x: 3,
          barRods: [BarChartRodData(toY: 4800, color: Colors.blue)],
        ),
        BarChartGroupData(
          x: 4,
          barRods: [BarChartRodData(toY: 4500, color: Colors.blue)],
        ),
        BarChartGroupData(
          x: 5,
          barRods: [BarChartRodData(toY: 3900, color: Colors.blue)],
        ),
        BarChartGroupData(
          x: 6,
          barRods: [BarChartRodData(toY: 2450, color: Colors.blue)],
        ),
      ],
    );
  }

  BarChartData _buildRevenueBarChartData() {
    return BarChartData(
      alignment: BarChartAlignment.spaceAround,
      maxY: 50000,
      barTouchData: BarTouchData(
        enabled: true,
        touchTooltipData: BarTouchTooltipData(
          getTooltipColor: (group) => Colors.grey[700]!,
          tooltipRoundedRadius: 8,
        ),
      ),
      titlesData: FlTitlesData(
        show: true,
        topTitles: const AxisTitles(),
        rightTitles: const AxisTitles(),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: (value, meta) {
              const titles = [
                'Electronics',
                'Fashion',
                'Food',
                'Books',
                'Sports',
              ];
              final index = value.toInt();
              return Text(titles[index], style: const TextStyle(fontSize: 12));
            },
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: (value, meta) {
              return Text(
                '\$${(value / 1000).toStringAsFixed(0)}k',
                style: const TextStyle(fontSize: 10),
              );
            },
            reservedSize: 42,
          ),
        ),
      ),
      gridData: const FlGridData(show: true),
      borderData: FlBorderData(show: false),
      barGroups: [
        BarChartGroupData(
          x: 0,
          barRods: [BarChartRodData(toY: 45000, color: Colors.blue)],
        ),
        BarChartGroupData(
          x: 1,
          barRods: [BarChartRodData(toY: 38000, color: Colors.green)],
        ),
        BarChartGroupData(
          x: 2,
          barRods: [BarChartRodData(toY: 32000, color: Colors.orange)],
        ),
        BarChartGroupData(
          x: 3,
          barRods: [BarChartRodData(toY: 28000, color: Colors.purple)],
        ),
        BarChartGroupData(
          x: 4,
          barRods: [BarChartRodData(toY: 35000, color: Colors.red)],
        ),
      ],
    );
  }

  LineChartData _buildMonthlySalesChartData() {
    return LineChartData(
      gridData: const FlGridData(show: true),
      titlesData: FlTitlesData(
        show: true,
        topTitles: const AxisTitles(),
        rightTitles: const AxisTitles(),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: (value, meta) {
              const titles = [
                'Jan',
                'Feb',
                'Mar',
                'Apr',
                'May',
                'Jun',
                'Jul',
                'Aug',
                'Sep',
                'Oct',
                'Nov',
                'Dec',
              ];
              final index = value.toInt();
              if (index < titles.length) {
                return Text(
                  titles[index],
                  style: const TextStyle(fontSize: 12),
                );
              }
              return const Text('');
            },
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: (value, meta) {
              return Text(
                '\$${(value / 1000).toStringAsFixed(0)}k',
                style: const TextStyle(fontSize: 10),
              );
            },
            reservedSize: 42,
          ),
        ),
      ),
      borderData: FlBorderData(show: false),
      lineBarsData: [
        LineChartBarData(
          spots: [
            const FlSpot(0, 30000),
            const FlSpot(1, 35000),
            const FlSpot(2, 32000),
            const FlSpot(3, 42000),
            const FlSpot(4, 39000),
            const FlSpot(5, 45000),
            const FlSpot(6, 47000),
            const FlSpot(7, 44000),
            const FlSpot(8, 48000),
            const FlSpot(9, 50000),
            const FlSpot(10, 52000),
            const FlSpot(11, 55000),
          ],
          isCurved: true,
          gradient: LinearGradient(
            colors: [Colors.green[400]!, Colors.green[700]!],
          ),
          barWidth: 3,
          isStrokeCapRound: true,
          dotData: const FlDotData(show: true),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: [
                Colors.green[400]!.withOpacity(0.3),
                Colors.green[700]!.withOpacity(0.1),
              ],
            ),
          ),
        ),
      ],
      minY: 25000,
      maxY: 60000,
    );
  }

  PieChartData _buildAttendanceChartData() {
    return PieChartData(
      sections: [
        PieChartSectionData(
          color: Colors.green,
          value: 85,
          title: '85\n(Present)',
          radius: 80,
          titleStyle: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        PieChartSectionData(
          color: Colors.red,
          value: 15,
          title: '5\n(Absent)',
          radius: 80,
          titleStyle: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        PieChartSectionData(
          color: Colors.yellow,
          value: 12,
          title: '2\n(Leave)',
          radius: 80,
          titleStyle: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ],
      sectionsSpace: 0,
      centerSpaceRadius: 40,
    );
  }
}
