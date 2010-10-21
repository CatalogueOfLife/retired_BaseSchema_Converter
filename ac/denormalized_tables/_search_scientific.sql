ALTER TABLE `_search_scientific` DISABLE KEYS;

INSERT INTO `_search_scientific`
(`id`,`kingdom`,`phylum`,`class`,`order`,`superfamily`,`family`,`genus`,`subgenus`,`species`,`infraspecies`,`source_database_id`)

SELECT
IF(t1.`id` IS NOT NULL, t1.`id`,
 IF(t2.`id` IS NOT NULL, t2.`id`,
  IF(t3.`id` IS NOT NULL, t3.`id`,
   IF(t4.`id` IS NOT NULL, t4.`id`,
    IF(t5.`id` IS NOT NULL, t5.`id`,
     IF(t6.`id` IS NOT NULL, t6.`id`,
      IF(t7.`id` IS NOT NULL, t7.`id`,
       IF(t8.`id` IS NOT NULL, t8.`id`,
        IF(t9.`id` IS NOT NULL, t9.`id`,
         IF(t10.`id` IS NOT NULL, t10.`id`,
          IF(t11.`id` IS NOT NULL, t11.`id`,
           IF(t12.`id` IS NOT NULL, t12.`id`,
            IF(t13.`id` IS NOT NULL, t13.`id`,
             IF(t14.`id` IS NOT NULL, t14.`id`,
              IF(t15.`id` IS NOT NULL, t15.`id`,NULL
))))))))))))))) AS id,
IF(t1.`taxonomic_rank_id` = 54, CONCAT(UCASE(SUBSTRING(sne1.`name_element`, 1, 1)),LOWER(SUBSTRING(sne1.`name_element`, 2))),
 IF(t2.`taxonomic_rank_id` = 54, CONCAT(UCASE(SUBSTRING(sne2.`name_element`, 1, 1)),LOWER(SUBSTRING(sne2.`name_element`, 2))),
  IF(t3.`taxonomic_rank_id` = 54, CONCAT(UCASE(SUBSTRING(sne3.`name_element`, 1, 1)),LOWER(SUBSTRING(sne3.`name_element`, 2))),
   IF(t4.`taxonomic_rank_id` = 54, CONCAT(UCASE(SUBSTRING(sne4.`name_element`, 1, 1)),LOWER(SUBSTRING(sne4.`name_element`, 2))),
    IF(t5.`taxonomic_rank_id` = 54, CONCAT(UCASE(SUBSTRING(sne5.`name_element`, 1, 1)),LOWER(SUBSTRING(sne5.`name_element`, 2))),
     IF(t6.`taxonomic_rank_id` = 54, CONCAT(UCASE(SUBSTRING(sne6.`name_element`, 1, 1)),LOWER(SUBSTRING(sne6.`name_element`, 2))),
      IF(t7.`taxonomic_rank_id` = 54, CONCAT(UCASE(SUBSTRING(sne7.`name_element`, 1, 1)),LOWER(SUBSTRING(sne7.`name_element`, 2))),
       IF(t8.`taxonomic_rank_id` = 54, CONCAT(UCASE(SUBSTRING(sne8.`name_element`, 1, 1)),LOWER(SUBSTRING(sne8.`name_element`, 2))),
        IF(t9.`taxonomic_rank_id` = 54, CONCAT(UCASE(SUBSTRING(sne9.`name_element`, 1, 1)),LOWER(SUBSTRING(sne9.`name_element`, 2))),
         IF(t10.`taxonomic_rank_id` = 54, CONCAT(UCASE(SUBSTRING(sne10.`name_element`, 1, 1)),LOWER(SUBSTRING(sne10.`name_element`, 2))),
          IF(t11.`taxonomic_rank_id` = 54, CONCAT(UCASE(SUBSTRING(sne11.`name_element`, 1, 1)),LOWER(SUBSTRING(sne11.`name_element`, 2))),
           IF(t12.`taxonomic_rank_id` = 54, CONCAT(UCASE(SUBSTRING(sne12.`name_element`, 1, 1)),LOWER(SUBSTRING(sne12.`name_element`, 2))),
            IF(t13.`taxonomic_rank_id` = 54, CONCAT(UCASE(SUBSTRING(sne13.`name_element`, 1, 1)),LOWER(SUBSTRING(sne13.`name_element`, 2))),
             IF(t14.`taxonomic_rank_id` = 54, CONCAT(UCASE(SUBSTRING(sne14.`name_element`, 1, 1)),LOWER(SUBSTRING(sne14.`name_element`, 2))),
              IF(t15.`taxonomic_rank_id` = 54, CONCAT(UCASE(SUBSTRING(sne15.`name_element`, 1, 1)),LOWER(SUBSTRING(sne15.`name_element`, 2))),NULL
))))))))))))))) AS kingdom,
IF(t1.`taxonomic_rank_id` = 76, CONCAT(UCASE(SUBSTRING(sne1.`name_element`, 1, 1)),LOWER(SUBSTRING(sne1.`name_element`, 2))),
 IF(t2.`taxonomic_rank_id` = 76, CONCAT(UCASE(SUBSTRING(sne2.`name_element`, 1, 1)),LOWER(SUBSTRING(sne2.`name_element`, 2))),
  IF(t3.`taxonomic_rank_id` = 76, CONCAT(UCASE(SUBSTRING(sne3.`name_element`, 1, 1)),LOWER(SUBSTRING(sne3.`name_element`, 2))),
   IF(t4.`taxonomic_rank_id` = 76, CONCAT(UCASE(SUBSTRING(sne4.`name_element`, 1, 1)),LOWER(SUBSTRING(sne4.`name_element`, 2))),
    IF(t5.`taxonomic_rank_id` = 76, CONCAT(UCASE(SUBSTRING(sne5.`name_element`, 1, 1)),LOWER(SUBSTRING(sne5.`name_element`, 2))),
     IF(t6.`taxonomic_rank_id` = 76, CONCAT(UCASE(SUBSTRING(sne6.`name_element`, 1, 1)),LOWER(SUBSTRING(sne6.`name_element`, 2))),
      IF(t7.`taxonomic_rank_id` = 76, CONCAT(UCASE(SUBSTRING(sne7.`name_element`, 1, 1)),LOWER(SUBSTRING(sne7.`name_element`, 2))),
       IF(t8.`taxonomic_rank_id` = 76, CONCAT(UCASE(SUBSTRING(sne8.`name_element`, 1, 1)),LOWER(SUBSTRING(sne8.`name_element`, 2))),
        IF(t9.`taxonomic_rank_id` = 76, CONCAT(UCASE(SUBSTRING(sne9.`name_element`, 1, 1)),LOWER(SUBSTRING(sne9.`name_element`, 2))),
         IF(t10.`taxonomic_rank_id` = 76, CONCAT(UCASE(SUBSTRING(sne10.`name_element`, 1, 1)),LOWER(SUBSTRING(sne10.`name_element`, 2))),
          IF(t11.`taxonomic_rank_id` = 76, CONCAT(UCASE(SUBSTRING(sne11.`name_element`, 1, 1)),LOWER(SUBSTRING(sne11.`name_element`, 2))),
           IF(t12.`taxonomic_rank_id` = 76, CONCAT(UCASE(SUBSTRING(sne12.`name_element`, 1, 1)),LOWER(SUBSTRING(sne12.`name_element`, 2))),
            IF(t13.`taxonomic_rank_id` = 76, CONCAT(UCASE(SUBSTRING(sne13.`name_element`, 1, 1)),LOWER(SUBSTRING(sne13.`name_element`, 2))),
             IF(t14.`taxonomic_rank_id` = 76, CONCAT(UCASE(SUBSTRING(sne14.`name_element`, 1, 1)),LOWER(SUBSTRING(sne14.`name_element`, 2))),
              IF(t15.`taxonomic_rank_id` = 76, CONCAT(UCASE(SUBSTRING(sne15.`name_element`, 1, 1)),LOWER(SUBSTRING(sne15.`name_element`, 2))),NULL
))))))))))))))) AS phylum,
IF(t1.`taxonomic_rank_id` = 6, CONCAT(UCASE(SUBSTRING(sne1.`name_element`, 1, 1)),LOWER(SUBSTRING(sne1.`name_element`, 2))),
 IF(t2.`taxonomic_rank_id` = 6, CONCAT(UCASE(SUBSTRING(sne2.`name_element`, 1, 1)),LOWER(SUBSTRING(sne2.`name_element`, 2))),
  IF(t3.`taxonomic_rank_id` = 6, CONCAT(UCASE(SUBSTRING(sne3.`name_element`, 1, 1)),LOWER(SUBSTRING(sne3.`name_element`, 2))),
   IF(t4.`taxonomic_rank_id` = 6, CONCAT(UCASE(SUBSTRING(sne4.`name_element`, 1, 1)),LOWER(SUBSTRING(sne4.`name_element`, 2))),
    IF(t5.`taxonomic_rank_id` = 6, CONCAT(UCASE(SUBSTRING(sne5.`name_element`, 1, 1)),LOWER(SUBSTRING(sne5.`name_element`, 2))),
     IF(t6.`taxonomic_rank_id` = 6, CONCAT(UCASE(SUBSTRING(sne6.`name_element`, 1, 1)),LOWER(SUBSTRING(sne6.`name_element`, 2))),
      IF(t7.`taxonomic_rank_id` = 6, CONCAT(UCASE(SUBSTRING(sne7.`name_element`, 1, 1)),LOWER(SUBSTRING(sne7.`name_element`, 2))),
       IF(t8.`taxonomic_rank_id` = 6, CONCAT(UCASE(SUBSTRING(sne8.`name_element`, 1, 1)),LOWER(SUBSTRING(sne8.`name_element`, 2))),
        IF(t9.`taxonomic_rank_id` = 6, CONCAT(UCASE(SUBSTRING(sne9.`name_element`, 1, 1)),LOWER(SUBSTRING(sne9.`name_element`, 2))),
         IF(t10.`taxonomic_rank_id` = 6, CONCAT(UCASE(SUBSTRING(sne10.`name_element`, 1, 1)),LOWER(SUBSTRING(sne10.`name_element`, 2))),
          IF(t11.`taxonomic_rank_id` = 6, CONCAT(UCASE(SUBSTRING(sne11.`name_element`, 1, 1)),LOWER(SUBSTRING(sne11.`name_element`, 2))),
           IF(t12.`taxonomic_rank_id` = 6, CONCAT(UCASE(SUBSTRING(sne12.`name_element`, 1, 1)),LOWER(SUBSTRING(sne12.`name_element`, 2))),
            IF(t13.`taxonomic_rank_id` = 6, CONCAT(UCASE(SUBSTRING(sne13.`name_element`, 1, 1)),LOWER(SUBSTRING(sne13.`name_element`, 2))),
             IF(t14.`taxonomic_rank_id` = 6, CONCAT(UCASE(SUBSTRING(sne14.`name_element`, 1, 1)),LOWER(SUBSTRING(sne14.`name_element`, 2))),
              IF(t15.`taxonomic_rank_id` = 6, CONCAT(UCASE(SUBSTRING(sne15.`name_element`, 1, 1)),LOWER(SUBSTRING(sne15.`name_element`, 2))),NULL
))))))))))))))) AS class,
IF(t1.`taxonomic_rank_id` = 72, CONCAT(UCASE(SUBSTRING(sne1.`name_element`, 1, 1)),LOWER(SUBSTRING(sne1.`name_element`, 2))),
 IF(t2.`taxonomic_rank_id` = 72, CONCAT(UCASE(SUBSTRING(sne2.`name_element`, 1, 1)),LOWER(SUBSTRING(sne2.`name_element`, 2))),
  IF(t3.`taxonomic_rank_id` = 72, CONCAT(UCASE(SUBSTRING(sne3.`name_element`, 1, 1)),LOWER(SUBSTRING(sne3.`name_element`, 2))),
   IF(t4.`taxonomic_rank_id` = 72, CONCAT(UCASE(SUBSTRING(sne4.`name_element`, 1, 1)),LOWER(SUBSTRING(sne4.`name_element`, 2))),
    IF(t5.`taxonomic_rank_id` = 72, CONCAT(UCASE(SUBSTRING(sne5.`name_element`, 1, 1)),LOWER(SUBSTRING(sne5.`name_element`, 2))),
     IF(t6.`taxonomic_rank_id` = 72, CONCAT(UCASE(SUBSTRING(sne6.`name_element`, 1, 1)),LOWER(SUBSTRING(sne6.`name_element`, 2))),
      IF(t7.`taxonomic_rank_id` = 72, CONCAT(UCASE(SUBSTRING(sne7.`name_element`, 1, 1)),LOWER(SUBSTRING(sne7.`name_element`, 2))),
       IF(t8.`taxonomic_rank_id` = 72, CONCAT(UCASE(SUBSTRING(sne8.`name_element`, 1, 1)),LOWER(SUBSTRING(sne8.`name_element`, 2))),
        IF(t9.`taxonomic_rank_id` = 72, CONCAT(UCASE(SUBSTRING(sne9.`name_element`, 1, 1)),LOWER(SUBSTRING(sne9.`name_element`, 2))),
         IF(t10.`taxonomic_rank_id` = 72, CONCAT(UCASE(SUBSTRING(sne10.`name_element`, 1, 1)),LOWER(SUBSTRING(sne10.`name_element`, 2))),
          IF(t11.`taxonomic_rank_id` = 72, CONCAT(UCASE(SUBSTRING(sne11.`name_element`, 1, 1)),LOWER(SUBSTRING(sne11.`name_element`, 2))),
           IF(t12.`taxonomic_rank_id` = 72, CONCAT(UCASE(SUBSTRING(sne12.`name_element`, 1, 1)),LOWER(SUBSTRING(sne12.`name_element`, 2))),
            IF(t13.`taxonomic_rank_id` = 72, CONCAT(UCASE(SUBSTRING(sne13.`name_element`, 1, 1)),LOWER(SUBSTRING(sne13.`name_element`, 2))),
             IF(t14.`taxonomic_rank_id` = 72, CONCAT(UCASE(SUBSTRING(sne14.`name_element`, 1, 1)),LOWER(SUBSTRING(sne14.`name_element`, 2))),
              IF(t15.`taxonomic_rank_id` = 72, CONCAT(UCASE(SUBSTRING(sne15.`name_element`, 1, 1)),LOWER(SUBSTRING(sne15.`name_element`, 2))),NULL
))))))))))))))) AS "order",
IF(t1.`taxonomic_rank_id` = 112, CONCAT(UCASE(SUBSTRING(sne1.`name_element`, 1, 1)),LOWER(SUBSTRING(sne1.`name_element`, 2))),
 IF(t2.`taxonomic_rank_id` = 112, CONCAT(UCASE(SUBSTRING(sne2.`name_element`, 1, 1)),LOWER(SUBSTRING(sne2.`name_element`, 2))),
  IF(t3.`taxonomic_rank_id` = 112, CONCAT(UCASE(SUBSTRING(sne3.`name_element`, 1, 1)),LOWER(SUBSTRING(sne3.`name_element`, 2))),
   IF(t4.`taxonomic_rank_id` = 112, CONCAT(UCASE(SUBSTRING(sne4.`name_element`, 1, 1)),LOWER(SUBSTRING(sne4.`name_element`, 2))),
    IF(t5.`taxonomic_rank_id` = 112, CONCAT(UCASE(SUBSTRING(sne5.`name_element`, 1, 1)),LOWER(SUBSTRING(sne5.`name_element`, 2))),
     IF(t6.`taxonomic_rank_id` = 112, CONCAT(UCASE(SUBSTRING(sne6.`name_element`, 1, 1)),LOWER(SUBSTRING(sne6.`name_element`, 2))),
      IF(t7.`taxonomic_rank_id` = 112, CONCAT(UCASE(SUBSTRING(sne7.`name_element`, 1, 1)),LOWER(SUBSTRING(sne7.`name_element`, 2))),
       IF(t8.`taxonomic_rank_id` = 112, CONCAT(UCASE(SUBSTRING(sne8.`name_element`, 1, 1)),LOWER(SUBSTRING(sne8.`name_element`, 2))),
        IF(t9.`taxonomic_rank_id` = 112, CONCAT(UCASE(SUBSTRING(sne9.`name_element`, 1, 1)),LOWER(SUBSTRING(sne9.`name_element`, 2))),
         IF(t10.`taxonomic_rank_id` = 112, CONCAT(UCASE(SUBSTRING(sne10.`name_element`, 1, 1)),LOWER(SUBSTRING(sne10.`name_element`, 2))),
          IF(t11.`taxonomic_rank_id` = 112, CONCAT(UCASE(SUBSTRING(sne11.`name_element`, 1, 1)),LOWER(SUBSTRING(sne11.`name_element`, 2))),
           IF(t12.`taxonomic_rank_id` = 112, CONCAT(UCASE(SUBSTRING(sne12.`name_element`, 1, 1)),LOWER(SUBSTRING(sne12.`name_element`, 2))),
            IF(t13.`taxonomic_rank_id` = 112, CONCAT(UCASE(SUBSTRING(sne13.`name_element`, 1, 1)),LOWER(SUBSTRING(sne13.`name_element`, 2))),
             IF(t14.`taxonomic_rank_id` = 112, CONCAT(UCASE(SUBSTRING(sne14.`name_element`, 1, 1)),LOWER(SUBSTRING(sne14.`name_element`, 2))),
              IF(t15.`taxonomic_rank_id` = 112, CONCAT(UCASE(SUBSTRING(sne15.`name_element`, 1, 1)),LOWER(SUBSTRING(sne15.`name_element`, 2))),NULL
))))))))))))))) AS superfamily,
IF(t1.`taxonomic_rank_id` = 17, CONCAT(UCASE(SUBSTRING(sne1.`name_element`, 1, 1)),LOWER(SUBSTRING(sne1.`name_element`, 2))),
 IF(t2.`taxonomic_rank_id` = 17, CONCAT(UCASE(SUBSTRING(sne2.`name_element`, 1, 1)),LOWER(SUBSTRING(sne2.`name_element`, 2))),
  IF(t3.`taxonomic_rank_id` = 17, CONCAT(UCASE(SUBSTRING(sne3.`name_element`, 1, 1)),LOWER(SUBSTRING(sne3.`name_element`, 2))),
   IF(t4.`taxonomic_rank_id` = 17, CONCAT(UCASE(SUBSTRING(sne4.`name_element`, 1, 1)),LOWER(SUBSTRING(sne4.`name_element`, 2))),
    IF(t5.`taxonomic_rank_id` = 17, CONCAT(UCASE(SUBSTRING(sne5.`name_element`, 1, 1)),LOWER(SUBSTRING(sne5.`name_element`, 2))),
     IF(t6.`taxonomic_rank_id` = 17, CONCAT(UCASE(SUBSTRING(sne6.`name_element`, 1, 1)),LOWER(SUBSTRING(sne6.`name_element`, 2))),
      IF(t7.`taxonomic_rank_id` = 17, CONCAT(UCASE(SUBSTRING(sne7.`name_element`, 1, 1)),LOWER(SUBSTRING(sne7.`name_element`, 2))),
       IF(t8.`taxonomic_rank_id` = 17, CONCAT(UCASE(SUBSTRING(sne8.`name_element`, 1, 1)),LOWER(SUBSTRING(sne8.`name_element`, 2))),
        IF(t9.`taxonomic_rank_id` = 17, CONCAT(UCASE(SUBSTRING(sne9.`name_element`, 1, 1)),LOWER(SUBSTRING(sne9.`name_element`, 2))),
         IF(t10.`taxonomic_rank_id` = 17, CONCAT(UCASE(SUBSTRING(sne10.`name_element`, 1, 1)),LOWER(SUBSTRING(sne10.`name_element`, 2))),
          IF(t11.`taxonomic_rank_id` = 17, CONCAT(UCASE(SUBSTRING(sne11.`name_element`, 1, 1)),LOWER(SUBSTRING(sne11.`name_element`, 2))),
           IF(t12.`taxonomic_rank_id` = 17, CONCAT(UCASE(SUBSTRING(sne12.`name_element`, 1, 1)),LOWER(SUBSTRING(sne12.`name_element`, 2))),
            IF(t13.`taxonomic_rank_id` = 17, CONCAT(UCASE(SUBSTRING(sne13.`name_element`, 1, 1)),LOWER(SUBSTRING(sne13.`name_element`, 2))),
             IF(t14.`taxonomic_rank_id` = 17, CONCAT(UCASE(SUBSTRING(sne14.`name_element`, 1, 1)),LOWER(SUBSTRING(sne14.`name_element`, 2))),
              IF(t15.`taxonomic_rank_id` = 17, CONCAT(UCASE(SUBSTRING(sne15.`name_element`, 1, 1)),LOWER(SUBSTRING(sne15.`name_element`, 2))),NULL
))))))))))))))) AS family,
IF(t1.`taxonomic_rank_id` = 20, CONCAT(UCASE(SUBSTRING(sne1.`name_element`, 1, 1)),LOWER(SUBSTRING(sne1.`name_element`, 2))),
 IF(t2.`taxonomic_rank_id` = 20, CONCAT(UCASE(SUBSTRING(sne2.`name_element`, 1, 1)),LOWER(SUBSTRING(sne2.`name_element`, 2))),
  IF(t3.`taxonomic_rank_id` = 20, CONCAT(UCASE(SUBSTRING(sne3.`name_element`, 1, 1)),LOWER(SUBSTRING(sne3.`name_element`, 2))),
   IF(t4.`taxonomic_rank_id` = 20, CONCAT(UCASE(SUBSTRING(sne4.`name_element`, 1, 1)),LOWER(SUBSTRING(sne4.`name_element`, 2))),
    IF(t5.`taxonomic_rank_id` = 20, CONCAT(UCASE(SUBSTRING(sne5.`name_element`, 1, 1)),LOWER(SUBSTRING(sne5.`name_element`, 2))),
     IF(t6.`taxonomic_rank_id` = 20, CONCAT(UCASE(SUBSTRING(sne6.`name_element`, 1, 1)),LOWER(SUBSTRING(sne6.`name_element`, 2))),
      IF(t7.`taxonomic_rank_id` = 20, CONCAT(UCASE(SUBSTRING(sne7.`name_element`, 1, 1)),LOWER(SUBSTRING(sne7.`name_element`, 2))),
       IF(t8.`taxonomic_rank_id` = 20, CONCAT(UCASE(SUBSTRING(sne8.`name_element`, 1, 1)),LOWER(SUBSTRING(sne8.`name_element`, 2))),
        IF(t9.`taxonomic_rank_id` = 20, CONCAT(UCASE(SUBSTRING(sne9.`name_element`, 1, 1)),LOWER(SUBSTRING(sne9.`name_element`, 2))),
         IF(t10.`taxonomic_rank_id` = 20, CONCAT(UCASE(SUBSTRING(sne10.`name_element`, 1, 1)),LOWER(SUBSTRING(sne10.`name_element`, 2))),
          IF(t11.`taxonomic_rank_id` = 20, CONCAT(UCASE(SUBSTRING(sne11.`name_element`, 1, 1)),LOWER(SUBSTRING(sne11.`name_element`, 2))),
           IF(t12.`taxonomic_rank_id` = 20, CONCAT(UCASE(SUBSTRING(sne12.`name_element`, 1, 1)),LOWER(SUBSTRING(sne12.`name_element`, 2))),
            IF(t13.`taxonomic_rank_id` = 20, CONCAT(UCASE(SUBSTRING(sne13.`name_element`, 1, 1)),LOWER(SUBSTRING(sne13.`name_element`, 2))),
             IF(t14.`taxonomic_rank_id` = 20, CONCAT(UCASE(SUBSTRING(sne14.`name_element`, 1, 1)),LOWER(SUBSTRING(sne14.`name_element`, 2))),
              IF(t15.`taxonomic_rank_id` = 20, CONCAT(UCASE(SUBSTRING(sne15.`name_element`, 1, 1)),LOWER(SUBSTRING(sne15.`name_element`, 2))),NULL
))))))))))))))) AS genus,
IF(t1.`taxonomic_rank_id` = 96, sne1.`name_element`,
 IF(t2.`taxonomic_rank_id` = 96, sne2.`name_element`,
  IF(t3.`taxonomic_rank_id` = 96, sne3.`name_element`,
   IF(t4.`taxonomic_rank_id` = 96, sne4.`name_element`,
    IF(t5.`taxonomic_rank_id` = 96, sne5.`name_element`,
     IF(t6.`taxonomic_rank_id` = 96, sne6.`name_element`,
      IF(t7.`taxonomic_rank_id` = 96, sne7.`name_element`,
       IF(t8.`taxonomic_rank_id` = 96, sne8.`name_element`,
        IF(t9.`taxonomic_rank_id` = 96, sne9.`name_element`,
         IF(t10.`taxonomic_rank_id` = 96, sne10.`name_element`,
          IF(t11.`taxonomic_rank_id` = 96, sne11.`name_element`,
           IF(t12.`taxonomic_rank_id` = 96, sne12.`name_element`,
            IF(t13.`taxonomic_rank_id` = 96, sne13.`name_element`,
             IF(t14.`taxonomic_rank_id` = 96, sne14.`name_element`,
              IF(t15.`taxonomic_rank_id` = 96, sne15.`name_element`,NULL
))))))))))))))) AS subgenus,
IF(t1.`taxonomic_rank_id` = 83, sne1.`name_element`,
 IF(t2.`taxonomic_rank_id` = 83, sne2.`name_element`,
  IF(t3.`taxonomic_rank_id` = 83, sne3.`name_element`,
   IF(t4.`taxonomic_rank_id` = 83, sne4.`name_element`,
    IF(t5.`taxonomic_rank_id` = 83, sne5.`name_element`,
     IF(t6.`taxonomic_rank_id` = 83, sne6.`name_element`,
      IF(t7.`taxonomic_rank_id` = 83, sne7.`name_element`,
       IF(t8.`taxonomic_rank_id` = 83, sne8.`name_element`,
        IF(t9.`taxonomic_rank_id` = 83, sne9.`name_element`,
         IF(t10.`taxonomic_rank_id` = 83, sne10.`name_element`,
          IF(t11.`taxonomic_rank_id` = 83, sne11.`name_element`,
           IF(t12.`taxonomic_rank_id` = 83, sne12.`name_element`,
            IF(t13.`taxonomic_rank_id` = 83, sne13.`name_element`,
             IF(t14.`taxonomic_rank_id` = 83, sne14.`name_element`,
              IF(t15.`taxonomic_rank_id` = 83, sne15.`name_element`,NULL
))))))))))))))) AS species,
IF(t1.`taxonomic_rank_id` NOT IN (54,76,6,72,112,17,20,96,83), sne1.`name_element`,
 IF(t2.`taxonomic_rank_id` NOT IN (54,76,6,72,112,17,20,96,83), sne2.`name_element`,
  IF(t3.`taxonomic_rank_id` NOT IN (54,76,6,72,112,17,20,96,83), sne3.`name_element`,
   IF(t4.`taxonomic_rank_id` NOT IN (54,76,6,72,112,17,20,96,83), sne4.`name_element`,
    IF(t5.`taxonomic_rank_id` NOT IN (54,76,6,72,112,17,20,96,83), sne5.`name_element`,
     IF(t6.`taxonomic_rank_id` NOT IN (54,76,6,72,112,17,20,96,83), sne6.`name_element`,
      IF(t7.`taxonomic_rank_id` NOT IN (54,76,6,72,112,17,20,96,83), sne7.`name_element`,
       IF(t8.`taxonomic_rank_id` NOT IN (54,76,6,72,112,17,20,96,83), sne8.`name_element`,
        IF(t9.`taxonomic_rank_id` NOT IN (54,76,6,72,112,17,20,96,83), sne9.`name_element`,
         IF(t10.`taxonomic_rank_id` NOT IN (54,76,6,72,112,17,20,96,83), sne10.`name_element`,
          IF(t11.`taxonomic_rank_id` NOT IN (54,76,6,72,112,17,20,96,83), sne11.`name_element`,
           IF(t12.`taxonomic_rank_id` NOT IN (54,76,6,72,112,17,20,96,83), sne12.`name_element`,
            IF(t13.`taxonomic_rank_id` NOT IN (54,76,6,72,112,17,20,96,83), sne13.`name_element`,
             IF(t14.`taxonomic_rank_id` NOT IN (54,76,6,72,112,17,20,96,83), sne14.`name_element`,
              IF(t15.`taxonomic_rank_id` NOT IN (54,76,6,72,112,17,20,96,83), sne15.`name_element`,NULL
))))))))))))))) AS infraspecies,
IF(t1.`source_database_id` IS NOT NULL, t1.`source_database_id`,
 IF(t2.`source_database_id` IS NOT NULL, t2.`source_database_id`,
  IF(t3.`source_database_id` IS NOT NULL, t3.`source_database_id`,
   IF(t4.`source_database_id` IS NOT NULL, t4.`source_database_id`,
    IF(t5.`source_database_id` IS NOT NULL, t5.`source_database_id`,
     IF(t6.`source_database_id` IS NOT NULL, t6.`source_database_id`,
      IF(t7.`source_database_id` IS NOT NULL, t7.`source_database_id`,
       IF(t8.`source_database_id` IS NOT NULL, t8.`source_database_id`,
        IF(t9.`source_database_id` IS NOT NULL, t9.`source_database_id`,
         IF(t10.`source_database_id` IS NOT NULL, t10.`source_database_id`,
          IF(t11.`source_database_id` IS NOT NULL, t11.`source_database_id`,
           IF(t12.`source_database_id` IS NOT NULL, t12.`source_database_id`,
            IF(t13.`source_database_id` IS NOT NULL, t13.`source_database_id`,
             IF(t14.`source_database_id` IS NOT NULL, t14.`source_database_id`,
              IF(t15.`source_database_id` IS NOT NULL, t15.`source_database_id`,""
))))))))))))))) AS source_database_id

