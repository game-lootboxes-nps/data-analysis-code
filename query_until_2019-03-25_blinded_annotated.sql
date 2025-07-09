SELECT
  TO_HEX(SHA256(CAST(a.uid AS STRING))) uid, # hashed unique user identifier
  a.date daily_date, # calendar date
  a.total_daily_gross_revenue, # gross revenue / $ spent by the user on the day
  a.total_play_time, # total time spent playing by the user on the day
  a.gem_spend, # how many gems (the game's main premium currency sold in in-app purchases) did the user spend on loot boxes that day
  a.dmo, # model of the device used for playing
  a.dos, # operating system of the device used for playing
  a.co, # country the user was playing from
  a.ujd, # when did the user first start playing the game
  b.date survey_date, # date of survey response, missing if no survey active or user did not respond
  b.survey_name, # type of survey run/responded to
  b.rating_response # user's response; subtract 1 to get the values shown in the app and commonly used to calculate nps
FROM
(SELECT
  *
FROM
  `XXX-analytics.com_XXX.daily`
WHERE
  uid IN (SELECT DISTINCT uid FROM `XXX-analytics.com_XXX.daily` WHERE date >= DATE('2019-03-04') AND date <= DATE('2019-03-06')) ) a
LEFT JOIN
(SELECT
  *
FROM
  `XXX-analytics.DAILY_INGAME_SURVEY_RESPONSES.daily_ingame_survey_responses_*`
WHERE
  _TABLE_SUFFIX >= REGEXP_REPLACE( CAST( PARSE_DATE('%Y-%m-%d',
               CAST(DATE_ADD(CURRENT_DATE(), INTERVAL -60 DAY) AS STRING)) AS STRING), r'-', '')
  AND _TABLE_SUFFIX <= REGEXP_REPLACE( CAST( PARSE_DATE('%Y-%m-%d',
               CAST(DATE_ADD(CURRENT_DATE(), INTERVAL 0 DAY) AS STRING)) AS STRING), r'-', '')
  AND survey_name like '%NPS%') b
ON
  a.uid=b.uid
  AND a.date=b.date