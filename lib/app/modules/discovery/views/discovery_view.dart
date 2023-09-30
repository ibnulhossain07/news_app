import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/discovery_controller.dart';

class DiscoveryView extends GetView<DiscoveryController> {
  const DiscoveryView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DiscoveryView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'DiscoveryView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