FROM
`taxon` AS t1

RIGHT JOIN `taxon_name_element` AS tne1 ON
t1.`id` = tne1.`taxon_id`

LEFT JOIN `scientific_name_element` AS sne1 ON
tne1.`scientific_name_element_id` = sne1.`id`

LEFT JOIN `taxon_name_element` AS tne2 ON
tne1.`parent_id` = tne2.`taxon_id`

LEFT JOIN `scientific_name_element` AS sne2 ON
tne2.`scientific_name_element_id` = sne2.`id`

LEFT JOIN `taxon` AS t2 ON
tne2.`taxon_id` = t2.`id`

LEFT JOIN `taxon_name_element` AS tne3 ON
tne2.`parent_id` = tne3.`taxon_id`

LEFT JOIN `scientific_name_element` AS sne3 ON
tne3.`scientific_name_element_id` = sne3.`id`

LEFT JOIN `taxon` AS t3 ON
tne3.`taxon_id` = t3.`id`

LEFT JOIN `taxon_name_element` AS tne4 ON
tne3.`parent_id` = tne4.`taxon_id`

LEFT JOIN `scientific_name_element` AS sne4 ON
tne4.`scientific_name_element_id` = sne4.`id`

LEFT JOIN `taxon` AS t4 ON
tne4.`taxon_id` = t4.`id`

