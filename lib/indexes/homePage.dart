import 'dart:ui';
import 'package:flutter/material.dart';

class ImageInfo {
  final String assetPath;
  final String description;

  ImageInfo({required this.assetPath, required this.description});
}

List<ImageInfo> images = [
  ImageInfo(assetPath: 'assets/images/sample_img/image1.png', description: 'A centered explosion of colorful powder on a black background'),
  ImageInfo(assetPath: 'assets/images/sample_img/image2.png', description: 'A centered explosion of colorful powder on a black background'),
];

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isSearching = false;
  String _selectedOption = "추천순";
  int _layoutOption = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 50, 20, 0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: CustomScrollView(
                slivers: [
                  SliverList(
                    delegate: SliverChildListDelegate(
                      [
                        Column(children: [
                          const SizedBox(height: 40.0),
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "인공지능이 제공하는\n환상적인 이미지",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                letterSpacing: -1.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(height: 20.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Row(
                                    children: [
                                      IconButton(
                                        icon: const Icon(Icons.view_agenda_rounded),
                                        color: _layoutOption == 0 ? Colors.white : Colors.grey,
                                        iconSize: 30,
                                        onPressed: () {
                                          setState(() {
                                            _layoutOption = 0;
                                          });
                                        },
                                      ),
                                      IconButton(
                                        icon: const Icon(Icons.grid_view_rounded),
                                        color: _layoutOption == 1 ? Colors.white : Colors.grey,
                                        iconSize: 30,
                                        onPressed: () {
                                          setState(() {
                                            _layoutOption = 1;
                                          });
                                        },
                                      ),
                                      IconButton(
                                        icon: const Icon(Icons.view_list_rounded),
                                        color: _layoutOption == 2 ? Colors.white : Colors.grey,
                                        iconSize: 40,
                                        onPressed: () {
                                          setState(() {
                                            _layoutOption = 2;
                                          });
                                        },
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              DropdownButton<String>(
                                value: _selectedOption,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                                underline: Container(
                                  height: 0,
                                ),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    _selectedOption = newValue!;
                                  });
                                },
                                items: <String>['추천순', '인기순', '최신순']
                                    .map<DropdownMenuItem<String>>(
                                        (String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                icon: const Icon(
                                  Icons.expand_more_rounded,
                                  color: Colors.white,
                                  size: 25,
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                                dropdownColor: const Color(0xE5303030),
                                elevation: 0,
                              ),
                            ],
                          ),
                        ]),
                      ],
                    ),
                  ),
                  SliverPersistentHeader(
                    pinned: true,
                    delegate: _SliverAppBarDelegate(
                      minHeight: 45.0,
                      maxHeight: 45.0,
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          color: const Color(0xFF414141),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: const Row(
                          children: [
                            Icon(Icons.search, color: Colors.white),
                            SizedBox(width: 8.0),
                            Text(
                              '검색',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ),
                      onTap: _onSearchTap,
                    ),
                  ),
                  SliverList(
                    delegate: SliverChildListDelegate(
                      [
                        Column(
                          children: [
                            const SizedBox(height: 20.0),
                            _buildImageLayout(),
                            const SizedBox(height: 100.0),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (_isSearching)
            Positioned.fill(
              child: ClipRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                  child: Container(
                    color: Colors.black.withOpacity(0.3),
                  ),
                ),
              ),
            ),
          if (_isSearching)
            Positioned(
              top: 100,
              left: 25,
              right: 25,
              child: Container(
                height: 60.0,
                alignment: Alignment.center,
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: const Color(0xAA414141),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: TextField(
                  autofocus: true,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    hintText: '검색',
                    hintStyle: TextStyle(color: Colors.white),
                    prefixIcon: Icon(Icons.search, color: Colors.white),
                    border: InputBorder.none,
                  ),
                  onSubmitted: (value) {
                    setState(() {
                      _isSearching = false;
                    });
                  },
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildImageLayout() {
    switch (_layoutOption) {
      case 0:
        return Column(
          children: _buildOneColumnLayout(),
        );
      case 1:
        return Column(
          children: _buildTwoColumnLayout(),
        );
      case 2:
        return Column(
          children: _buildOneColumnWithDescriptionLayout(),
        );
      default:
        return Container();
    }
  }

  List<Widget> _buildOneColumnLayout() {
    return [
      GridView.builder(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: images.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          mainAxisSpacing: 15,
          crossAxisSpacing: 15,
          childAspectRatio: 1,
        ),
        itemBuilder: (BuildContext context, int index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Image.asset(
              images[index].assetPath,
              fit: BoxFit.cover,
            ),
          );
        },
      ),
    ];
  }

  List<Widget> _buildTwoColumnLayout() {
    return [
      GridView.builder(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: images.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 15,
          crossAxisSpacing: 15,
          childAspectRatio: 1,
        ),
        itemBuilder: (BuildContext context, int index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Image.asset(
              images[index].assetPath,
              fit: BoxFit.cover,
            ),
          );
        },
      ),
    ];
  }

  List<Widget> _buildOneColumnWithDescriptionLayout() {
    return [
      Column(
        children: List.generate(images.length, (index) {
          return Column(
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.asset(
                      images[index].assetPath,
                      width: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 10.0),
                  Expanded(
                    child: Text(
                      images[index].description,
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.5),
                        fontSize: 20,
                      ),
                      softWrap: true,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15.0),
            ],
          );
        }),
      ),
    ];
  }

  _onSearchTap() {
    setState(() {
      _isSearching = true;
    });
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
    required this.onTap,
  });

  final double minHeight;
  final double maxHeight;
  final Widget child;
  final Function onTap;

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => maxHeight;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return GestureDetector(
      onTap: () => onTap(),
      child: SizedBox.expand(child: child),
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}
