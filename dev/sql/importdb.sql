SELECT
  accident_injury.summary_nr
 ,accident.event_date
 ,accident_injury.event_type
 ,evCodes.evTitle
 ,accident.event_keyword
 ,accident_injury.part_of_body
 ,partCodes.partTitle
 ,accident_injury.nature_of_inj
 ,natCodes.natTitle
 ,accident_injury.src_of_injury
 ,srcCodes.srcTitle
 ,accident_injury.degree_of_inj
 ,degCodes.degTitle
 ,accident_injury.rel_insp_nr
 ,inspection.activity_nr
 ,inspection.site_state
 ,inspection.site_city
 ,inspection.estab_name
 ,inspection.naics_code
FROM dbo.accident_injury
LEFT OUTER JOIN dbo.evCodes
  ON accident_injury.event_type = evCodes.code
LEFT OUTER JOIN dbo.natCodes
  ON accident_injury.nature_of_inj = natCodes.code
LEFT OUTER JOIN dbo.partCodes
  ON accident_injury.part_of_body = partCodes.code
LEFT OUTER JOIN dbo.srcCodes
  ON accident_injury.src_of_injury = srcCodes.code
LEFT OUTER JOIN dbo.degCodes
  ON accident_injury.degree_of_inj = degCodes.code
INNER JOIN dbo.accident
  ON accident_injury.summary_nr = accident.summary_nr
INNER JOIN dbo.inspection
  ON accident_injury.rel_insp_nr = inspection.activity_nr
