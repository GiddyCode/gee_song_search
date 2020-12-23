import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gee_song_search/gee_song_screen.dart';
import 'package:gee_song_search/viewmodels/gee_home_vm.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Homepage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final vm = useProvider(homeViewModel);
    return ProviderListener<HomeViewModel>(
      provider: homeViewModel,
      onChange: (context, vm) {
        if (vm.success) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => SongScreen(song: vm.currentSong)));
        }
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Tap to Shazam',
                style: TextStyle(color: Colors.white, fontSize: 20.0),
              ),
              SizedBox(
                height: 40,
              ),
              AvatarGlow(
                endRadius: 200.0,
                animate: vm.isRecognizing,
                child: GestureDetector(
                  onTap: () => vm.isRecognizing
                      ? vm.stopRecognizing()
                      : vm.startRecognizing(),
                  child: Material(
                    shape: CircleBorder(),
                    elevation: 8,
                    child: Container(
                      padding: EdgeInsets.all(40.0),
                      height: 200,
                      width: 200,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black26,
                      ),
                      child: Image.asset(
                        'assets/images/image.png',
                        color: Colors.yellow,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
