SELECT tip_drehi, COUNT(*)
FROM zaemaniq z
inner JOIN oborudvane o on O.ID = z.oborudvane_id
group by tip_drehi
