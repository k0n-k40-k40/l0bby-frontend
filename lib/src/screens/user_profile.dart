import 'package:flutter/material.dart';
import '../components/navigation_bar.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: Colors.black,
        bottomNavigationBar: CustomNavigationBar(
          currentIndex: 3,
        ),
        body: SingleChildScrollView(
            child: Column(
          children: [
            _ProfileInformation(
                name: 'Nguyễn Tiến Minh',
                role: 'Vận động viên cầu lông',
                image: 'lib/assets/images/avt.png',
                posts: 6,
                followers: 125,
                following: 105),
            // _ProfileContent()
            SizedBox(height: 30),
            _ProfileContent(
              posts: [
                'lib/assets/images/post1.png',
                'lib/assets/images/post2.png',
                'lib/assets/images/post3.png',
                'lib/assets/images/post4.png',
                'lib/assets/images/post5.png',
              ],
            ),
          ],
        )));
  }
}

class _ProfileInformation extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final name;
  // ignore: prefer_typing_uninitialized_variables
  final role;
  // ignore: prefer_typing_uninitialized_variables
  final image;
  // ignore: prefer_typing_uninitialized_variables
  final posts;
  // ignore: prefer_typing_uninitialized_variables
  final followers;
  // ignore: prefer_typing_uninitialized_variables
  final following;

  const _ProfileInformation(
      {this.name,
      this.role,
      this.image,
      this.posts,
      this.followers,
      this.following});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const SizedBox(height: 60),
      CircleAvatar(
        radius: 60,
        backgroundColor: Colors.white,
        backgroundImage: AssetImage(image),
      ),
      const SizedBox(height: 20),
      Text(
        name,
        style: const TextStyle(color: Colors.white, fontSize: 24),
      ),
      // const SizedBox(height: ),
      Text(
        role,
        // style: const TextStyle(color: Colors.white),
        //color for subtitle, grey
        style: const TextStyle(color: Colors.grey),
      ),
      const SizedBox(height: 60),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: [
            _buildUserInfo(context, 'Bài viết', '$posts'),
            _buildUserInfo(context, 'Người theo dõi', '$followers'),
            _buildUserInfo(context, 'Đang theo dõi', '$following'),
          ],
        ),
      )
    ]);
  }
}

Expanded _buildUserInfo(BuildContext context, var type, var value) {
  return Expanded(
    child: Column(
      children: [
        Text(
          type,
          style: const TextStyle(color: Colors.grey),
        ),
        const SizedBox(height: 5),
        Text(
          value,
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ],
    ),
  );

  // @override
  // Widget build(BuildContext context) {
  //   return Column(
  //     children: [
  //       Text(
  //         name,
  //         style: const TextStyle(
  //             color: Colors.white, fontWeight: FontWeight.bold),
  //       ),
  //       const SizedBox(height: 5),
  //       Text(
  //         role,
  //         style: const TextStyle(color: Colors.white),
  //       ),
  //     ],
  //   );
  // }
}

class _ProfileContent extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final List<String> posts;

  const _ProfileContent({
    required this.posts,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: posts.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 4,
            mainAxisSpacing: 4,
          ),
          itemBuilder: (context, index) {
            return Image.asset(posts[index], fit: BoxFit.cover);
          },
        )
      ],
    );
  }
}