LEFT JOIN `taxon_name_element` AS tne5 ON
tne4.`parent_id` = tne5.`taxon_id`

LEFT JOIN `scientific_name_element` AS sne5 ON
tne5.`scientific_name_element_id` = sne5.`id`

LEFT JOIN `taxon` AS t5 ON
tne5.`taxon_id` = t5.`id`

LEFT JOIN `taxon_name_element` AS tne6 ON
tne5.`parent_id` = tne6.`taxon_id`

LEFT JOIN `scientific_name_element` AS sne6 ON
tne6.`scientific_name_element_id` = sne6.`id`

LEFT JOIN `taxon` AS t6 ON
tne6.`taxon_id` = t6.`id`

LEFT JOIN `taxon_name_element` AS tne7 ON
tne6.`parent_id` = tne7.`taxon_id`

LEFT JOIN `scientific_name_element` AS sne7 ON
tne7.`scientific_name_element_id` = sne7.`id`

LEFT JOIN `taxon` AS t7 ON
tne7.`taxon_id` = t7.`id`

LEFT JOIN `taxon_name_element` AS tne8 ON
tne7.`parent_id` = tne8.`taxon_id`

LEFT JOIN `scientific_name_element` AS sne8 ON
tne8.`scientific_name_element_id` = sne8.`id`

