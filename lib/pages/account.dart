import "package:flutter/material.dart";

import "../i18n/strings.g.dart";

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(tr.pages.account),
      ),
      body: const Placeholder(),
    );
  }
}
