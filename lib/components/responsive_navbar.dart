import 'package:flutter/material.dart';
import 'package:devfolio/components/Responsive.dart';

class ResponsiveNavBar extends StatelessWidget {
  final List<String> navItems;
  final int currentIndex;
  final Function(int) scrollToSection;

  /// Creates a responsive navigation bar that adapts to mobile and desktop layouts.
  const ResponsiveNavBar({
    super.key,
    required this.navItems,
    required this.scrollToSection,
    required this.currentIndex,
  });

  void _onItemTapped(int index) {
    if (index != currentIndex) {
      scrollToSection(index);
    }
  }

  Widget _buildLogo() {
    return Image.asset(
      'assets/images/Signature.png',
      scale: 3, // Keeps it responsive without hardcoding height
    );
  }

  Widget _buildNavItem(String label, int index, BuildContext context) {
    final isSelected = index == currentIndex;
    final isMobile = Responsive.isMobile(context);

    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 10 : 16,
          vertical: isMobile ? 6 : 8,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              label,
              style: TextStyle(
                fontSize: isMobile ? 14 : 16,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                color: isSelected ? Colors.black : Colors.grey[700],
              ),
            ),
            if (isSelected)
              Container(
                margin: const EdgeInsets.only(top: 4),
                height: 2,
                width: 20,
                color: Colors.black,
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildMobileNav(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 6),
          color: Colors.white,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(child: _buildLogo()),
              const SizedBox(height: 4),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  children: navItems
                      .asMap()
                      .entries
                      .map((entry) => _buildNavItem(entry.value, entry.key, context))
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDesktopNav(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
      color: Colors.white,
      child: Row(
        children: [
          _buildLogo(),
          const Spacer(),
          Row(
            children: navItems
                .asMap()
                .entries
                .map((entry) => _buildNavItem(entry.value, entry.key, context))
                .toList(),
          ),
          const Spacer(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Responsive.isMobile(context)
        ? _buildMobileNav(context)
        : _buildDesktopNav(context);
  }
}