LEFT JOIN `taxon` AS t8 ON
tne8.`taxon_id` = t8.`id`

LEFT JOIN `taxon_name_element` AS tne9 ON
tne8.`parent_id` = tne9.`taxon_id`

LEFT JOIN `scientific_name_element` AS sne9 ON
tne9.`scientific_name_element_id` = sne9.`id`

LEFT JOIN `taxon` AS t9 ON
tne9.`taxon_id` = t9.`id`

LEFT JOIN `taxon_name_element` AS tne10 ON
tne9.`parent_id` = tne10.`taxon_id`

LEFT JOIN `scientific_name_element` AS sne10 ON
tne10.`scientific_name_element_id` = sne10.`id`

LEFT JOIN `taxon` AS t10 ON
tne10.`taxon_id` = t10.`id`

LEFT JOIN `taxon_name_element` AS tne11 ON
tne10.`parent_id` = tne11.`taxon_id`

LEFT JOIN `scientific_name_element` AS sne11 ON
tne11.`scientific_name_element_id` = sne11.`id`

LEFT JOIN `taxon` AS t11 ON
tne11.`taxon_id` = t11.`id`

LEFT JOIN `taxon_name_element` AS tne12 ON
tne11.`parent_id` = tne12.`taxon_id`

LEFT JOIN `scientific_name_element` AS sne12 ON
tne12.`scientific_name_element_id` = sne12.`id`

