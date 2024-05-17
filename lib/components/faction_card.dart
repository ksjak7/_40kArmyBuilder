import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../enums.dart';
import '../models/faction_data.dart';



Map<Faction, FactionData> factionMap = {
  //marines
  Faction.adeptusAstartes: FactionData("Adeptus Astartes", "adeptus_astartes", Colors.white),
  Faction.blackTemplars: FactionData("Black Templars", "black_templars", Colors.white),
  Faction.bloodAngels: FactionData("Blood Angels", "blood_angels", Colors.white),
  Faction.darkAngels: FactionData("Dark Angels", "dark_angels", Colors.white),
  Faction.deathwatch: FactionData("Deathwatch", "deathwatch", Colors.white),
  Faction.greyKnights: FactionData("Grey Knights", "grey_knights", Colors.white),
  Faction.spaceWolves: FactionData("Space Wolves", "space_wolves", Colors.white),
  //chaos
  Faction.chaosDaemons: FactionData("Chaos Daemons", "chaos_daemons", Colors.white),
  Faction.deathGuard: FactionData("Death Guard", "death_guard", Colors.white),
  Faction.hereticAstartes: FactionData("Heretic Astartes", "heretic_astartes", Colors.white),
  Faction.questorTraitoris: FactionData("Questor Traitoris", "questor_traitoris", Colors.white),
  Faction.thousandSons: FactionData("Thousand Sons", "thousand_sons", Colors.white),
  Faction.worldEaters: FactionData("World Eaters", "world_eaters", Colors.white),
  //xenos
  Faction.aeldari: FactionData("Aeldari", "aeldari", Colors.white),
  Faction.drukhari: FactionData("Drukhari", "drukhari", Colors.white),
  Faction.genestealerCults: FactionData("Genestealer Cults", "genestealer_cults", Colors.white),
  Faction.leaguesOfVotann: FactionData("Leagues of Votann", "leagues_of_votann", Colors.white),
  Faction.necrons: FactionData("Necrons", "necrons", Colors.white),
  Faction.orks: FactionData("Orks", "orks", Colors.white),
  Faction.tauEmpire: FactionData("T'au Empire", "tau_empire", Colors.white),
  Faction.tyranids: FactionData("Tyranids", "tyranids", Colors.white),
  //imperium
  Faction.adeptaSororitas: FactionData("Adepta Sororitas", "adepta_sororitas", Colors.white),
  Faction.adeptusCustodes: FactionData("Adeptus Custodes", "adeptus_custodes", Colors.white),
  Faction.adeptusMechanicus: FactionData("Adeptus Mechanicus", "adeptus_mechanicus", Colors.white),
  Faction.astraMilitarum: FactionData("Astra Militarum", "astra_militarum", Colors.white),
  Faction.imperialKnights: FactionData("Imperial Knights", "imperial_knights", Colors.white),
  Faction.imperiumOfMan: FactionData("Imperium of Man", "imperium_of_man", Colors.white),
};

Container factionCard(BuildContext context, Faction faction) {
  Size size = MediaQuery.of(context).size;
  return Container(
    constraints: BoxConstraints.tight(Size(size.width, 10)),
    color: const Color.fromARGB(255, 50, 50, 50),
    margin: const EdgeInsets.symmetric(
      horizontal: 20,
      vertical: 2,
    ),
    padding: const EdgeInsetsDirectional.symmetric(
      horizontal: 15,
      vertical: 10,
    ),
    child: Column(
      children: [
        SvgPicture.asset(
          'assets/factions/${factionMap[faction]!.snakeCase}.svg',
          width: 36,
          height: 36,
          colorFilter:
            ColorFilter.mode(factionMap[faction]!.iconColor, BlendMode.srcIn),
        ),
        Text(factionMap[faction]!.name),
      ],
    ),
  );
}
