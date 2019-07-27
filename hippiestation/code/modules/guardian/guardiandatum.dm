// why does this exist? simply so stands show up on roundend screen.

/datum/antagonist/stand
	name = "Stand"
	show_in_antagpanel = FALSE
	var/datum/guardian_stats/stats
	var/summoner

/datum/antagonist/stand/roundend_report()
	var/list/parts = list()
	parts += ..()
	if(summoner)
		parts += "<B>SUMMONER</B>: [summoner]"
	if(stats)
		parts += "<b>DAMAGE:</b> [level_to_grade(stats.damage)]"
		parts += "<b>DEFENSE:</b> [level_to_grade(stats.defense)]"
		parts += "<b>SPEED:</b> [level_to_grade(stats.speed)]"
		parts += "<b>POTENTIAL:</b> [level_to_grade(stats.potential)]"
		parts += "<b>RANGE:</b> [level_to_grade(stats.range)]"
		if(stats.ability)
			parts += "<b>SPECIAL ABILITY:</b> [stats.ability.name]"
		for(var/datum/guardian_ability/minor/M in stats.minor_abilities)
			parts += "<b>MINOR ABILITY:</b> [M.name]"
	return parts.Join("<br>")

/datum/antagonist/stand/antag_panel_data()
	var/mob/living/simple_animal/hostile/guardian/G = owner.current
	return "<B>Summoner: [G.summoner]/([G.summoner.ckey])</B>"