LEFT JOIN `taxon` AS t12 ON
tne12.`taxon_id` = t12.`id`

LEFT JOIN `taxon_name_element` AS tne13 ON
tne12.`parent_id` = tne13.`taxon_id`

LEFT JOIN `scientific_name_element` AS sne13 ON
tne13.`scientific_name_element_id` = sne13.`id`

LEFT JOIN `taxon` AS t13 ON
tne13.`taxon_id` = t13.`id`

LEFT JOIN `taxon_name_element` AS tne14 ON
tne13.`parent_id` = tne14.`taxon_id`

LEFT JOIN `scientific_name_element` AS sne14 ON
tne14.`scientific_name_element_id` = sne14.`id`

LEFT JOIN `taxon` AS t14 ON
tne14.`taxon_id` = t14.`id`

LEFT JOIN `taxon_name_element` AS tne15 ON
tne14.`parent_id` = tne15.`taxon_id`

LEFT JOIN `scientific_name_element` AS sne15 ON
tne15.`scientific_name_element_id` = sne15.`id`

LEFT JOIN `taxon` AS t15 ON
tne15.`taxon_id` = t15.`id`

;

INSERT INTO `_search_scientific`
(`id`,`kingdom`,`genus`,`subgenus`,`species`,`infraspecies`,`author`,`status`,`accepted_species_id`,`accepted_species_name`,`accepted_species_author`,`source_database_id`,`source_database_name`)

