import 'package:flutter/material.dart';
import 'package:warhammer_army_app/components/faction_card.dart';

import '../enums.dart';

CustomScrollView factionList(BuildContext context, List<Faction> factions) {
  List<Widget> cards = [];
  for (Faction faction in factions) {
    cards.add(factionCard(context, faction));
  }
  return CustomScrollView(
    slivers: [
      SliverList(
        delegate: SliverChildListDelegate(cards),
      ),
    ],
  );
}
