import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../enums.dart';
import '../models/faction_data.dart';

Map<Faction, FactionData> factionMap = {
  //marines
  Faction.adeptusAstartes: FactionData("Adeptus Astartes", "adeptus_astartes", const Color(0xFF2D567C)), //Macragge Blue
  Faction.blackTemplars: FactionData("Black Templars", "black_templars", const Color(0xFF412A7A)), //Nauseating Blue
  Faction.bloodAngels: FactionData("Blood Angels", "blood_angels", const Color(0xFFC21920)), //Blood Red
  Faction.darkAngels: FactionData("Dark Angels", "dark_angels", const Color(0xFF005221)), //Caliban Green 
  Faction.deathwatch: FactionData("Deathwatch", "deathwatch", const Color(0xFF393939)), //Leadbelcher
  Faction.greyKnights: FactionData("Grey Knights", "grey_knights", const Color(0xFF8BB9DD)), //Tectis Blue
  Faction.spaceWolves: FactionData("Space Wolves", "space_wolves", const Color(0xFFCEDEE7)), //Space Wolves Grey
  //chaos
  Faction.chaosDaemons: FactionData("Chaos Daemons", "chaos_daemons", const Color(0xFF6A0002)), //Khorne Red 
  Faction.deathGuard: FactionData("Death Guard", "death_guard", const Color(0xFF849B63)), //Nurgling Green 
  Faction.hereticAstartes: FactionData("Heretic Astartes", "heretic_astartes", const Color(0xFF991115)), //Mephiston Red 
  Faction.questorTraitoris: FactionData("Questor Traitoris", "questor_traitoris", const Color(0xFFEFD9A8)), // Ushabti Bone 
  Faction.thousandSons: FactionData("Thousand Sons", "thousand_sons", const Color(0xFF00506F)), //Thousand Sons Blue
  Faction.worldEaters: FactionData("World Eaters", "world_eaters", const Color(0xFF6A0002)), //Khorne Red
  //xenos
  Faction.aeldari: FactionData("Aeldari", "aeldari", const Color(0xFF31639C)), //Caledor Sky
  Faction.drukhari: FactionData("Drukhari", "drukhari", const Color(0xFF082E32)), //Incubi Darkness 
  Faction.genestealerCults: FactionData("Genestealer Cults", "genestealer_cults", const Color(0xFF451636)), //Barak-Nar Burgundy
  Faction.leaguesOfVotann: FactionData("Leagues of Votann", "leagues_of_votann", const Color(0xFF108473)), //Dark Green Ink
  Faction.necrons: FactionData("Necrons", "necrons", const Color(0xFFA5D610)), // Moot Green
  Faction.orks: FactionData("Orks", "orks", const Color(0xFF63B521)), //Warboss Green 
  Faction.tauEmpire: FactionData("T'au Empire", "tau_empire", const Color(0xFFDE9408)), //Tau Light Ochre
  Faction.tyranids: FactionData("Tyranids", "tyranids", const Color(0xFF562F7E)), //Naggaroth Night 
  //imperium
  Faction.adeptaSororitas: FactionData("Adepta Sororitas", "adepta_sororitas", const Color(0xFF630808)), //Carroburg Crimson
  Faction.adeptusCustodes: FactionData("Adeptus Custodes", "adeptus_custodes", const Color(0xFFE7BD42)), //Auric Armour Gold
  Faction.adeptusMechanicus: FactionData("Adeptus Mechanicus", "adeptus_mechanicus", const Color(0xFF7C8286)), //Mechanicus Standard Grey
  Faction.astraMilitarum: FactionData("Astra Militarum", "astra_militarum", const Color(0xFF434F38)), //Loren Forest
  Faction.imperialKnights: FactionData("Imperial Knights", "imperial_knights", const Color(0xFF2D567C)), //Macragge Blue
  Faction.imperiumOfMan: FactionData("Imperium of Man", "imperium_of_man", const Color(0xFF29397B)), //Altdorf Guard Blue
};

Container factionCard(BuildContext context, Faction faction) {
  return Container(
    color: Colors.black,
    margin: const EdgeInsets.symmetric(
      horizontal: 0,
      vertical: 2,
    ),
    padding: const EdgeInsetsDirectional.symmetric(
      horizontal: 15,
      vertical: 10,
    ),
    child: GestureDetector(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          color: factionMap[faction]!.iconColor,
          borderRadius: const BorderRadius.all(Radius.circular(20))
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 10,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/factions/${factionMap[faction]!.snakeCase}.svg',
              width: 48,
              height: 48,
            ),
            Text(
              factionMap[faction]!.name,
              style: const TextStyle(
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