SELECT
s.`id` AS id,
IF(t1.`taxonomic_rank_id` = 54, CONCAT(UCASE(SUBSTRING(sne1.`name_element`, 1, 1)),LOWER(SUBSTRING(sne1.`name_element`, 2))),
 IF(t2.`taxonomic_rank_id` = 54, CONCAT(UCASE(SUBSTRING(sne2.`name_element`, 1, 1)),LOWER(SUBSTRING(sne2.`name_element`, 2))),
  IF(t3.`taxonomic_rank_id` = 54, CONCAT(UCASE(SUBSTRING(sne3.`name_element`, 1, 1)),LOWER(SUBSTRING(sne3.`name_element`, 2))),
   IF(t4.`taxonomic_rank_id` = 54, CONCAT(UCASE(SUBSTRING(sne4.`name_element`, 1, 1)),LOWER(SUBSTRING(sne4.`name_element`, 2))),
    IF(t5.`taxonomic_rank_id` = 54, CONCAT(UCASE(SUBSTRING(sne5.`name_element`, 1, 1)),LOWER(SUBSTRING(sne5.`name_element`, 2))),
     IF(t6.`taxonomic_rank_id` = 54, CONCAT(UCASE(SUBSTRING(sne6.`name_element`, 1, 1)),LOWER(SUBSTRING(sne6.`name_element`, 2))),
      IF(t7.`taxonomic_rank_id` = 54, CONCAT(UCASE(SUBSTRING(sne7.`name_element`, 1, 1)),LOWER(SUBSTRING(sne7.`name_element`, 2))),
       IF(t8.`taxonomic_rank_id` = 54, CONCAT(UCASE(SUBSTRING(sne8.`name_element`, 1, 1)),LOWER(SUBSTRING(sne8.`name_element`, 2))),
        IF(t9.`taxonomic_rank_id` = 54, CONCAT(UCASE(SUBSTRING(sne9.`name_element`, 1, 1)),LOWER(SUBSTRING(sne9.`name_element`, 2))),
         IF(t10.`taxonomic_rank_id` = 54, CONCAT(UCASE(SUBSTRING(sne10.`name_element`, 1, 1)),LOWER(SUBSTRING(sne10.`name_element`, 2))),
          IF(t11.`taxonomic_rank_id` = 54, CONCAT(UCASE(SUBSTRING(sne11.`name_element`, 1, 1)),LOWER(SUBSTRING(sne11.`name_element`, 2))),
           IF(t12.`taxonomic_rank_id` = 54, CONCAT(UCASE(SUBSTRING(sne12.`name_element`, 1, 1)),LOWER(SUBSTRING(sne12.`name_element`, 2))),
            IF(t13.`taxonomic_rank_id` = 54, CONCAT(UCASE(SUBSTRING(sne13.`name_element`, 1, 1)),LOWER(SUBSTRING(sne13.`name_element`, 2))),
             IF(t14.`taxonomic_rank_id` = 54, CONCAT(UCASE(SUBSTRING(sne14.`name_element`, 1, 1)),LOWER(SUBSTRING(sne14.`name_element`, 2))),
              IF(t15.`taxonomic_rank_id` = 54, CONCAT(UCASE(SUBSTRING(sne15.`name_element`, 1, 1)),LOWER(SUBSTRING(sne15.`name_element`, 2))),""
))))))))))))))) AS kingdom,

sne_g.`name_element` AS genus,
sne_sg.`name_element` AS subgenus,
sne_s.`name_element` AS species,
sne_ss.`name_element` AS infraspecies,
aus.`string` AS author,
s.`scientific_name_status_id` AS status,
s.`taxon_id` AS accepted_id,

