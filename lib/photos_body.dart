import 'package:flutter/material.dart';
import 'controller/album_controller.dart';
import 'detail_page.dart';
import 'api/post_service.dart';
import 'package:provider/provider.dart';
import 'topbar.dart';

class PhotosBody extends StatelessWidget {
  const PhotosBody({super.key});

  @override
  Widget build(BuildContext context) {
    final albumProviders = Provider.of<AlbumDetailProvider>(context);
    return Padding(
      padding: const EdgeInsets.only(top: 24),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const TopBar(),
            SizedBox(
              child: FutureBuilder(
                future: getAlbumData(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: snapshot.data?.length ?? 0,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            if (snapshot.hasData) {
                              albumProviders.selectAlbum(
                                snapshot.data![index],
                              );
                            }
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const DetailPage(),
                              ),
                            );
                          },
                          child: Card(
                            elevation: 2, // Menambahkan sedikit elevasi
                            margin: const EdgeInsets.symmetric(
                                vertical: 4,
                                horizontal:
                                    8), // Menambahkan margin di sekitar card
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(
                                  8), // Border radius untuk membuat tepi card lebih halus
                              child: Container(
                                color: Colors.grey.shade200,
                                padding: const EdgeInsets.all(
                                    8), // Padding di dalam card
                                child: Column(
                                  children: [
                                    ListTile(
                                      title: Text(
                                        snapshot.data?[index].title ??
                                            '_', // Menghilangkan force unwrapping
                                        style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black87,
                                        ),
                                        maxLines: 2,
                                        overflow: TextOverflow
                                            .ellipsis, // Menambahkan overflow behavior
                                      ),
                                      leading: Text(
                                          snapshot.data?[index].id.toString() ??
                                              '_'),
                                    ),
                                    const Divider(
                                        height:
                                            1), // Menggunakan Divider daripada Container
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  } else if (snapshot.hasError) {
                    return const Text("Snapshot Error");
                  }
                  // By default, show a loading spinner.
                  return const CircularProgressIndicator();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
