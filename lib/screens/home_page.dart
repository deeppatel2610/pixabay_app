import 'package:flutter/material.dart';
import 'package:pixabay_app/provider/home_provider.dart';
import 'package:provider/provider.dart';

TextEditingController txtSearch = TextEditingController();

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: const Text(
          'Pixabay',
          style: TextStyle(
            color: Colors.black,
            fontSize: 25,
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
          ),
        ),
      ),
      body: Consumer<HomeProvider>(
        builder: (context, provider, child) {
          if (provider.pixabayModel != null) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
                  child: TextField(
                    style: const TextStyle(color: Colors.white60),
                    controller: txtSearch,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: () {
                          Provider.of<HomeProvider>(context, listen: false)
                              .fetchSearch(txtSearch.text);
                        },
                        icon: const Icon(
                          Icons.search,
                          color: Colors.white60,
                        ),
                      ),
                      hintText: 'Search',
                      hintStyle: const TextStyle(fontSize: 17),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white60),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white60),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: provider.pixabayModel!.hits!.length,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: double.infinity,
                        height: 400,
                        decoration: BoxDecoration(
                          color: Colors.white12,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.white10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              ListTile(
                                leading: CircleAvatar(
                                  radius: 22,
                                  backgroundImage: NetworkImage(
                                    provider
                                        .pixabayModel!.hits![index].userImageURL
                                        .toString(),
                                  ),
                                ),
                                title: Text(
                                  provider.pixabayModel!.hits![index].user
                                      .toString(),
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 18),
                                ),
                                subtitle: Text(
                                  provider.pixabayModel!.hits![index].tags
                                      .toString(),
                                  style: const TextStyle(color: Colors.white60),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                height: 250,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      provider.pixabayModel!.hits![index]
                                          .largeImageURL
                                          .toString(),
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.favorite,
                                    color: Colors.red,
                                    size: 30,
                                  ),
                                  const SizedBox(
                                    width: 2.5,
                                  ),
                                  Text(
                                    provider.pixabayModel!.hits![index].likes
                                        .toString(),
                                    style: const TextStyle(
                                      color: Colors.white60,
                                      fontSize: 18,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  const Icon(
                                    color: Colors.white60,
                                    Icons.comment_outlined,
                                    size: 30,
                                  ),
                                  const SizedBox(
                                    width: 2.5,
                                  ),
                                  Text(
                                    provider.pixabayModel!.hits![index].comments
                                        .toString(),
                                    style: const TextStyle(
                                      color: Colors.white60,
                                      fontSize: 18,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  const Icon(
                                    color: Colors.white60,
                                    Icons.download_for_offline_outlined,
                                    size: 30,
                                  ),
                                  const SizedBox(
                                    width: 2.5,
                                  ),
                                  Text(
                                    provider
                                        .pixabayModel!.hits![index].downloads
                                        .toString(),
                                    style: const TextStyle(
                                      color: Colors.white60,
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