CONCAT(
IF(t1.`taxonomic_rank_id` = 20, CONCAT(UCASE(SUBSTRING(sne1.`name_element`, 1, 1)),LOWER(SUBSTRING(sne1.`name_element`, 2))),
 IF(t2.`taxonomic_rank_id` = 20, CONCAT(UCASE(SUBSTRING(sne2.`name_element`, 1, 1)),LOWER(SUBSTRING(sne2.`name_element`, 2))),
  IF(t3.`taxonomic_rank_id` = 20, CONCAT(UCASE(SUBSTRING(sne3.`name_element`, 1, 1)),LOWER(SUBSTRING(sne3.`name_element`, 2))),
   IF(t4.`taxonomic_rank_id` = 20, CONCAT(UCASE(SUBSTRING(sne4.`name_element`, 1, 1)),LOWER(SUBSTRING(sne4.`name_element`, 2))),
    IF(t5.`taxonomic_rank_id` = 20, CONCAT(UCASE(SUBSTRING(sne5.`name_element`, 1, 1)),LOWER(SUBSTRING(sne5.`name_element`, 2))),
     IF(t6.`taxonomic_rank_id` = 20, CONCAT(UCASE(SUBSTRING(sne6.`name_element`, 1, 1)),LOWER(SUBSTRING(sne6.`name_element`, 2))),
      IF(t7.`taxonomic_rank_id` = 20, CONCAT(UCASE(SUBSTRING(sne7.`name_element`, 1, 1)),LOWER(SUBSTRING(sne7.`name_element`, 2))),
       IF(t8.`taxonomic_rank_id` = 20, CONCAT(UCASE(SUBSTRING(sne8.`name_element`, 1, 1)),LOWER(SUBSTRING(sne8.`name_element`, 2))),
        IF(t9.`taxonomic_rank_id` = 20, CONCAT(UCASE(SUBSTRING(sne9.`name_element`, 1, 1)),LOWER(SUBSTRING(sne9.`name_element`, 2))),
         IF(t10.`taxonomic_rank_id` = 20, CONCAT(UCASE(SUBSTRING(sne10.`name_element`, 1, 1)),LOWER(SUBSTRING(sne10.`name_element`, 2))),
          IF(t11.`taxonomic_rank_id` = 20, CONCAT(UCASE(SUBSTRING(sne11.`name_element`, 1, 1)),LOWER(SUBSTRING(sne11.`name_element`, 2))),
           IF(t12.`taxonomic_rank_id` = 20, CONCAT(UCASE(SUBSTRING(sne12.`name_element`, 1, 1)),LOWER(SUBSTRING(sne12.`name_element`, 2))),
            IF(t13.`taxonomic_rank_id` = 20, CONCAT(UCASE(SUBSTRING(sne13.`name_element`, 1, 1)),LOWER(SUBSTRING(sne13.`name_element`, 2))),
             IF(t14.`taxonomic_rank_id` = 20, CONCAT(UCASE(SUBSTRING(sne14.`name_element`, 1, 1)),LOWER(SUBSTRING(sne14.`name_element`, 2))),
              IF(t15.`taxonomic_rank_id` = 20, CONCAT(UCASE(SUBSTRING(sne15.`name_element`, 1, 1)),LOWER(SUBSTRING(sne15.`name_element`, 2))),""
))))))))))))))),
IF(t1.`taxonomic_rank_id` = 96, CONCAT(" (",sne1.`name_element`,")"),
 IF(t2.`taxonomic_rank_id` = 96, CONCAT(" (",sne2.`name_element`,")"),
  IF(t3.`taxonomic_rank_id` = 96, CONCAT(" (",sne3.`name_element`,")"),
   IF(t4.`taxonomic_rank_id` = 96, CONCAT(" (",sne4.`name_element`,")"),
    IF(t5.`taxonomic_rank_id` = 96, CONCAT(" (",sne5.`name_element`,")"),
     IF(t6.`taxonomic_rank_id` = 96, CONCAT(" (",sne6.`name_element`,")"),
      IF(t7.`taxonomic_rank_id` = 96, CONCAT(" (",sne7.`name_element`,")"),
       IF(t8.`taxonomic_rank_id` = 96, CONCAT(" (",sne8.`name_element`,")"),
        IF(t9.`taxonomic_rank_id` = 96, CONCAT(" (",sne9.`name_element`,")"),
         IF(t10.`taxonomic_rank_id` = 96, CONCAT(" (",sne10.`name_element`,")"),
          IF(t11.`taxonomic_rank_id` = 96, CONCAT(" (",sne11.`name_element`,")"),
           IF(t12.`taxonomic_rank_id` = 96, CONCAT(" (",sne12.`name_element`,")"),
            IF(t13.`taxonomic_rank_id` = 96, CONCAT(" (",sne13.`name_element`,")"),
             IF(t14.`taxonomic_rank_id` = 96, CONCAT(" (",sne14.`name_element`,")"),
              IF(t15.`taxonomic_rank_id` = 96, CONCAT(" (",sne15.`name_element`,")"),""
))))))))))))))),
IF(t1.`taxonomic_rank_id` = 83, CONCAT(" ",sne1.`name_element`),
 IF(t2.`taxonomic_rank_id` = 83, CONCAT(" ",sne2.`name_element`),
  IF(t3.`taxonomic_rank_id` = 83, CONCAT(" ",sne3.`name_element`),
   IF(t4.`taxonomic_rank_id` = 83, CONCAT(" ",sne4.`name_element`),
    IF(t5.`taxonomic_rank_id` = 83, CONCAT(" ",sne5.`name_element`),
     IF(t6.`taxonomic_rank_id` = 83, CONCAT(" ",sne6.`name_element`),
      IF(t7.`taxonomic_rank_id` = 83, CONCAT(" ",sne7.`name_element`),
       IF(t8.`taxonomic_rank_id` = 83, CONCAT(" ",sne8.`name_element`),
        IF(t9.`taxonomic_rank_id` = 83, CONCAT(" ",sne9.`name_element`),
         IF(t10.`taxonomic_rank_id` = 83, CONCAT(" ",sne10.`name_element`),
          IF(t11.`taxonomic_rank_id` = 83, CONCAT(" ",sne11.`name_element`),
           IF(t12.`taxonomic_rank_id` = 83, CONCAT(" ",sne12.`name_element`),
            IF(t13.`taxonomic_rank_id` = 83, CONCAT(" ",sne13.`name_element`),
             IF(t14.`taxonomic_rank_id` = 83, CONCAT(" ",sne14.`name_element`),
              IF(t15.`taxonomic_rank_id` = 83, CONCAT(" ",sne15.`name_element`),""
))))))))))))))),
IF(t1.`taxonomic_rank_id` NOT IN (54,76,6,72,112,17,20,96,83), CONCAT(" ",sne1.`name_element`),
 IF(t2.`taxonomic_rank_id` NOT IN (54,76,6,72,112,17,20,96,83), CONCAT(" ",sne2.`name_element`),
  IF(t3.`taxonomic_rank_id` NOT IN (54,76,6,72,112,17,20,96,83), CONCAT(" ",sne3.`name_element`),
   IF(t4.`taxonomic_rank_id` NOT IN (54,76,6,72,112,17,20,96,83), CONCAT(" ",sne4.`name_element`),
    IF(t5.`taxonomic_rank_id` NOT IN (54,76,6,72,112,17,20,96,83), CONCAT(" ",sne5.`name_element`),
     IF(t6.`taxonomic_rank_id` NOT IN (54,76,6,72,112,17,20,96,83), CONCAT(" ",sne6.`name_element`),
      IF(t7.`taxonomic_rank_id` NOT IN (54,76,6,72,112,17,20,96,83), CONCAT(" ",sne7.`name_element`),
       IF(t8.`taxonomic_rank_id` NOT IN (54,76,6,72,112,17,20,96,83), CONCAT(" ",sne8.`name_element`),
        IF(t9.`taxonomic_rank_id` NOT IN (54,76,6,72,112,17,20,96,83), CONCAT(" ",sne9.`name_element`),
         IF(t10.`taxonomic_rank_id` NOT IN (54,76,6,72,112,17,20,96,83), CONCAT(" ",sne10.`name_element`),
          IF(t11.`taxonomic_rank_id` NOT IN (54,76,6,72,112,17,20,96,83), CONCAT(" ",sne11.`name_element`),
           IF(t12.`taxonomic_rank_id` NOT IN (54,76,6,72,112,17,20,96,83), CONCAT(" ",sne12.`name_element`),
            IF(t13.`taxonomic_rank_id` NOT IN (54,76,6,72,112,17,20,96,83), CONCAT(" ",sne13.`name_element`),
             IF(t14.`taxonomic_rank_id` NOT IN (54,76,6,72,112,17,20,96,83), CONCAT(" ",sne14.`name_element`),
              IF(t15.`taxonomic_rank_id` NOT IN (54,76,6,72,112,17,20,96,83), CONCAT(" ",sne15.`name_element`),""
)))))))))))))))
) AS accepted_species_name,

"" AS accepted_species_author,
IF(t1.`source_database_id` IS NOT NULL, t1.`source_database_id`,
 IF(t2.`source_database_id` IS NOT NULL, t2.`source_database_id`,
  IF(t3.`source_database_id` IS NOT NULL, t3.`source_database_id`,
   IF(t4.`source_database_id` IS NOT NULL, t4.`source_database_id`,
    IF(t5.`source_database_id` IS NOT NULL, t5.`source_database_id`,
     IF(t6.`source_database_id` IS NOT NULL, t6.`source_database_id`,
      IF(t7.`source_database_id` IS NOT NULL, t7.`source_database_id`,
       IF(t8.`source_database_id` IS NOT NULL, t8.`source_database_id`,
        IF(t9.`source_database_id` IS NOT NULL, t9.`source_database_id`,
         IF(t10.`source_database_id` IS NOT NULL, t10.`source_database_id`,
          IF(t11.`source_database_id` IS NOT NULL, t11.`source_database_id`,
           IF(t12.`source_database_id` IS NOT NULL, t12.`source_database_id`,
            IF(t13.`source_database_id` IS NOT NULL, t13.`source_database_id`,
             IF(t14.`source_database_id` IS NOT NULL, t14.`source_database_id`,
              IF(t15.`source_database_id` IS NOT NULL, t15.`source_database_id`,""
))))))))))))))) AS source_database_id,
"" AS source_database_name

FROM `synonym` AS s

LEFT JOIN `taxon` AS t1 ON
s.`taxon_id` = t1.`id`

LEFT JOIN `taxon_name_element` AS tne1 ON
t1.`id` = tne1.`taxon_id`

LEFT JOIN `scientific_name_element` AS sne1 ON
tne1.`scientific_name_element_id` = sne1.`id`

LEFT JOIN `taxon_name_element` AS tne2 ON
tne1.`parent_id` = tne2.`taxon_id`

LEFT JOIN `scientific_name_element` AS sne2 ON
tne2.`scientific_name_element_id` = sne2.`id`

LEFT JOIN `taxon` AS t2 ON
tne2.`taxon_id` = t2.`id`

