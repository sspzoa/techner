import 'package:flutter/material.dart';

class LibraryImage {
  final String assetPath;

  LibraryImage({required this.assetPath});
}

List<LibraryImage> libraryImages = [
  LibraryImage(assetPath: 'assets/images/sample_img/image1.png'),
  LibraryImage(assetPath: 'assets/images/sample_img/image2.png'),
];

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
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
                        const SizedBox(height: 40),
                        Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  ColorFiltered(
                                    colorFilter: ColorFilter.mode(
                                        Colors.black.withOpacity(0.4), BlendMode.darken),
                                    child: const CircleAvatar(
                                      radius: 40,
                                      backgroundImage: AssetImage(
                                        'assets/images/profileImage.jpeg',
                                      ),
                                    ),
                                  ),
                                  const Icon(
                                    Icons.camera_alt,
                                    size: 24.0,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 20),
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      '사용자',
                                      style: TextStyle(
                                        fontSize: 28,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    Icon(
                                      Icons.edit,
                                      color: Colors.black,
                                      size: 25,
                                    ),
                                  ],
                                ),
                                Text(
                                  "hello@techner.app",
                                  style: TextStyle(
                                    fontFamily: "Pretendard",
                                    fontSize: 15,
                                    color: Color(0xffcdcdcd),
                                  ),
                                  textAlign: TextAlign.left,
                                )
                              ],
                            ),
                            const Spacer(),
                            Container(
                              padding: const EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                color: const Color(0x66000000),
                                borderRadius: BorderRadius.circular(40.0),
                              ),
                              child: const Icon(
                                Icons.settings_rounded,
                                color: Colors.white,
                                size: 30,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 30),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                          decoration: BoxDecoration(
                            color: const Color(0xFF414141),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: const Row(
                            children: [
                              Icon(
                                Icons.description_rounded,
                                color: Colors.white,
                              ),
                              SizedBox(width: 10),
                              Text('내 게시물',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                  )),
                              const Spacer(),
                              Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: Colors.white,
                                size: 20,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 5),Container(
                          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                          decoration: BoxDecoration(
                            color: const Color(0xFF414141),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: const Row(
                            children: [
                              Icon(
                                Icons.campaign_rounded,
                                color: Colors.white,
                              ),
                              SizedBox(width: 10),
                              Text('공지사항',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                  )),
                              const Spacer(),
                              Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: Colors.white,
                                size: 20,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 5),Container(
                          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                          decoration: BoxDecoration(
                            color: const Color(0xFF414141),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: const Row(
                            children: [
                              Icon(
                                Icons.call_rounded,
                                color: Colors.white,
                              ),
                              SizedBox(width: 10),
                              Text('고객센터',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                  )),
                              const Spacer(),
                              Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: Colors.white,
                                size: 20,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 40),
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "라이브러리",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              letterSpacing: -1.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),
                        GridView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: libraryImages.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 15,
                            crossAxisSpacing: 15,
                            childAspectRatio: 1,
                          ),
                          itemBuilder: (BuildContext context, int index) {
                            return ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: Image.asset(
                                libraryImages[index].assetPath,
                                fit: BoxFit.cover,
                              ),
                            );
                          },
                        ),
                        const SizedBox(height: 100.0),
                      ]),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