LEFT JOIN `taxon_name_element` AS tne3 ON
tne2.`parent_id` = tne3.`taxon_id`

LEFT JOIN `scientific_name_element` AS sne3 ON
tne3.`scientific_name_element_id` = sne3.`id`

LEFT JOIN `taxon` AS t3 ON
tne3.`taxon_id` = t3.`id`

LEFT JOIN `taxon_name_element` AS tne4 ON
tne3.`parent_id` = tne4.`taxon_id`

LEFT JOIN `scientific_name_element` AS sne4 ON
tne4.`scientific_name_element_id` = sne4.`id`

LEFT JOIN `taxon` AS t4 ON
tne4.`taxon_id` = t4.`id`

LEFT JOIN `taxon_name_element` AS tne5 ON
tne4.`parent_id` = tne5.`taxon_id`

LEFT JOIN `scientific_name_element` AS sne5 ON
tne5.`scientific_name_element_id` = sne5.`id`

LEFT JOIN `taxon` AS t5 ON
tne5.`taxon_id` = t5.`id`

LEFT JOIN `taxon_name_element` AS tne6 ON
tne5.`parent_id` = tne6.`taxon_id`

LEFT JOIN `scientific_name_element` AS sne6 ON
tne6.`scientific_name_element_id` = sne6.`id`

LEFT JOIN `taxon` AS t6 ON
tne6.`taxon_id` = t6.`id`

LEFT JOIN `taxon_name_element` AS tne7 ON
tne6.`parent_id` = tne7.`taxon_id`

LEFT JOIN `scientific_name_element` AS sne7 ON
tne7.`scientific_name_element_id` = sne7.`id`

LEFT JOIN `taxon` AS t7 ON
tne7.`taxon_id` = t7.`id`

LEFT JOIN `taxon_name_element` AS tne8 ON
tne7.`parent_id` = tne8.`taxon_id`

LEFT JOIN `scientific_name_element` AS sne8 ON
tne8.`scientific_name_element_id` = sne8.`id`

LEFT JOIN `taxon` AS t8 ON
tne8.`taxon_id` = t8.`id`

LEFT JOIN `taxon_name_element` AS tne9 ON
tne8.`parent_id` = tne9.`taxon_id`

LEFT JOIN `scientific_name_element` AS sne9 ON
tne9.`scientific_name_element_id` = sne9.`id`

LEFT JOIN `taxon` AS t9 ON
tne9.`taxon_id` = t9.`id`

LEFT JOIN `taxon_name_element` AS tne10 ON
tne9.`parent_id` = tne10.`taxon_id`

LEFT JOIN `scientific_name_element` AS sne10 ON
tne10.`scientific_name_element_id` = sne10.`id`

LEFT JOIN `taxon` AS t10 ON
tne10.`taxon_id` = t10.`id`

LEFT JOIN `taxon_name_element` AS tne11 ON
tne10.`parent_id` = tne11.`taxon_id`

LEFT JOIN `scientific_name_element` AS sne11 ON
tne11.`scientific_name_element_id` = sne11.`id`

LEFT JOIN `taxon` AS t11 ON
tne11.`taxon_id` = t11.`id`

LEFT JOIN `taxon_name_element` AS tne12 ON
tne11.`parent_id` = tne12.`taxon_id`

LEFT JOIN `scientific_name_element` AS sne12 ON
tne12.`scientific_name_element_id` = sne12.`id`

LEFT JOIN `taxon` AS t12 ON
tne12.`taxon_id` = t12.`id`

LEFT JOIN `taxon_name_element` AS tne13 ON
tne12.`parent_id` = tne13.`taxon_id`

LEFT JOIN `scientific_name_element` AS sne13 ON
tne13.`scientific_name_element_id` = sne13.`id`

LEFT JOIN `taxon` AS t13 ON
tne13.`taxon_id` = t13.`id`

LEFT JOIN `taxon_name_element` AS tne14 ON
tne13.`parent_id` = tne14.`taxon_id`

LEFT JOIN `scientific_name_element` AS sne14 ON
tne14.`scientific_name_element_id` = sne14.`id`

LEFT JOIN `taxon` AS t14 ON
tne14.`taxon_id` = t14.`id`

LEFT JOIN `taxon_name_element` AS tne15 ON
tne14.`parent_id` = tne15.`taxon_id`

LEFT JOIN `scientific_name_element` AS sne15 ON
tne15.`scientific_name_element_id` = sne15.`id`

LEFT JOIN `taxon` AS t15 ON
tne15.`taxon_id` = t15.`id`

LEFT JOIN `author_string` AS aus ON
s.`author_string_id` = aus.`id`

LEFT JOIN `synonym_name_element` AS syne_g ON
syne_g.`synonym_id` = s.`id` AND syne_g.`taxonomic_rank_id` = 20

LEFT JOIN `scientific_name_element` AS sne_g ON
sne_g.`id` = syne_g.`scientific_name_element_id`

LEFT JOIN `synonym_name_element` AS syne_sg ON
syne_sg.`synonym_id` = s.`id` AND syne_sg.`taxonomic_rank_id` = 96

LEFT JOIN `scientific_name_element` AS sne_sg ON
sne_sg.`id` = syne_sg.`scientific_name_element_id`

LEFT JOIN `synonym_name_element` AS syne_s ON
syne_s.`synonym_id` = s.`id` AND syne_s.`taxonomic_rank_id` = 83

LEFT JOIN `scientific_name_element` AS sne_s ON
sne_s.`id` = syne_s.`scientific_name_element_id`

LEFT JOIN `synonym_name_element` AS syne_ss ON
syne_ss.`synonym_id` = s.`id` AND syne_ss.`taxonomic_rank_id` NOT IN (20,96,83)

LEFT JOIN `scientific_name_element` AS sne_ss ON
sne_ss.`id` = syne_ss.`scientific_name_element_id`

;

UPDATE `_search_scientific` AS dss
SET dss.`author` = IF(dss.`accepted_species_id` IS NULL,
    (SELECT `string` FROM `taxon_detail` LEFT JOIN `author_string` ON `author_string_id` = `author_string`.`id` WHERE `taxon_id` = dss.`id`),
    (SELECT `string` FROM `synonym` LEFT JOIN `author_string` ON `synonym`.`author_string_id` = `author_string`.`id` WHERE `synonym`.`id` = dss.`id`)
),
dss.`status` = IF(dss.`accepted_species_id` IS NULL,
    (SELECT `scientific_name_status_id` FROM `taxon_detail` WHERE `taxon_id` = dss.`id`),
    (SELECT `scientific_name_status_id` FROM `synonym` WHERE `synonym`.`id` = dss.`id`)
),
dss.`source_database_name` = (SELECT `abbreviated_name` FROM `source_database` WHERE dss.`source_database_id` = `source_database`.`id`)
dss.`accepted_species_author` = IF(dss.`accepted_species_id` IS NULL,NULL,
    (
        SELECT aus.`string` FROM `taxon_detail` AS td
        LEFT JOIN author_string AS aus ON
        td.`author_string_id` = aus.`id`
        WHERE td.`taxon_id` = dss.`accepted_species_id`
    )
)
;

ALTER TABLE `_search_scientific` ENABLE KEYS;

