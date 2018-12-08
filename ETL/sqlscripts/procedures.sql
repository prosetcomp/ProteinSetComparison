DELIMITER //
DROP PROCEDURE IF EXISTS `PROT_1SET`//

CREATE PROCEDURE `PROT_1SET` (IN s_id VARCHAR(64))
BEGIN

SET @P_a = CONCAT('P_a_',s_id);
SET @plist1 = CONCAT('protlist1_',s_id);

SET @sP_a = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@P_a,' (PRIMARY KEY my_pkey (ACCESSION)) select DISTINCT ACCESSION from ',@plist1,';');

PREPARE stmtP_a FROM @sP_a;
EXECUTE stmtP_a;

END//
DELIMITER ;



DELIMITER //
DROP PROCEDURE IF EXISTS `PROT_2SET`//

CREATE PROCEDURE `PROT_2SET` (IN s_id VARCHAR(64))
BEGIN

SET @P_b = CONCAT('P_b_',s_id);
SET @P_c = CONCAT('P_c_',s_id);
SET @P_a = CONCAT('P_a_',s_id);
SET @P_bc = CONCAT('P_bc_',s_id);
SET @P_ac = CONCAT('P_ac_',s_id);

SET @plist1 = CONCAT('protlist1_',s_id);
SET @plist2 = CONCAT('protlist2_',s_id);

SET @sP_bc = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@P_bc,' (PRIMARY KEY my_pkey (ACCESSION)) select DISTINCT ACCESSION from ',@plist1,';');
SET @sP_ac = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@P_ac,' (PRIMARY KEY my_pkey (ACCESSION)) select DISTINCT ACCESSION from ',@plist2,';');

SET @sP_c = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@P_c,' (PRIMARY KEY my_pkey (ACCESSION)) select ',@P_bc,'.ACCESSION from ',@P_bc,' join ',@P_ac,' on ',@P_bc,'.ACCESSION=',@P_ac,'.ACCESSION;');
SET @sP_b = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@P_b,' (PRIMARY KEY my_pkey (ACCESSION)) select ',@P_bc,'.ACCESSION from ',@P_bc,' left outer join ',@P_ac,' on ',@P_bc,'.ACCESSION=',@P_ac,'.ACCESSION where ',@P_ac,'.ACCESSION is null;');
SET @sP_a = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@P_a,' (PRIMARY KEY my_pkey (ACCESSION)) select ',@P_ac,'.ACCESSION from ',@P_ac,' left outer join ',@P_bc,' on ',@P_bc,'.ACCESSION=',@P_ac,'.ACCESSION where ',@P_bc,'.ACCESSION is null;');

PREPARE stmtP_bc FROM @sP_bc;
EXECUTE stmtP_bc;

PREPARE stmtP_ac FROM @sP_ac;
EXECUTE stmtP_ac;

PREPARE stmtP_a FROM @sP_a;
EXECUTE stmtP_a;

PREPARE stmtP_b FROM @sP_b;
EXECUTE stmtP_b;

PREPARE stmtP_c FROM @sP_c;
EXECUTE stmtP_c;

END//
DELIMITER ;


DELIMITER //
DROP PROCEDURE IF EXISTS `PROT_3SET`//

CREATE PROCEDURE `PROT_3SET` (IN s_id VARCHAR(64))
BEGIN

SET @P_a = CONCAT('P_a_',s_id);
SET @P_b = CONCAT('P_b_',s_id);
SET @P_c = CONCAT('P_c_',s_id);
SET @P_d = CONCAT('P_d_',s_id);
SET @P_e = CONCAT('P_e_',s_id);
SET @P_f = CONCAT('P_f_',s_id);
SET @P_g = CONCAT('P_g_',s_id);

SET @P_fg = CONCAT('P_fg_',s_id);
SET @P_eg = CONCAT('P_eg_',s_id);
SET @P_cg = CONCAT('P_cg_',s_id);

SET @P_defg = CONCAT('P_defg_',s_id);
SET @P_bcfg = CONCAT('P_bcfg_',s_id);
SET @P_aceg = CONCAT('P_aceg_',s_id);

SET @plist1 = CONCAT('protlist1_',s_id);
SET @plist2 = CONCAT('protlist2_',s_id);
SET @plist3 = CONCAT('protlist3_',s_id);

SET @sP_defg = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@P_defg,' (PRIMARY KEY my_pkey (ACCESSION)) select DISTINCT ACCESSION from ',@plist1,';');
SET @sP_bcfg = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@P_bcfg,' (PRIMARY KEY my_pkey (ACCESSION)) select DISTINCT ACCESSION from ',@plist2,';');
SET @sP_aceg = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@P_aceg,' (PRIMARY KEY my_pkey (ACCESSION)) select DISTINCT ACCESSION from ',@plist3,';');

SET @sP_fg = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@P_fg,' (PRIMARY KEY my_pkey (ACCESSION)) select ',@P_defg,'.ACCESSION from ',@P_defg,' join ',@P_bcfg,' on ',@P_defg,'.ACCESSION=',@P_bcfg,'.ACCESSION;');
SET @sP_eg = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@P_eg,' (PRIMARY KEY my_pkey (ACCESSION)) select ',@P_defg,'.ACCESSION from ',@P_defg,' join ',@P_aceg,' on ',@P_defg,'.ACCESSION=',@P_aceg,'.ACCESSION;');
SET @sP_cg = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@P_cg,' (PRIMARY KEY my_pkey (ACCESSION)) select ',@P_bcfg,'.ACCESSION from ',@P_bcfg,' join ',@P_aceg,' on ',@P_bcfg,'.ACCESSION=',@P_aceg,'.ACCESSION;');

SET @sP_g = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@P_g,' (PRIMARY KEY my_pkey (ACCESSION)) select ',@P_fg,'.ACCESSION from ',@P_fg,' join ',@P_eg,' on ',@P_fg,'.ACCESSION=',@P_eg,'.ACCESSION and ',@P_fg,'.ACCESSION IN ( select ACCESSION from ',@P_cg,');');

SET @sP_f = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@P_f,' (PRIMARY KEY my_pkey (ACCESSION)) select ',@P_fg,'.ACCESSION from ',@P_fg,' left outer join ',@P_aceg,' on ',@P_fg,'.ACCESSION=',@P_aceg,'.ACCESSION where ',@P_aceg,'.ACCESSION is null;');
SET @sP_e = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@P_e,' (PRIMARY KEY my_pkey (ACCESSION)) select ',@P_eg,'.ACCESSION from ',@P_eg,' left outer join ',@P_bcfg,' on ',@P_eg,'.ACCESSION=',@P_bcfg,'.ACCESSION where ',@P_bcfg,'.ACCESSION is null;');
SET @sP_c = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@P_c,' (PRIMARY KEY my_pkey (ACCESSION)) select ',@P_cg,'.ACCESSION from ',@P_cg,' left outer join ',@P_defg,' on ',@P_cg,'.ACCESSION=',@P_defg,'.ACCESSION where ',@P_defg,'.ACCESSION is null;');

SET @sP_d = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@P_d,' (PRIMARY KEY my_pkey (ACCESSION)) select ',@P_defg,'.ACCESSION from ',@P_defg,' where ',@P_defg,'.ACCESSION NOT IN (select ACCESSION from ',@P_fg,' union select ACCESSION from ',@P_eg,');');
SET @sP_b = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@P_b,' (PRIMARY KEY my_pkey (ACCESSION)) select ',@P_bcfg,'.ACCESSION from ',@P_bcfg,' where ',@P_bcfg,'.ACCESSION NOT IN (select ACCESSION from ',@P_fg,' union select ACCESSION from ',@P_cg,');');
SET @sP_a = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@P_a,' (PRIMARY KEY my_pkey (ACCESSION)) select ',@P_aceg,'.ACCESSION from ',@P_aceg,' where ',@P_aceg,'.ACCESSION NOT IN (select ACCESSION from ',@P_eg,' union select ACCESSION from ',@P_cg,');');


PREPARE stmtP_defg FROM @sP_defg;
EXECUTE stmtP_defg;

PREPARE stmtP_bcfg FROM @sP_bcfg;
EXECUTE stmtP_bcfg;

PREPARE stmtP_aceg FROM @sP_aceg;
EXECUTE stmtP_aceg;

PREPARE stmtP_fg FROM @sP_fg;
EXECUTE stmtP_fg;

PREPARE stmtP_eg FROM @sP_eg; 
EXECUTE stmtP_eg; 

PREPARE stmtP_cg FROM @sP_cg;
EXECUTE stmtP_cg;

PREPARE stmtP_a FROM @sP_a;
EXECUTE stmtP_a;

PREPARE stmtP_b FROM @sP_b;
EXECUTE stmtP_b;

PREPARE stmtP_c FROM @sP_c;
EXECUTE stmtP_c;

PREPARE stmtP_d FROM @sP_d;
EXECUTE stmtP_d;

PREPARE stmtP_e FROM @sP_e;
EXECUTE stmtP_e;

PREPARE stmtP_f FROM @sP_f;
EXECUTE stmtP_f;

PREPARE stmtP_g FROM @sP_g;
EXECUTE stmtP_g;


END//
DELIMITER ;


DELIMITER //
DROP PROCEDURE IF EXISTS `PROT_4SET`//
CREATE PROCEDURE `PROT_4SET` (IN s_id VARCHAR(64))
BEGIN

SET @plist1 = CONCAT('protlist1_',s_id);
SET @plist2 = CONCAT('protlist2_',s_id);
SET @plist3 = CONCAT('protlist3_',s_id);
SET @plist4 = CONCAT('protlist4_',s_id);

SET @P_hijklmno = CONCAT('P_hijklmno_',s_id);
SET @P_defglmno = CONCAT('P_defglmno_',s_id);
SET @P_bcfgjkno = CONCAT('P_bcfgjkno_',s_id);
SET @P_acegikmo = CONCAT('P_acegikmo_',s_id);

SET @P_lmno = CONCAT('P_lmno_',s_id);
SET @P_jkno = CONCAT('P_jkno_',s_id);
SET @P_ikmo = CONCAT('P_ikmo_',s_id);
SET @P_fgno = CONCAT('P_fgno_',s_id);
SET @P_egmo = CONCAT('P_egmo_',s_id);
SET @P_cgko = CONCAT('P_cgko_',s_id);

SET @P_no = CONCAT('P_no_',s_id);
SET @P_mo = CONCAT('P_mo_',s_id);
SET @P_ko = CONCAT('P_ko_',s_id);
SET @P_go = CONCAT('P_go_',s_id);

SET @P_o = CONCAT('P_o_',s_id);
SET @P_n = CONCAT('P_n_',s_id);
SET @P_m = CONCAT('P_m_',s_id);
SET @P_k = CONCAT('P_k_',s_id);
SET @P_g = CONCAT('P_g_',s_id);

SET @P_l = CONCAT('P_l_',s_ID);
SET @P_j = CONCAT('P_j_',s_ID);
SET @P_i = CONCAT('P_i_',s_ID);
SET @P_f = CONCAT('P_f_',s_ID);
SET @P_e = CONCAT('P_e_',s_ID);
SET @P_c = CONCAT('P_c_',s_ID);


SET @P_lm = CONCAT('P_lm_',s_ID);
SET @P_jk = CONCAT('P_jk_',s_ID);
SET @P_ik = CONCAT('P_ik_',s_ID);
SET @P_fg = CONCAT('P_fg_',s_ID);
SET @P_eg = CONCAT('P_eg_',s_ID);
SET @P_cg = CONCAT('P_cg_',s_ID);

SET @P_cegikmo = CONCAT('P_cegikmo_',s_ID);
SET @P_cfgjkno = CONCAT('P_cfgjkno_',s_ID);
SET @P_efglmno = CONCAT('P_efglmno_',s_ID);
SET @P_ijklmno = CONCAT('P_ijklmno_',s_ID);


SET @P_a = CONCAT('P_a_',s_ID);
SET @P_b = CONCAT('P_b_',s_ID);
SET @P_d = CONCAT('P_d_',s_ID);
SET @P_h = CONCAT('P_h_',s_ID);

SET @sP_hijklmno = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@P_hijklmno,' (PRIMARY KEY my_pkey (ACCESSION)) select DISTINCT ACCESSION from ',@plist1,';');
SET @sP_defglmno = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@P_defglmno,' (PRIMARY KEY my_pkey (ACCESSION)) select DISTINCT ACCESSION from ',@plist2,';');
SET @sP_bcfgjkno = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@P_bcfgjkno,' (PRIMARY KEY my_pkey (ACCESSION)) select DISTINCT ACCESSION from ',@plist3,';');
SET @sP_acegikmo = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@P_acegikmo,' (PRIMARY KEY my_pkey (ACCESSION)) select DISTINCT ACCESSION from ',@plist4,';');


SET @sP_lmno = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@P_lmno,' (PRIMARY KEY my_pkey (ACCESSION)) select ',@P_hijklmno,'.ACCESSION from ',@P_hijklmno,' join ',@P_defglmno,' on ',@P_hijklmno,'.ACCESSION=',@P_defglmno,'.ACCESSION;');
SET @sP_jkno = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@P_jkno,' (PRIMARY KEY my_pkey (ACCESSION)) select ',@P_hijklmno,'.ACCESSION from ',@P_hijklmno,' join ',@P_bcfgjkno,' on ',@P_hijklmno,'.ACCESSION=',@P_bcfgjkno,'.ACCESSION;');
SET @sP_ikmo = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@P_ikmo,' (PRIMARY KEY my_pkey (ACCESSION)) select ',@P_hijklmno,'.ACCESSION from ',@P_hijklmno,' join ',@P_acegikmo,' on ',@P_hijklmno,'.ACCESSION=',@P_acegikmo,'.ACCESSION;');
SET @sP_fgno = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@P_fgno,' (PRIMARY KEY my_pkey (ACCESSION)) select ',@P_defglmno,'.ACCESSION from ',@P_defglmno,' join ',@P_bcfgjkno,' on ',@P_defglmno,'.ACCESSION=',@P_bcfgjkno,'.ACCESSION;');
SET @sP_egmo = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@P_egmo,' (PRIMARY KEY my_pkey (ACCESSION)) select ',@P_defglmno,'.ACCESSION from ',@P_defglmno,' join ',@P_acegikmo,' on ',@P_defglmno,'.ACCESSION=',@P_acegikmo,'.ACCESSION;');
SET @sP_cgko = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@P_cgko,' (PRIMARY KEY my_pkey (ACCESSION)) select ',@P_bcfgjkno,'.ACCESSION from ',@P_bcfgjkno,' join ',@P_acegikmo,' on ',@P_bcfgjkno,'.ACCESSION=',@P_acegikmo,'.ACCESSION;');

SET @sP_no = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@P_no,' (PRIMARY KEY my_pkey (ACCESSION)) select ',@P_hijklmno,'.ACCESSION from ',@P_hijklmno,' join ',@P_fgno,' on ',@P_hijklmno,'.ACCESSION=',@P_fgno,'.ACCESSION;');
SET @sP_mo = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@P_mo,' (PRIMARY KEY my_pkey (ACCESSION)) select ',@P_hijklmno,'.ACCESSION from ',@P_hijklmno,' join ',@P_egmo,' on ',@P_hijklmno,'.ACCESSION=',@P_egmo,'.ACCESSION;');
SET @sP_ko = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@P_ko,' (PRIMARY KEY my_pkey (ACCESSION)) select ',@P_hijklmno,'.ACCESSION from ',@P_hijklmno,' join ',@P_cgko,' on ',@P_hijklmno,'.ACCESSION=',@P_cgko,'.ACCESSION;');
SET @sP_go = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@P_go,' (PRIMARY KEY my_pkey (ACCESSION)) select ',@P_defglmno,'.ACCESSION from ',@P_defglmno,' join ',@P_cgko,' on ',@P_defglmno,'.ACCESSION=',@P_cgko,'.ACCESSION;');

SET @sP_o = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@P_o,' (PRIMARY KEY my_pkey (ACCESSION)) select ',@P_hijklmno,'.ACCESSION from ',@P_hijklmno,' join ',@P_go,' on ',@P_hijklmno,'.ACCESSION=',@P_go,'.ACCESSION;');


SET @sP_n = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@P_n,' (PRIMARY KEY my_pkey (ACCESSION)) select ',@P_no,'.ACCESSION from ',@P_no,' left outer join ',@P_o,' on ',@P_no,'.ACCESSION=',@P_o,'.ACCESSION where ',@P_o,'.ACCESSION is null;');
SET @sP_m = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@P_m,' (PRIMARY KEY my_pkey (ACCESSION)) select ',@P_mo,'.ACCESSION from ',@P_mo,' left outer join ',@P_o,' on ',@P_mo,'.ACCESSION=',@P_o,'.ACCESSION where ',@P_o,'.ACCESSION is null;');
SET @sP_k = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@P_k,' (PRIMARY KEY my_pkey (ACCESSION)) select ',@P_ko,'.ACCESSION from ',@P_ko,' left outer join ',@P_o,' on ',@P_ko,'.ACCESSION=',@P_o,'.ACCESSION where ',@P_o,'.ACCESSION is null;');
SET @sP_g = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@P_g,' (PRIMARY KEY my_pkey (ACCESSION)) select ',@P_go,'.ACCESSION from ',@P_go,' left outer join ',@P_o,' on ',@P_go,'.ACCESSION=',@P_o,'.ACCESSION where ',@P_o,'.ACCESSION is null;');


SET @sP_lm = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@P_lm,' (PRIMARY KEY my_pkey (ACCESSION)) select ',@P_lmno,'.ACCESSION from ',@P_lmno,' left outer join ',@P_no,' on ',@P_lmno,'.ACCESSION=',@P_no,'.ACCESSION where ',@P_no,'.ACCESSION is null;');
SET @sP_jk = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@P_jk,' (PRIMARY KEY my_pkey (ACCESSION)) select ',@P_jkno,'.ACCESSION from ',@P_jkno,' left outer join ',@P_no,' on ',@P_jkno,'.ACCESSION=',@P_no,'.ACCESSION where ',@P_no,'.ACCESSION is null;');
SET @sP_ik = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@P_ik,' (PRIMARY KEY my_pkey (ACCESSION)) select ',@P_ikmo,'.ACCESSION from ',@P_ikmo,' left outer join ',@P_mo,' on ',@P_ikmo,'.ACCESSION=',@P_mo,'.ACCESSION where ',@P_mo,'.ACCESSION is null;');
SET @sP_fg = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@P_fg,' (PRIMARY KEY my_pkey (ACCESSION)) select ',@P_fgno,'.ACCESSION from ',@P_fgno,' left outer join ',@P_no,' on ',@P_fgno,'.ACCESSION=',@P_no,'.ACCESSION where ',@P_no,'.ACCESSION is null;');
SET @sP_eg = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@P_eg,' (PRIMARY KEY my_pkey (ACCESSION)) select ',@P_egmo,'.ACCESSION from ',@P_egmo,' left outer join ',@P_mo,' on ',@P_egmo,'.ACCESSION=',@P_mo,'.ACCESSION where ',@P_mo,'.ACCESSION is null;');
SET @sP_cg = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@P_cg,' (PRIMARY KEY my_pkey (ACCESSION)) select ',@P_cgko,'.ACCESSION from ',@P_cgko,' left outer join ',@P_ko,' on ',@P_cgko,'.ACCESSION=',@P_ko,'.ACCESSION where ',@P_ko,'.ACCESSION is null;');


SET @sP_l = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@P_l,' (PRIMARY KEY my_pkey (ACCESSION)) select ',@P_lm,'.ACCESSION from ',@P_lm,' left outer join ',@P_m,' on ',@P_lm,'.ACCESSION=',@P_m,'.ACCESSION where ',@P_m,'.ACCESSION is null;');
SET @sP_j = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@P_j,' (PRIMARY KEY my_pkey (ACCESSION)) select ',@P_jk,'.ACCESSION from ',@P_jk,' left outer join ',@P_k,' on ',@P_jk,'.ACCESSION=',@P_k,'.ACCESSION where ',@P_k,'.ACCESSION is null;');
SET @sP_i = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@P_i,' (PRIMARY KEY my_pkey (ACCESSION)) select ',@P_ik,'.ACCESSION from ',@P_ik,' left outer join ',@P_k,' on ',@P_ik,'.ACCESSION=',@P_k,'.ACCESSION where ',@P_k,'.ACCESSION is null;');
SET @sP_f = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@P_f,' (PRIMARY KEY my_pkey (ACCESSION)) select ',@P_fg,'.ACCESSION from ',@P_fg,' left outer join ',@P_g,' on ',@P_fg,'.ACCESSION=',@P_g,'.ACCESSION where ',@P_g,'.ACCESSION is null;');
SET @sP_e = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@P_e,' (PRIMARY KEY my_pkey (ACCESSION)) select ',@P_eg,'.ACCESSION from ',@P_eg,' left outer join ',@P_g,' on ',@P_eg,'.ACCESSION=',@P_g,'.ACCESSION where ',@P_g,'.ACCESSION is null;');
SET @sP_c = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@P_c,' (PRIMARY KEY my_pkey (ACCESSION)) select ',@P_cg,'.ACCESSION from ',@P_cg,' left outer join ',@P_g,' on ',@P_cg,'.ACCESSION=',@P_g,'.ACCESSION where ',@P_g,'.ACCESSION is null;');


SET @sP_cegikmo = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@P_cegikmo,' (PRIMARY KEY my_pkey (ACCESSION)) select ',@P_egmo,'.ACCESSION from ',@P_egmo,', ',@P_ik,', ',@P_c,' where ',@P_egmo,'.ACCESSION=',@P_ik,'.ACCESSION and ',@P_ik,'.ACCESSION=',@P_c,'.ACCESSION;');
SET @sP_cfgjkno = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@P_cfgjkno,' (PRIMARY KEY my_pkey (ACCESSION)) select ',@P_fgno,'.ACCESSION from ',@P_fgno,', ',@P_jk,', ',@P_c,' where ',@P_fgno,'.ACCESSION=',@P_jk,'.ACCESSION and ',@P_jk,'.ACCESSION=',@P_c,'.ACCESSION;');
SET @sP_ijklmno = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@P_ijklmno,' (PRIMARY KEY my_pkey (ACCESSION)) select ',@P_lmno,'.ACCESSION from ',@P_lmno,', ',@P_jk,', ',@P_i,' where ',@P_lmno,'.ACCESSION=',@P_jk,'.ACCESSION and ',@P_jk,'.ACCESSION=',@P_i,'.ACCESSION;');
SET @sP_efglmno = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@P_efglmno,' (PRIMARY KEY my_pkey (ACCESSION)) select ',@P_lmno,'.ACCESSION from ',@P_lmno,', ',@P_fg,', ',@P_e,' where ',@P_lmno,'.ACCESSION=',@P_fg,'.ACCESSION and ',@P_fg,'.ACCESSION=',@P_e,'.ACCESSION;');


SET @sP_a = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@P_a,' (PRIMARY KEY my_pkey (ACCESSION)) select ',@P_acegikmo,'.ACCESSION from ',@P_acegikmo,' left outer join ',@P_cegikmo,' on ',@P_acegikmo,'.ACCESSION=',@P_cegikmo,'.ACCESSION where ',@P_cegikmo,'.ACCESSION is null;');
SET @sP_b = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@P_b,' (PRIMARY KEY my_pkey (ACCESSION)) select ',@P_bcfgjkno,'.ACCESSION from ',@P_bcfgjkno,' left outer join ',@P_cfgjkno,' on ',@P_bcfgjkno,'.ACCESSION=',@P_cfgjkno,'.ACCESSION where ',@P_cfgjkno,'.ACCESSION is null;');
SET @sP_d = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@P_d,' (PRIMARY KEY my_pkey (ACCESSION)) select ',@P_defglmno,'.ACCESSION from ',@P_defglmno,' left outer join ',@P_efglmno,' on ',@P_defglmno,'.ACCESSION=',@P_efglmno,'.ACCESSION where ',@P_efglmno,'.ACCESSION is null;');
SET @sP_h = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@P_h,' (PRIMARY KEY my_pkey (ACCESSION)) select ',@P_hijklmno,'.ACCESSION from ',@P_hijklmno,' left outer join ',@P_ijklmno,' on ',@P_hijklmno,'.ACCESSION=',@P_ijklmno,'.ACCESSION where ',@P_ijklmno,'.ACCESSION is null;');


PREPARE stmtP_hijklmno FROM @sP_hijklmno;
EXECUTE stmtP_hijklmno;

PREPARE stmtP_defglmno FROM @sP_defglmno;
EXECUTE stmtP_defglmno;

PREPARE stmtP_bcfgjkno FROM @sP_bcfgjkno;
EXECUTE stmtP_bcfgjkno;

PREPARE stmtP_acegikmo FROM @sP_acegikmo;
EXECUTE stmtP_acegikmo;

PREPARE stmtP_lmno FROM @sP_lmno;
EXECUTE stmtP_lmno;

PREPARE stmtP_jkno FROM @sP_jkno;
EXECUTE stmtP_jkno;

PREPARE stmtP_ikmo FROM @sP_ikmo;
EXECUTE stmtP_ikmo;

PREPARE stmtP_fgno FROM @sP_fgno;
EXECUTE stmtP_fgno;

PREPARE stmtP_egmo FROM @sP_egmo;
EXECUTE stmtP_egmo;

PREPARE stmtP_cgko FROM @sP_cgko;
EXECUTE stmtP_cgko;

PREPARE stmtP_no FROM @sP_no;
EXECUTE stmtP_no;

PREPARE stmtP_mo FROM @sP_mo;
EXECUTE stmtP_mo;

PREPARE stmtP_ko FROM @sP_ko;
EXECUTE stmtP_ko;

PREPARE stmtP_go FROM @sP_go;
EXECUTE stmtP_go;

PREPARE stmtP_o FROM @sP_o;
EXECUTE stmtP_o;

PREPARE stmtP_n FROM @sP_n;
EXECUTE stmtP_n;

PREPARE stmtP_m FROM @sP_m;
EXECUTE stmtP_m;

PREPARE stmtP_k FROM @sP_k;
EXECUTE stmtP_k;

PREPARE stmtP_g FROM @sP_g;
EXECUTE stmtP_g;

PREPARE stmtP_lm FROM @sP_lm;
EXECUTE stmtP_lm;

PREPARE stmtP_l FROM @sP_l;
EXECUTE stmtP_l;

PREPARE stmtP_jk FROM @sP_jk;
EXECUTE stmtP_jk;

PREPARE stmtP_j FROM @sP_j;
EXECUTE stmtP_j;

PREPARE stmtP_ik FROM @sP_ik;
EXECUTE stmtP_ik;

PREPARE stmtP_i FROM @sP_i;
EXECUTE stmtP_i;

PREPARE stmtP_fg FROM @sP_fg;
EXECUTE stmtP_fg;

PREPARE stmtP_f FROM @sP_f;
EXECUTE stmtP_f;

PREPARE stmtP_eg FROM @sP_eg;
EXECUTE stmtP_eg;

PREPARE stmtP_e FROM @sP_e;
EXECUTE stmtP_e;

PREPARE stmtP_cg FROM @sP_cg;
EXECUTE stmtP_cg;

PREPARE stmtP_c FROM @sP_c;
EXECUTE stmtP_c;


PREPARE stmtP_cegikmo FROM @sP_cegikmo;
EXECUTE stmtP_cegikmo;

PREPARE stmtP_cfgjkno FROM @sP_cfgjkno;
EXECUTE stmtP_cfgjkno;

PREPARE stmtP_ijklmno FROM @sP_ijklmno;
EXECUTE stmtP_ijklmno;

PREPARE stmtP_efglmno FROM @sP_efglmno;
EXECUTE stmtP_efglmno;


PREPARE stmtP_a FROM @sP_a;
EXECUTE stmtP_a;

PREPARE stmtP_b FROM @sP_b;
EXECUTE stmtP_b;

PREPARE stmtP_d FROM @sP_d;
EXECUTE stmtP_d;

PREPARE stmtP_h FROM @sP_h;
EXECUTE stmtP_h;



END//
DELIMITER ;



DELIMITER //
DROP PROCEDURE IF EXISTS `GM_1SET`//
CREATE PROCEDURE `GM_1SET` (IN s_id VARCHAR(64))
BEGIN

SET @GM = CONCAT('GM_a_',s_id);
SET @plist = CONCAT('protlist1_',s_id);
SET @sGM = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@GM,' (PRIMARY KEY my_pkey (ONTOLOGY)) select DISTINCT ONTOLOGY from PROTEIN_ONTOLOGY, GO_TERMS where PROTEIN_ONTOLOGY.ONTOLOGY=GO_TERMS.TERM_ID AND GO_TERMS.NAMESPACE=1 AND ACCESSION IN (select ACCESSION from ', @plist,');');

PREPARE stmtGM FROM @sGM;
EXECUTE stmtGM;

END//
DELIMITER ;

DELIMITER //
DROP PROCEDURE IF EXISTS `GB_1SET`//
CREATE PROCEDURE `GB_1SET` (IN s_id VARCHAR(64))
BEGIN

SET @GB = CONCAT('GB_a_',s_id);
SET @plist = CONCAT('protlist1_',s_id);
SET @sGB = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@GB,' (PRIMARY KEY my_pkey (ONTOLOGY)) select DISTINCT ONTOLOGY from PROTEIN_ONTOLOGY, GO_TERMS where PROTEIN_ONTOLOGY.ONTOLOGY=GO_TERMS.TERM_ID AND GO_TERMS.NAMESPACE=0 AND ACCESSION IN (select ACCESSION from ', @plist,');');

PREPARE stmtGB FROM @sGB;
EXECUTE stmtGB;

END//
DELIMITER ;


DELIMITER //
DROP PROCEDURE IF EXISTS `PW_1SET`//
CREATE PROCEDURE `PW_1SET` (IN s_id VARCHAR(64))
BEGIN


SET @PW = CONCAT('PW_a_',s_id);
SET @plist = CONCAT('protlist1_',s_id);
SET @sPW = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@PW,' (PRIMARY KEY my_pkey (PATHWAY,SPEC)) select DISTINCT PATHWAY,SPEC from PROTEIN_PATHWAY, PATHWAY where PROTEIN_PATHWAY.PATHWAY=PATHWAY.ID AND PROTEIN_PATHWAY.SPEC=PATHWAY.SPECIES AND ACCESSION IN (select ACCESSION from ',@plist,');');

PREPARE stmtPW FROM @sPW;
EXECUTE stmtPW;

END//
DELIMITER ;

DELIMITER //
DROP PROCEDURE IF EXISTS `DM_1SET`//
CREATE PROCEDURE `DM_1SET` (IN s_id VARCHAR(64))
BEGIN

SET @DM = CONCAT('DM_a_',s_id);
SET @plist = CONCAT('protlist1_',s_id);
SET @sDM = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@DM,' (PRIMARY KEY my_pkey (DOMAIN)) select DISTINCT DOMAIN from PROTEIN_DOMAIN, DOMAIN where PROTEIN_DOMAIN.DOMAIN=DOMAIN.PFAM AND ACCESSION IN (select ACCESSION from ',@plist,');');

PREPARE stmtDM FROM @sDM;
EXECUTE stmtDM;

END//
DELIMITER ;


DELIMITER //
DROP PROCEDURE IF EXISTS `GM_2SET`//

CREATE PROCEDURE `GM_2SET` (IN s_id VARCHAR(64))
BEGIN

SET @GM_b = CONCAT('GM_b_',s_id);
SET @GM_c = CONCAT('GM_c_',s_id);
SET @GM_a = CONCAT('GM_a_',s_id);
SET @GM_bc = CONCAT('GM_bc_',s_id);
SET @GM_ac = CONCAT('GM_ac_',s_id);

SET @plist1 = CONCAT('protlist1_',s_id);
SET @plist2 = CONCAT('protlist2_',s_id);

SET @sGM_bc = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@GM_bc,' (PRIMARY KEY my_pkey (ONTOLOGY)) select DISTINCT PROTEIN_ONTOLOGY.ONTOLOGY from PROTEIN_ONTOLOGY, GO_TERMS where PROTEIN_ONTOLOGY.ONTOLOGY=GO_TERMS.TERM_ID AND GO_TERMS.NAMESPACE=1 AND ACCESSION IN (select ACCESSION from ',@plist1,');');
SET @sGM_ac = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@GM_ac,' (PRIMARY KEY my_pkey (ONTOLOGY)) select DISTINCT PROTEIN_ONTOLOGY.ONTOLOGY from PROTEIN_ONTOLOGY, GO_TERMS where PROTEIN_ONTOLOGY.ONTOLOGY=GO_TERMS.TERM_ID AND GO_TERMS.NAMESPACE=1 AND ACCESSION IN (select ACCESSION from ',@plist2,');');

SET @sGM_c = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@GM_c,' (PRIMARY KEY my_pkey (ONTOLOGY)) select ',@GM_bc,'.ONTOLOGY from ',@GM_bc,' join ',@GM_ac,' on ',@GM_bc,'.ONTOLOGY=',@GM_ac,'.ONTOLOGY;');
SET @sGM_b = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@GM_b,' (PRIMARY KEY my_pkey (ONTOLOGY)) select ',@GM_bc,'.ONTOLOGY from ',@GM_bc,' left outer join ',@GM_ac,' on ',@GM_bc,'.ONTOLOGY=',@GM_ac,'.ONTOLOGY where ',@GM_ac,'.ONTOLOGY is null;');
SET @sGM_a = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@GM_a,' (PRIMARY KEY my_pkey (ONTOLOGY)) select ',@GM_ac,'.ONTOLOGY from ',@GM_ac,' left outer join ',@GM_bc,' on ',@GM_bc,'.ONTOLOGY=',@GM_ac,'.ONTOLOGY where ',@GM_bc,'.ONTOLOGY is null;');

PREPARE stmtGM_bc FROM @sGM_bc;
EXECUTE stmtGM_bc;

PREPARE stmtGM_ac FROM @sGM_ac;
EXECUTE stmtGM_ac;

PREPARE stmtGM_a FROM @sGM_a;
EXECUTE stmtGM_a;

PREPARE stmtGM_b FROM @sGM_b;
EXECUTE stmtGM_b;

PREPARE stmtGM_c FROM @sGM_c;
EXECUTE stmtGM_c;

END//
DELIMITER ;

DELIMITER //
DROP PROCEDURE IF EXISTS `GB_2SET`//

CREATE PROCEDURE `GB_2SET` (IN s_id VARCHAR(64))
BEGIN


SET @GB_a = CONCAT('GB_a_',s_id);
SET @GB_b = CONCAT('GB_b_',s_id);
SET @GB_c = CONCAT('GB_c_',s_id);
SET @GB_bc = CONCAT('GB_bc_',s_id);
SET @GB_ac = CONCAT('GB_ac_',s_id);

SET @plist1 = CONCAT('protlist1_',s_id);
SET @plist2 = CONCAT('protlist2_',s_id);

SET @sGB_bc = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@GB_bc,' (PRIMARY KEY my_pkey (ONTOLOGY)) select DISTINCT ONTOLOGY from PROTEIN_ONTOLOGY, GO_TERMS where PROTEIN_ONTOLOGY.ONTOLOGY=GO_TERMS.TERM_ID AND GO_TERMS.NAMESPACE=0 AND ACCESSION IN (select ACCESSION from ',@plist1,');');
SET @sGB_ac = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@GB_ac,' (PRIMARY KEY my_pkey (ONTOLOGY)) select DISTINCT ONTOLOGY from PROTEIN_ONTOLOGY, GO_TERMS where PROTEIN_ONTOLOGY.ONTOLOGY=GO_TERMS.TERM_ID AND GO_TERMS.NAMESPACE=0 AND ACCESSION IN (select ACCESSION from ',@plist2,');');

SET @sGB_c = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@GB_c,' (PRIMARY KEY my_pkey (ONTOLOGY)) select ',@GB_bc,'.ONTOLOGY from ',@GB_bc,' join ',@GB_ac,' on ',@GB_bc,'.ONTOLOGY=',@GB_ac,'.ONTOLOGY;');
SET @sGB_b = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@GB_b,' (PRIMARY KEY my_pkey (ONTOLOGY)) select ',@GB_bc,'.ONTOLOGY from ',@GB_bc,' left outer join ',@GB_ac,' on ',@GB_bc,'.ONTOLOGY=',@GB_ac,'.ONTOLOGY where ',@GB_ac,'.ONTOLOGY is null;');
SET @sGB_a = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@GB_a,' (PRIMARY KEY my_pkey (ONTOLOGY)) select ',@GB_ac,'.ONTOLOGY from ',@GB_ac,' left outer join ',@GB_bc,' on ',@GB_bc,'.ONTOLOGY=',@GB_ac,'.ONTOLOGY where ',@GB_bc,'.ONTOLOGY is null;');

PREPARE stmtGB_bc FROM @sGB_bc;
EXECUTE stmtGB_bc;

PREPARE stmtGB_ac FROM @sGB_ac;
EXECUTE stmtGB_ac;

PREPARE stmtGB_a FROM @sGB_a;
EXECUTE stmtGB_a;

PREPARE stmtGB_b FROM @sGB_b;
EXECUTE stmtGB_b;

PREPARE stmtGB_c FROM @sGB_c;
EXECUTE stmtGB_c;

END//
DELIMITER ;


DELIMITER //
DROP PROCEDURE IF EXISTS `PW_2SET`//

CREATE PROCEDURE `PW_2SET` (IN s_id VARCHAR(64))
BEGIN

SET @PW_a = CONCAT('PW_a_',s_id);
SET @PW_b = CONCAT('PW_b_',s_id);
SET @PW_c = CONCAT('PW_c_',s_id);
SET @PW_bc = CONCAT('PW_bc_',s_id);
SET @PW_ac = CONCAT('PW_ac_',s_id);

SET @plist1 = CONCAT('protlist1_',s_id);
SET @plist2 = CONCAT('protlist2_',s_id);

SET @sPW_bc = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@PW_bc,' (PRIMARY KEY my_pkey (PATHWAY,SPEC)) select DISTINCT PATHWAY,SPEC from PROTEIN_PATHWAY, PATHWAY where PROTEIN_PATHWAY.PATHWAY=PATHWAY.ID AND PROTEIN_PATHWAY.SPEC=PATHWAY.SPECIES AND ACCESSION IN (select ACCESSION from ',@plist1,');');
SET @sPW_ac = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@PW_ac,' (PRIMARY KEY my_pkey (PATHWAY,SPEC)) select DISTINCT PATHWAY,SPEC from PROTEIN_PATHWAY, PATHWAY where PROTEIN_PATHWAY.PATHWAY=PATHWAY.ID AND PROTEIN_PATHWAY.SPEC=PATHWAY.SPECIES AND ACCESSION IN (select ACCESSION from ',@plist2,');');

SET @sPW_c = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@PW_c,' (PRIMARY KEY my_pkey (PATHWAY,SPEC)) select ',@PW_bc,'.PATHWAY,',@PW_bc,'.SPEC from ',@PW_bc,' join ',@PW_ac,' on ',@PW_bc,'.PATHWAY=',@PW_ac,'.PATHWAY WHERE ',@PW_bc,'.SPEC=',@PW_ac,'.SPEC;');
SET @sPW_b = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@PW_b,' (PRIMARY KEY my_pkey (PATHWAY,SPEC)) select ',@PW_bc,'.PATHWAY,',@PW_bc,'.SPEC from ',@PW_bc,' left outer join ',@PW_ac,' on ',@PW_bc,'.PATHWAY=',@PW_ac,'.PATHWAY AND ',@PW_bc,'.SPEC=',@PW_ac,'.SPEC where ',@PW_ac,'.PATHWAY is null;');
SET @sPW_a = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@PW_a,' (PRIMARY KEY my_pkey (PATHWAY,SPEC)) select ',@PW_ac,'.PATHWAY,',@PW_ac,'.SPEC from ',@PW_ac,' left outer join ',@PW_bc,' on ',@PW_bc,'.PATHWAY=',@PW_ac,'.PATHWAY AND ',@PW_bc,'.SPEC=',@PW_ac,'.SPEC where ',@PW_bc,'.PATHWAY is null;');

PREPARE stmtPW_bc FROM @sPW_bc;
EXECUTE stmtPW_bc;

PREPARE stmtPW_ac FROM @sPW_ac;
EXECUTE stmtPW_ac;

PREPARE stmtPW_a FROM @sPW_a;
EXECUTE stmtPW_a;

PREPARE stmtPW_b FROM @sPW_b;
EXECUTE stmtPW_b;

PREPARE stmtPW_c FROM @sPW_c;
EXECUTE stmtPW_c;


END//
DELIMITER ;


DELIMITER //
DROP PROCEDURE IF EXISTS `DM_2SET`//

CREATE PROCEDURE `DM_2SET` (IN s_id VARCHAR(64))
BEGIN

SET @DM_a = CONCAT('DM_a_',s_id);
SET @DM_b = CONCAT('DM_b_',s_id);
SET @DM_c = CONCAT('DM_c_',s_id);
SET @DM_bc = CONCAT('DM_bc_',s_id);
SET @DM_ac = CONCAT('DM_ac_',s_id);

SET @plist1 = CONCAT('protlist1_',s_id);
SET @plist2 = CONCAT('protlist2_',s_id);


SET @sDM_bc = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@DM_bc,' (PRIMARY KEY my_pkey (DOMAIN)) select DISTINCT DOMAIN from PROTEIN_DOMAIN, DOMAIN where PROTEIN_DOMAIN.DOMAIN=DOMAIN.PFAM AND ACCESSION IN (select ACCESSION from ',@plist1,');');
SET @sDM_ac = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@DM_ac,' (PRIMARY KEY my_pkey (DOMAIN)) select DISTINCT DOMAIN from PROTEIN_DOMAIN, DOMAIN where PROTEIN_DOMAIN.DOMAIN=DOMAIN.PFAM AND ACCESSION IN (select ACCESSION from ',@plist2,');');

SET @sDM_c = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@DM_c,' (PRIMARY KEY my_pkey (DOMAIN)) select ',@DM_bc,'.DOMAIN from ',@DM_bc,' join ',@DM_ac,' on ',@DM_bc,'.DOMAIN=',@DM_ac,'.DOMAIN;');
SET @sDM_b = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@DM_b,' (PRIMARY KEY my_pkey (DOMAIN)) select ',@DM_bc,'.DOMAIN from ',@DM_bc,' left outer join ',@DM_ac,' on ',@DM_bc,'.DOMAIN=',@DM_ac,'.DOMAIN where ',@DM_ac,'.DOMAIN is null;');
SET @sDM_a = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@DM_a,' (PRIMARY KEY my_pkey (DOMAIN)) select ',@DM_ac,'.DOMAIN from ',@DM_ac,' left outer join ',@DM_bc,' on ',@DM_bc,'.DOMAIN=',@DM_ac,'.DOMAIN where ',@DM_bc,'.DOMAIN is null;');


PREPARE stmtDM_bc FROM @sDM_bc;
EXECUTE stmtDM_bc;

PREPARE stmtDM_ac FROM @sDM_ac;
EXECUTE stmtDM_ac;

PREPARE stmtDM_a FROM @sDM_a;
EXECUTE stmtDM_a;

PREPARE stmtDM_b FROM @sDM_b;
EXECUTE stmtDM_b;

PREPARE stmtDM_c FROM @sDM_c;
EXECUTE stmtDM_c;

END//
DELIMITER ;

DELIMITER //
DROP PROCEDURE IF EXISTS `GM_3SET`//

CREATE PROCEDURE `GM_3SET` (IN s_id VARCHAR(64))
BEGIN

SET @GM_a = CONCAT('GM_a_',s_id);
SET @GM_b = CONCAT('GM_b_',s_id);
SET @GM_c = CONCAT('GM_c_',s_id);
SET @GM_d = CONCAT('GM_d_',s_id);
SET @GM_e = CONCAT('GM_e_',s_id);
SET @GM_f = CONCAT('GM_f_',s_id);
SET @GM_g = CONCAT('GM_g_',s_id);

SET @GM_fg = CONCAT('GM_fg_',s_id);
SET @GM_eg = CONCAT('GM_eg_',s_id);
SET @GM_cg = CONCAT('GM_cg_',s_id);

SET @GM_defg = CONCAT('GM_defg_',s_id);
SET @GM_bcfg = CONCAT('GM_bcfg_',s_id);
SET @GM_aceg = CONCAT('GM_aceg_',s_id);

SET @plist1 = CONCAT('protlist1_',s_id);
SET @plist2 = CONCAT('protlist2_',s_id);
SET @plist3 = CONCAT('protlist3_',s_id);

SET @sGM_defg = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@GM_defg,' (PRIMARY KEY my_pkey (ONTOLOGY)) select DISTINCT ONTOLOGY from PROTEIN_ONTOLOGY, GO_TERMS where PROTEIN_ONTOLOGY.ONTOLOGY=GO_TERMS.TERM_ID AND GO_TERMS.NAMESPACE=1 AND ACCESSION IN (select ACCESSION from ',@plist1,');');
SET @sGM_bcfg = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@GM_bcfg,' (PRIMARY KEY my_pkey (ONTOLOGY)) select DISTINCT ONTOLOGY from PROTEIN_ONTOLOGY, GO_TERMS where PROTEIN_ONTOLOGY.ONTOLOGY=GO_TERMS.TERM_ID AND GO_TERMS.NAMESPACE=1 AND ACCESSION IN (select ACCESSION from ',@plist2,');');
SET @sGM_aceg = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@GM_aceg,' (PRIMARY KEY my_pkey (ONTOLOGY)) select DISTINCT ONTOLOGY from PROTEIN_ONTOLOGY, GO_TERMS where PROTEIN_ONTOLOGY.ONTOLOGY=GO_TERMS.TERM_ID AND GO_TERMS.NAMESPACE=1 AND ACCESSION IN (select ACCESSION from ',@plist3,');');

SET @sGM_fg = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@GM_fg,' (PRIMARY KEY my_pkey (ONTOLOGY)) select ',@GM_defg,'.ONTOLOGY from ',@GM_defg,' join ',@GM_bcfg,' on ',@GM_defg,'.ONTOLOGY=',@GM_bcfg,'.ONTOLOGY;');
SET @sGM_eg = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@GM_eg,' (PRIMARY KEY my_pkey (ONTOLOGY)) select ',@GM_defg,'.ONTOLOGY from ',@GM_defg,' join ',@GM_aceg,' on ',@GM_defg,'.ONTOLOGY=',@GM_aceg,'.ONTOLOGY;');
SET @sGM_cg = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@GM_cg,' (PRIMARY KEY my_pkey (ONTOLOGY)) select ',@GM_bcfg,'.ONTOLOGY from ',@GM_bcfg,' join ',@GM_aceg,' on ',@GM_bcfg,'.ONTOLOGY=',@GM_aceg,'.ONTOLOGY;');

SET @sGM_g = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@GM_g,' (PRIMARY KEY my_pkey (ONTOLOGY)) select ',@GM_fg,'.ONTOLOGY from ',@GM_fg,' join ',@GM_eg,' on ',@GM_fg,'.ONTOLOGY=',@GM_eg,'.ONTOLOGY and ',@GM_fg,'.ONTOLOGY IN ( select ONTOLOGY from ',@GM_cg,');');

SET @sGM_f = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@GM_f,' (PRIMARY KEY my_pkey (ONTOLOGY)) select ',@GM_fg,'.ONTOLOGY from ',@GM_fg,' left outer join ',@GM_aceg,' on ',@GM_fg,'.ONTOLOGY=',@GM_aceg,'.ONTOLOGY where ',@GM_aceg,'.ONTOLOGY is null;');
SET @sGM_e = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@GM_e,' (PRIMARY KEY my_pkey (ONTOLOGY)) select ',@GM_eg,'.ONTOLOGY from ',@GM_eg,' left outer join ',@GM_bcfg,' on ',@GM_eg,'.ONTOLOGY=',@GM_bcfg,'.ONTOLOGY where ',@GM_bcfg,'.ONTOLOGY is null;');
SET @sGM_c = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@GM_c,' (PRIMARY KEY my_pkey (ONTOLOGY)) select ',@GM_cg,'.ONTOLOGY from ',@GM_cg,' left outer join ',@GM_defg,' on ',@GM_cg,'.ONTOLOGY=',@GM_defg,'.ONTOLOGY where ',@GM_defg,'.ONTOLOGY is null;');

SET @sGM_d = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@GM_d,' (PRIMARY KEY my_pkey (ONTOLOGY)) select ',@GM_defg,'.ONTOLOGY from ',@GM_defg,' where ',@GM_defg,'.ONTOLOGY NOT IN (select ONTOLOGY from ',@GM_fg,' union select ONTOLOGY from ',@GM_eg,');');
SET @sGM_b = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@GM_b,' (PRIMARY KEY my_pkey (ONTOLOGY)) select ',@GM_bcfg,'.ONTOLOGY from ',@GM_bcfg,' where ',@GM_bcfg,'.ONTOLOGY NOT IN (select ONTOLOGY from ',@GM_fg,' union select ONTOLOGY from ',@GM_cg,');');
SET @sGM_a = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@GM_a,' (PRIMARY KEY my_pkey (ONTOLOGY)) select ',@GM_aceg,'.ONTOLOGY from ',@GM_aceg,' where ',@GM_aceg,'.ONTOLOGY NOT IN (select ONTOLOGY from ',@GM_eg,' union select ONTOLOGY from ',@GM_cg,');');


PREPARE stmtGM_defg FROM @sGM_defg;
EXECUTE stmtGM_defg;

PREPARE stmtGM_bcfg FROM @sGM_bcfg;
EXECUTE stmtGM_bcfg;

PREPARE stmtGM_aceg FROM @sGM_aceg;
EXECUTE stmtGM_aceg;

PREPARE stmtGM_fg FROM @sGM_fg;
EXECUTE stmtGM_fg;

PREPARE stmtGM_eg FROM @sGM_eg; 
EXECUTE stmtGM_eg; 

PREPARE stmtGM_cg FROM @sGM_cg;
EXECUTE stmtGM_cg;

PREPARE stmtGM_a FROM @sGM_a;
EXECUTE stmtGM_a;

PREPARE stmtGM_b FROM @sGM_b;
EXECUTE stmtGM_b;

PREPARE stmtGM_c FROM @sGM_c;
EXECUTE stmtGM_c;

PREPARE stmtGM_d FROM @sGM_d;
EXECUTE stmtGM_d;

PREPARE stmtGM_e FROM @sGM_e;
EXECUTE stmtGM_e;

PREPARE stmtGM_f FROM @sGM_f;
EXECUTE stmtGM_f;

PREPARE stmtGM_g FROM @sGM_g;
EXECUTE stmtGM_g;

END//
DELIMITER ;


DELIMITER //
DROP PROCEDURE IF EXISTS `GB_3SET`//

CREATE PROCEDURE `GB_3SET` (IN s_id VARCHAR(64))
BEGIN

SET @GB_a = CONCAT('GB_a_',s_id);
SET @GB_b = CONCAT('GB_b_',s_id);
SET @GB_c = CONCAT('GB_c_',s_id);
SET @GB_d = CONCAT('GB_d_',s_id);
SET @GB_e = CONCAT('GB_e_',s_id);
SET @GB_f = CONCAT('GB_f_',s_id);
SET @GB_g = CONCAT('GB_g_',s_id);

SET @GB_fg = CONCAT('GB_fg_',s_id);
SET @GB_eg = CONCAT('GB_eg_',s_id);
SET @GB_cg = CONCAT('GB_cg_',s_id);

SET @GB_defg = CONCAT('GB_defg_',s_id);
SET @GB_bcfg = CONCAT('GB_bcfg_',s_id);
SET @GB_aceg = CONCAT('GB_aceg_',s_id);


SET @plist1 = CONCAT('protlist1_',s_id);
SET @plist2 = CONCAT('protlist2_',s_id);
SET @plist3 = CONCAT('protlist3_',s_id);


SET @sGB_defg = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@GB_defg,' (PRIMARY KEY my_pkey (ONTOLOGY)) select DISTINCT ONTOLOGY from PROTEIN_ONTOLOGY, GO_TERMS where PROTEIN_ONTOLOGY.ONTOLOGY=GO_TERMS.TERM_ID AND GO_TERMS.NAMESPACE=0 AND ACCESSION IN (select ACCESSION from ',@plist1,');');
SET @sGB_bcfg = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@GB_bcfg,' (PRIMARY KEY my_pkey (ONTOLOGY)) select DISTINCT ONTOLOGY from PROTEIN_ONTOLOGY, GO_TERMS where PROTEIN_ONTOLOGY.ONTOLOGY=GO_TERMS.TERM_ID AND GO_TERMS.NAMESPACE=0 AND ACCESSION IN (select ACCESSION from ',@plist2,');');
SET @sGB_aceg = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@GB_aceg,' (PRIMARY KEY my_pkey (ONTOLOGY)) select DISTINCT ONTOLOGY from PROTEIN_ONTOLOGY, GO_TERMS where PROTEIN_ONTOLOGY.ONTOLOGY=GO_TERMS.TERM_ID AND GO_TERMS.NAMESPACE=0 AND ACCESSION IN (select ACCESSION from ',@plist3,');');

SET @sGB_fg = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@GB_fg,' (PRIMARY KEY my_pkey (ONTOLOGY)) select ',@GB_defg,'.ONTOLOGY from ',@GB_defg,' join ',@GB_bcfg,' on ',@GB_defg,'.ONTOLOGY=',@GB_bcfg,'.ONTOLOGY;');
SET @sGB_eg = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@GB_eg,' (PRIMARY KEY my_pkey (ONTOLOGY)) select ',@GB_defg,'.ONTOLOGY from ',@GB_defg,' join ',@GB_aceg,' on ',@GB_defg,'.ONTOLOGY=',@GB_aceg,'.ONTOLOGY;');
SET @sGB_cg = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@GB_cg,' (PRIMARY KEY my_pkey (ONTOLOGY)) select ',@GB_bcfg,'.ONTOLOGY from ',@GB_bcfg,' join ',@GB_aceg,' on ',@GB_bcfg,'.ONTOLOGY=',@GB_aceg,'.ONTOLOGY;');

SET @sGB_g = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@GB_g,' (PRIMARY KEY my_pkey (ONTOLOGY)) select ',@GB_fg,'.ONTOLOGY from ',@GB_fg,' join ',@GB_eg,' on ',@GB_fg,'.ONTOLOGY=',@GB_eg,'.ONTOLOGY and ',@GB_fg,'.ONTOLOGY IN ( select ONTOLOGY from ',@GB_cg,');');

SET @sGB_f = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@GB_f,' (PRIMARY KEY my_pkey (ONTOLOGY)) select ',@GB_fg,'.ONTOLOGY from ',@GB_fg,' left outer join ',@GB_aceg,' on ',@GB_fg,'.ONTOLOGY=',@GB_aceg,'.ONTOLOGY where ',@GB_aceg,'.ONTOLOGY is null;');
SET @sGB_e = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@GB_e,' (PRIMARY KEY my_pkey (ONTOLOGY)) select ',@GB_eg,'.ONTOLOGY from ',@GB_eg,' left outer join ',@GB_bcfg,' on ',@GB_eg,'.ONTOLOGY=',@GB_bcfg,'.ONTOLOGY where ',@GB_bcfg,'.ONTOLOGY is null;');
SET @sGB_c = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@GB_c,' (PRIMARY KEY my_pkey (ONTOLOGY)) select ',@GB_cg,'.ONTOLOGY from ',@GB_cg,' left outer join ',@GB_defg,' on ',@GB_cg,'.ONTOLOGY=',@GB_defg,'.ONTOLOGY where ',@GB_defg,'.ONTOLOGY is null;');

SET @sGB_d = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@GB_d,' (PRIMARY KEY my_pkey (ONTOLOGY)) select ',@GB_defg,'.ONTOLOGY from ',@GB_defg,' where ',@GB_defg,'.ONTOLOGY NOT IN (select ONTOLOGY from ',@GB_fg,' union select ONTOLOGY from ',@GB_eg,');');
SET @sGB_b = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@GB_b,' (PRIMARY KEY my_pkey (ONTOLOGY)) select ',@GB_bcfg,'.ONTOLOGY from ',@GB_bcfg,' where ',@GB_bcfg,'.ONTOLOGY NOT IN (select ONTOLOGY from ',@GB_fg,' union select ONTOLOGY from ',@GB_cg,');');
SET @sGB_a = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@GB_a,' (PRIMARY KEY my_pkey (ONTOLOGY)) select ',@GB_aceg,'.ONTOLOGY from ',@GB_aceg,' where ',@GB_aceg,'.ONTOLOGY NOT IN (select ONTOLOGY from ',@GB_eg,' union select ONTOLOGY from ',@GB_cg,');');


PREPARE stmtGB_defg FROM @sGB_defg;
EXECUTE stmtGB_defg;

PREPARE stmtGB_bcfg FROM @sGB_bcfg;
EXECUTE stmtGB_bcfg;

PREPARE stmtGB_aceg FROM @sGB_aceg;
EXECUTE stmtGB_aceg;

PREPARE stmtGB_fg FROM @sGB_fg;
EXECUTE stmtGB_fg;

PREPARE stmtGB_eg FROM @sGB_eg;
EXECUTE stmtGB_eg;

PREPARE stmtGB_cg FROM @sGB_cg;
EXECUTE stmtGB_cg;

PREPARE stmtGB_a FROM @sGB_a;
EXECUTE stmtGB_a;

PREPARE stmtGB_b FROM @sGB_b;
EXECUTE stmtGB_b;

PREPARE stmtGB_c FROM @sGB_c;
EXECUTE stmtGB_c;

PREPARE stmtGB_d FROM @sGB_d;
EXECUTE stmtGB_d;

PREPARE stmtGB_e FROM @sGB_e;
EXECUTE stmtGB_e;

PREPARE stmtGB_f FROM @sGB_f;
EXECUTE stmtGB_f;

PREPARE stmtGB_g FROM @sGB_g;
EXECUTE stmtGB_g;

END//
DELIMITER ;


DELIMITER //
DROP PROCEDURE IF EXISTS `PW_3SET`//

CREATE PROCEDURE `PW_3SET` (IN s_id VARCHAR(64))
BEGIN

SET @PW_a = CONCAT('PW_a_',s_id);
SET @PW_b = CONCAT('PW_b_',s_id);
SET @PW_c = CONCAT('PW_c_',s_id);
SET @PW_d = CONCAT('PW_d_',s_id);
SET @PW_e = CONCAT('PW_e_',s_id);
SET @PW_f = CONCAT('PW_f_',s_id);
SET @PW_g = CONCAT('PW_g_',s_id);

SET @PW_fg = CONCAT('PW_fg_',s_id);
SET @PW_eg = CONCAT('PW_eg_',s_id);
SET @PW_cg = CONCAT('PW_cg_',s_id);

SET @PW_defg = CONCAT('PW_defg_',s_id);
SET @PW_bcfg = CONCAT('PW_bcfg_',s_id);
SET @PW_aceg = CONCAT('PW_aceg_',s_id);

SET @plist1 = CONCAT('protlist1_',s_id);
SET @plist2 = CONCAT('protlist2_',s_id);
SET @plist3 = CONCAT('protlist3_',s_id);

SET @sPW_defg = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@PW_defg,' (PRIMARY KEY my_pkey (PATHWAY,SPEC)) select DISTINCT PATHWAY,SPEC from PROTEIN_PATHWAY, PATHWAY where PROTEIN_PATHWAY.PATHWAY=PATHWAY.ID AND PROTEIN_PATHWAY.SPEC=PATHWAY.SPECIES AND ACCESSION IN (select ACCESSION from ',@plist1,');');
SET @sPW_bcfg = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@PW_bcfg,' (PRIMARY KEY my_pkey (PATHWAY,SPEC)) select DISTINCT PATHWAY,SPEC from PROTEIN_PATHWAY, PATHWAY where PROTEIN_PATHWAY.PATHWAY=PATHWAY.ID AND PROTEIN_PATHWAY.SPEC=PATHWAY.SPECIES AND ACCESSION IN (select ACCESSION from ',@plist2,');');
SET @sPW_aceg = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@PW_aceg,' (PRIMARY KEY my_pkey (PATHWAY,SPEC)) select DISTINCT PATHWAY,SPEC from PROTEIN_PATHWAY, PATHWAY where PROTEIN_PATHWAY.PATHWAY=PATHWAY.ID AND PROTEIN_PATHWAY.SPEC=PATHWAY.SPECIES AND ACCESSION IN (select ACCESSION from ',@plist3,');');

SET @sPW_fg = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@PW_fg,' (PRIMARY KEY my_pkey (PATHWAY,SPEC)) select ',@PW_defg,'.PATHWAY,',@PW_defg,'.SPEC from ',@PW_defg,' join ',@PW_bcfg,' on ',@PW_defg,'.PATHWAY=',@PW_bcfg,'.PATHWAY  WHERE ',@PW_defg,'.SPEC=',@PW_bcfg,'.SPEC;');
SET @sPW_eg = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@PW_eg,' (PRIMARY KEY my_pkey (PATHWAY,SPEC)) select ',@PW_defg,'.PATHWAY,',@PW_defg,'.SPEC from ',@PW_defg,' join ',@PW_aceg,' on ',@PW_defg,'.PATHWAY=',@PW_aceg,'.PATHWAY  WHERE ',@PW_defg,'.SPEC=',@PW_aceg,'.SPEC;');
SET @sPW_cg = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@PW_cg,' (PRIMARY KEY my_pkey (PATHWAY,SPEC)) select ',@PW_bcfg,'.PATHWAY,',@PW_bcfg,'.SPEC from ',@PW_bcfg,' join ',@PW_aceg,' on ',@PW_bcfg,'.PATHWAY=',@PW_aceg,'.PATHWAY  WHERE ',@PW_bcfg,'.SPEC=',@PW_aceg,'.SPEC;');

SET @sPW_g = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@PW_g,' (PRIMARY KEY my_pkey (PATHWAY,SPEC)) select ',@PW_fg,'.PATHWAY,',@PW_fg,'.SPEC  from ',@PW_fg,' join ',@PW_eg,' on ',@PW_fg,'.PATHWAY=',@PW_eg,'.PATHWAY AND ',@PW_fg,'.SPEC=',@PW_eg,'.SPEC WHERE ',@PW_fg,'.PATHWAY IN ( select PATHWAY from ',@PW_cg,');');

SET @sPW_f = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@PW_f,' (PRIMARY KEY my_pkey (PATHWAY,SPEC)) select ',@PW_fg,'.PATHWAY,',@PW_fg,'.SPEC from ',@PW_fg,' left outer join ',@PW_aceg,' on ',@PW_fg,'.PATHWAY=',@PW_aceg,'.PATHWAY AND ',@PW_aceg,'.SPEC=',@PW_fg,'.SPEC  where ',@PW_aceg,'.PATHWAY is null;');
SET @sPW_e = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@PW_e,' (PRIMARY KEY my_pkey (PATHWAY,SPEC)) select ',@PW_eg,'.PATHWAY,',@PW_eg,'.SPEC from ',@PW_eg,' left outer join ',@PW_bcfg,' on ',@PW_eg,'.PATHWAY=',@PW_bcfg,'.PATHWAY AND ',@PW_bcfg,'.SPEC=',@PW_eg,'.SPEC  where ',@PW_bcfg,'.PATHWAY is null;');
SET @sPW_c = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@PW_c,' (PRIMARY KEY my_pkey (PATHWAY,SPEC)) select ',@PW_cg,'.PATHWAY,',@PW_cg,'.SPEC from ',@PW_cg,' left outer join ',@PW_defg,' on ',@PW_cg,'.PATHWAY=',@PW_defg,'.PATHWAY AND ',@PW_defg,'.SPEC=',@PW_cg,'.SPEC  where ',@PW_defg,'.PATHWAY is null;');

SET @sPW_d = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@PW_d,' (PRIMARY KEY my_pkey (PATHWAY,SPEC)) select ',@PW_defg,'.PATHWAY,',@PW_defg,'.SPEC from ',@PW_defg,' where ',@PW_defg,'.PATHWAY NOT IN (select PATHWAY from ',@PW_fg,' union select PATHWAY from ',@PW_eg,');');
SET @sPW_b = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@PW_b,' (PRIMARY KEY my_pkey (PATHWAY,SPEC)) select ',@PW_bcfg,'.PATHWAY,',@PW_bcfg,'.SPEC from ',@PW_bcfg,' where ',@PW_bcfg,'.PATHWAY NOT IN (select PATHWAY from ',@PW_fg,' union select PATHWAY from ',@PW_cg,');');
SET @sPW_a = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@PW_a,' (PRIMARY KEY my_pkey (PATHWAY,SPEC)) select ',@PW_aceg,'.PATHWAY,',@PW_aceg,'.SPEC from ',@PW_aceg,' where ',@PW_aceg,'.PATHWAY NOT IN (select PATHWAY from ',@PW_eg,' union select PATHWAY from ',@PW_cg,');');

PREPARE stmtPW_defg FROM @sPW_defg;
EXECUTE stmtPW_defg;

PREPARE stmtPW_bcfg FROM @sPW_bcfg;
EXECUTE stmtPW_bcfg;

PREPARE stmtPW_aceg FROM @sPW_aceg;
EXECUTE stmtPW_aceg;

PREPARE stmtPW_fg FROM @sPW_fg;
EXECUTE stmtPW_fg;

PREPARE stmtPW_eg FROM @sPW_eg;
EXECUTE stmtPW_eg;

PREPARE stmtPW_cg FROM @sPW_cg;
EXECUTE stmtPW_cg;

PREPARE stmtPW_a FROM @sPW_a;
EXECUTE stmtPW_a;

PREPARE stmtPW_b FROM @sPW_b;
EXECUTE stmtPW_b;

PREPARE stmtPW_c FROM @sPW_c;
EXECUTE stmtPW_c;

PREPARE stmtPW_d FROM @sPW_d;
EXECUTE stmtPW_d;

PREPARE stmtPW_e FROM @sPW_e;
EXECUTE stmtPW_e;

PREPARE stmtPW_f FROM @sPW_f;
EXECUTE stmtPW_f;

PREPARE stmtPW_g FROM @sPW_g;
EXECUTE stmtPW_g;

END//
DELIMITER ;


DELIMITER //
DROP PROCEDURE IF EXISTS `DM_3SET`//

CREATE PROCEDURE `DM_3SET` (IN s_id VARCHAR(64))
BEGIN

SET @DM_a = CONCAT('DM_a_',s_id);
SET @DM_b = CONCAT('DM_b_',s_id);
SET @DM_c = CONCAT('DM_c_',s_id);
SET @DM_d = CONCAT('DM_d_',s_id);
SET @DM_e = CONCAT('DM_e_',s_id);
SET @DM_f = CONCAT('DM_f_',s_id);
SET @DM_g = CONCAT('DM_g_',s_id);

SET @DM_fg = CONCAT('DM_fg_',s_id);
SET @DM_eg = CONCAT('DM_eg_',s_id);
SET @DM_cg = CONCAT('DM_cg_',s_id);

SET @DM_defg = CONCAT('DM_defg_',s_id);
SET @DM_bcfg = CONCAT('DM_bcfg_',s_id);
SET @DM_aceg = CONCAT('DM_aceg_',s_id);

SET @plist1 = CONCAT('protlist1_',s_id);
SET @plist2 = CONCAT('protlist2_',s_id);
SET @plist3 = CONCAT('protlist3_',s_id);

SET @sDM_defg = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@DM_defg,' (PRIMARY KEY my_pkey (DOMAIN)) select DISTINCT DOMAIN from PROTEIN_DOMAIN, DOMAIN where PROTEIN_DOMAIN.DOMAIN=DOMAIN.PFAM AND ACCESSION IN (select ACCESSION from ',@plist1,');');
SET @sDM_bcfg = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@DM_bcfg,' (PRIMARY KEY my_pkey (DOMAIN)) select DISTINCT DOMAIN from PROTEIN_DOMAIN, DOMAIN where PROTEIN_DOMAIN.DOMAIN=DOMAIN.PFAM AND ACCESSION IN (select ACCESSION from ',@plist2,');');
SET @sDM_aceg = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@DM_aceg,' (PRIMARY KEY my_pkey (DOMAIN)) select DISTINCT DOMAIN from PROTEIN_DOMAIN, DOMAIN where PROTEIN_DOMAIN.DOMAIN=DOMAIN.PFAM AND ACCESSION IN (select ACCESSION from ',@plist3,');');

SET @sDM_fg = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@DM_fg,' (PRIMARY KEY my_pkey (DOMAIN)) select ',@DM_defg,'.DOMAIN from ',@DM_defg,' join ',@DM_bcfg,' on ',@DM_defg,'.DOMAIN=',@DM_bcfg,'.DOMAIN;');
SET @sDM_eg = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@DM_eg,' (PRIMARY KEY my_pkey (DOMAIN)) select ',@DM_defg,'.DOMAIN from ',@DM_defg,' join ',@DM_aceg,' on ',@DM_defg,'.DOMAIN=',@DM_aceg,'.DOMAIN;');
SET @sDM_cg = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@DM_cg,' (PRIMARY KEY my_pkey (DOMAIN)) select ',@DM_bcfg,'.DOMAIN from ',@DM_bcfg,' join ',@DM_aceg,' on ',@DM_bcfg,'.DOMAIN=',@DM_aceg,'.DOMAIN;');

SET @sDM_g = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@DM_g,' (PRIMARY KEY my_pkey (DOMAIN)) select ',@DM_fg,'.DOMAIN from ',@DM_fg,' join ',@DM_eg,' on ',@DM_fg,'.DOMAIN=',@DM_eg,'.DOMAIN and ',@DM_fg,'.DOMAIN IN ( select DOMAIN from ',@DM_cg,');');

SET @sDM_f = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@DM_f,' (PRIMARY KEY my_pkey (DOMAIN)) select ',@DM_fg,'.DOMAIN from ',@DM_fg,' left outer join ',@DM_aceg,' on ',@DM_fg,'.DOMAIN=',@DM_aceg,'.DOMAIN where ',@DM_aceg,'.DOMAIN is null;');
SET @sDM_e = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@DM_e,' (PRIMARY KEY my_pkey (DOMAIN)) select ',@DM_eg,'.DOMAIN from ',@DM_eg,' left outer join ',@DM_bcfg,' on ',@DM_eg,'.DOMAIN=',@DM_bcfg,'.DOMAIN where ',@DM_bcfg,'.DOMAIN is null;');
SET @sDM_c = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@DM_c,' (PRIMARY KEY my_pkey (DOMAIN)) select ',@DM_cg,'.DOMAIN from ',@DM_cg,' left outer join ',@DM_defg,' on ',@DM_cg,'.DOMAIN=',@DM_defg,'.DOMAIN where ',@DM_defg,'.DOMAIN is null;');

SET @sDM_d = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@DM_d,' (PRIMARY KEY my_pkey (DOMAIN)) select ',@DM_defg,'.DOMAIN from ',@DM_defg,' where ',@DM_defg,'.DOMAIN NOT IN (select DOMAIN from ',@DM_fg,' union select DOMAIN from ',@DM_eg,');');
SET @sDM_b = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@DM_b,' (PRIMARY KEY my_pkey (DOMAIN)) select ',@DM_bcfg,'.DOMAIN from ',@DM_bcfg,' where ',@DM_bcfg,'.DOMAIN NOT IN (select DOMAIN from ',@DM_fg,' union select DOMAIN from ',@DM_cg,');');
SET @sDM_a = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@DM_a,' (PRIMARY KEY my_pkey (DOMAIN)) select ',@DM_aceg,'.DOMAIN from ',@DM_aceg,' where ',@DM_aceg,'.DOMAIN NOT IN (select DOMAIN from ',@DM_eg,' union select DOMAIN from ',@DM_cg,');');



PREPARE stmtDM_defg FROM @sDM_defg;
EXECUTE stmtDM_defg;

PREPARE stmtDM_bcfg FROM @sDM_bcfg;
EXECUTE stmtDM_bcfg;

PREPARE stmtDM_aceg FROM @sDM_aceg;
EXECUTE stmtDM_aceg;

PREPARE stmtDM_fg FROM @sDM_fg;
EXECUTE stmtDM_fg;

PREPARE stmtDM_eg FROM @sDM_eg;
EXECUTE stmtDM_eg;

PREPARE stmtDM_cg FROM @sDM_cg;
EXECUTE stmtDM_cg;

PREPARE stmtDM_a FROM @sDM_a;
EXECUTE stmtDM_a;

PREPARE stmtDM_b FROM @sDM_b;
EXECUTE stmtDM_b;

PREPARE stmtDM_c FROM @sDM_c;
EXECUTE stmtDM_c;

PREPARE stmtDM_d FROM @sDM_d;
EXECUTE stmtDM_d;

PREPARE stmtDM_e FROM @sDM_e;
EXECUTE stmtDM_e;

PREPARE stmtDM_f FROM @sDM_f;
EXECUTE stmtDM_f;

PREPARE stmtDM_g FROM @sDM_g;
EXECUTE stmtDM_g;

END//
DELIMITER ;



DELIMITER //
DROP PROCEDURE IF EXISTS `GM_4SET`//
CREATE PROCEDURE `GM_4SET` (IN s_id VARCHAR(64))
BEGIN


SET @plist1 = CONCAT('protlist1_',s_id);
SET @plist2 = CONCAT('protlist2_',s_id);
SET @plist3 = CONCAT('protlist3_',s_id);
SET @plist4 = CONCAT('protlist4_',s_id);

SET @GM_hijklmno = CONCAT('GM_hijklmno_',s_id);
SET @GM_defglmno = CONCAT('GM_defglmno_',s_id);
SET @GM_bcfgjkno = CONCAT('GM_bcfgjkno_',s_id);
SET @GM_acegikmo = CONCAT('GM_acegikmo_',s_id);

SET @GM_lmno = CONCAT('GM_lmno_',s_id);
SET @GM_jkno = CONCAT('GM_jkno_',s_id);
SET @GM_ikmo = CONCAT('GM_ikmo_',s_id);
SET @GM_fgno = CONCAT('GM_fgno_',s_id);
SET @GM_egmo = CONCAT('GM_egmo_',s_id);
SET @GM_cgko = CONCAT('GM_cgko_',s_id);

SET @GM_no = CONCAT('GM_no_',s_id);
SET @GM_mo = CONCAT('GM_mo_',s_id);
SET @GM_ko = CONCAT('GM_ko_',s_id);
SET @GM_go = CONCAT('GM_go_',s_id);

SET @GM_o = CONCAT('GM_o_',s_id);
SET @GM_n = CONCAT('GM_n_',s_id);
SET @GM_m = CONCAT('GM_m_',s_id);
SET @GM_k = CONCAT('GM_k_',s_id);
SET @GM_g = CONCAT('GM_g_',s_id);

SET @GM_l = CONCAT('GM_l_',s_ID);
SET @GM_j = CONCAT('GM_j_',s_ID);
SET @GM_i = CONCAT('GM_i_',s_ID);
SET @GM_f = CONCAT('GM_f_',s_ID);
SET @GM_e = CONCAT('GM_e_',s_ID);
SET @GM_c = CONCAT('GM_c_',s_ID);


SET @GM_lm = CONCAT('GM_lm_',s_ID);
SET @GM_jk = CONCAT('GM_jk_',s_ID);
SET @GM_ik = CONCAT('GM_ik_',s_ID);
SET @GM_fg = CONCAT('GM_fg_',s_ID);
SET @GM_eg = CONCAT('GM_eg_',s_ID);
SET @GM_cg = CONCAT('GM_cg_',s_ID);

SET @GM_cegikmo = CONCAT('GM_cegikmo_',s_ID);
SET @GM_cfgjkno = CONCAT('GM_cfgjkno_',s_ID);
SET @GM_efglmno = CONCAT('GM_efglmno_',s_ID);
SET @GM_ijklmno = CONCAT('GM_ijklmno_',s_ID);


SET @GM_a = CONCAT('GM_a_',s_ID);
SET @GM_b = CONCAT('GM_b_',s_ID);
SET @GM_d = CONCAT('GM_d_',s_ID);
SET @GM_h = CONCAT('GM_h_',s_ID);


SET @sGM_hijklmno = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@GM_hijklmno,' (PRIMARY KEY my_pkey (ONTOLOGY)) select DISTINCT ONTOLOGY from PROTEIN_ONTOLOGY, GO_TERMS where PROTEIN_ONTOLOGY.ONTOLOGY=GO_TERMS.TERM_ID AND GO_TERMS.NAMESPACE=1 AND ACCESSION IN (select ACCESSION from ',@plist1,');');
SET @sGM_defglmno = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@GM_defglmno,' (PRIMARY KEY my_pkey (ONTOLOGY)) select DISTINCT ONTOLOGY from PROTEIN_ONTOLOGY, GO_TERMS where PROTEIN_ONTOLOGY.ONTOLOGY=GO_TERMS.TERM_ID AND GO_TERMS.NAMESPACE=1 AND ACCESSION IN (select ACCESSION from ',@plist2,');');
SET @sGM_bcfgjkno = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@GM_bcfgjkno,' (PRIMARY KEY my_pkey (ONTOLOGY)) select DISTINCT ONTOLOGY from PROTEIN_ONTOLOGY, GO_TERMS where PROTEIN_ONTOLOGY.ONTOLOGY=GO_TERMS.TERM_ID AND GO_TERMS.NAMESPACE=1 AND ACCESSION IN (select ACCESSION from ',@plist3,');');
SET @sGM_acegikmo = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@GM_acegikmo,' (PRIMARY KEY my_pkey (ONTOLOGY)) select DISTINCT ONTOLOGY from PROTEIN_ONTOLOGY, GO_TERMS where PROTEIN_ONTOLOGY.ONTOLOGY=GO_TERMS.TERM_ID AND GO_TERMS.NAMESPACE=1 AND ACCESSION IN (select ACCESSION from ',@plist4,');');


SET @sGM_lmno = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@GM_lmno,' (PRIMARY KEY my_pkey (ONTOLOGY)) select ',@GM_hijklmno,'.ONTOLOGY from ',@GM_hijklmno,' join ',@GM_defglmno,' on ',@GM_hijklmno,'.ONTOLOGY=',@GM_defglmno,'.ONTOLOGY;');
SET @sGM_jkno = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@GM_jkno,' (PRIMARY KEY my_pkey (ONTOLOGY)) select ',@GM_hijklmno,'.ONTOLOGY from ',@GM_hijklmno,' join ',@GM_bcfgjkno,' on ',@GM_hijklmno,'.ONTOLOGY=',@GM_bcfgjkno,'.ONTOLOGY;');
SET @sGM_ikmo = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@GM_ikmo,' (PRIMARY KEY my_pkey (ONTOLOGY)) select ',@GM_hijklmno,'.ONTOLOGY from ',@GM_hijklmno,' join ',@GM_acegikmo,' on ',@GM_hijklmno,'.ONTOLOGY=',@GM_acegikmo,'.ONTOLOGY;');
SET @sGM_fgno = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@GM_fgno,' (PRIMARY KEY my_pkey (ONTOLOGY)) select ',@GM_defglmno,'.ONTOLOGY from ',@GM_defglmno,' join ',@GM_bcfgjkno,' on ',@GM_defglmno,'.ONTOLOGY=',@GM_bcfgjkno,'.ONTOLOGY;');
SET @sGM_egmo = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@GM_egmo,' (PRIMARY KEY my_pkey (ONTOLOGY)) select ',@GM_defglmno,'.ONTOLOGY from ',@GM_defglmno,' join ',@GM_acegikmo,' on ',@GM_defglmno,'.ONTOLOGY=',@GM_acegikmo,'.ONTOLOGY;');
SET @sGM_cgko = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@GM_cgko,' (PRIMARY KEY my_pkey (ONTOLOGY)) select ',@GM_bcfgjkno,'.ONTOLOGY from ',@GM_bcfgjkno,' join ',@GM_acegikmo,' on ',@GM_bcfgjkno,'.ONTOLOGY=',@GM_acegikmo,'.ONTOLOGY;');

SET @sGM_no = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@GM_no,' (PRIMARY KEY my_pkey (ONTOLOGY)) select ',@GM_hijklmno,'.ONTOLOGY from ',@GM_hijklmno,' join ',@GM_fgno,' on ',@GM_hijklmno,'.ONTOLOGY=',@GM_fgno,'.ONTOLOGY;');
SET @sGM_mo = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@GM_mo,' (PRIMARY KEY my_pkey (ONTOLOGY)) select ',@GM_hijklmno,'.ONTOLOGY from ',@GM_hijklmno,' join ',@GM_egmo,' on ',@GM_hijklmno,'.ONTOLOGY=',@GM_egmo,'.ONTOLOGY;');
SET @sGM_ko = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@GM_ko,' (PRIMARY KEY my_pkey (ONTOLOGY)) select ',@GM_hijklmno,'.ONTOLOGY from ',@GM_hijklmno,' join ',@GM_cgko,' on ',@GM_hijklmno,'.ONTOLOGY=',@GM_cgko,'.ONTOLOGY;');
SET @sGM_go = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@GM_go,' (PRIMARY KEY my_pkey (ONTOLOGY)) select ',@GM_defglmno,'.ONTOLOGY from ',@GM_defglmno,' join ',@GM_cgko,' on ',@GM_defglmno,'.ONTOLOGY=',@GM_cgko,'.ONTOLOGY;');

SET @sGM_o = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@GM_o,' (PRIMARY KEY my_pkey (ONTOLOGY)) select ',@GM_hijklmno,'.ONTOLOGY from ',@GM_hijklmno,' join ',@GM_go,' on ',@GM_hijklmno,'.ONTOLOGY=',@GM_go,'.ONTOLOGY;');


SET @sGM_n = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@GM_n,' (PRIMARY KEY my_pkey (ONTOLOGY)) select ',@GM_no,'.ONTOLOGY from ',@GM_no,' left outer join ',@GM_o,' on ',@GM_no,'.ONTOLOGY=',@GM_o,'.ONTOLOGY where ',@GM_o,'.ONTOLOGY is null;');
SET @sGM_m = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@GM_m,' (PRIMARY KEY my_pkey (ONTOLOGY)) select ',@GM_mo,'.ONTOLOGY from ',@GM_mo,' left outer join ',@GM_o,' on ',@GM_mo,'.ONTOLOGY=',@GM_o,'.ONTOLOGY where ',@GM_o,'.ONTOLOGY is null;');
SET @sGM_k = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@GM_k,' (PRIMARY KEY my_pkey (ONTOLOGY)) select ',@GM_ko,'.ONTOLOGY from ',@GM_ko,' left outer join ',@GM_o,' on ',@GM_ko,'.ONTOLOGY=',@GM_o,'.ONTOLOGY where ',@GM_o,'.ONTOLOGY is null;');
SET @sGM_g = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@GM_g,' (PRIMARY KEY my_pkey (ONTOLOGY)) select ',@GM_go,'.ONTOLOGY from ',@GM_go,' left outer join ',@GM_o,' on ',@GM_go,'.ONTOLOGY=',@GM_o,'.ONTOLOGY where ',@GM_o,'.ONTOLOGY is null;');


SET @sGM_lm = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@GM_lm,' (PRIMARY KEY my_pkey (ONTOLOGY)) select ',@GM_lmno,'.ONTOLOGY from ',@GM_lmno,' left outer join ',@GM_no,' on ',@GM_lmno,'.ONTOLOGY=',@GM_no,'.ONTOLOGY where ',@GM_no,'.ONTOLOGY is null;');
SET @sGM_jk = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@GM_jk,' (PRIMARY KEY my_pkey (ONTOLOGY)) select ',@GM_jkno,'.ONTOLOGY from ',@GM_jkno,' left outer join ',@GM_no,' on ',@GM_jkno,'.ONTOLOGY=',@GM_no,'.ONTOLOGY where ',@GM_no,'.ONTOLOGY is null;');
SET @sGM_ik = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@GM_ik,' (PRIMARY KEY my_pkey (ONTOLOGY)) select ',@GM_ikmo,'.ONTOLOGY from ',@GM_ikmo,' left outer join ',@GM_mo,' on ',@GM_ikmo,'.ONTOLOGY=',@GM_mo,'.ONTOLOGY where ',@GM_mo,'.ONTOLOGY is null;');
SET @sGM_fg = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@GM_fg,' (PRIMARY KEY my_pkey (ONTOLOGY)) select ',@GM_fgno,'.ONTOLOGY from ',@GM_fgno,' left outer join ',@GM_no,' on ',@GM_fgno,'.ONTOLOGY=',@GM_no,'.ONTOLOGY where ',@GM_no,'.ONTOLOGY is null;');
SET @sGM_eg = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@GM_eg,' (PRIMARY KEY my_pkey (ONTOLOGY)) select ',@GM_egmo,'.ONTOLOGY from ',@GM_egmo,' left outer join ',@GM_mo,' on ',@GM_egmo,'.ONTOLOGY=',@GM_mo,'.ONTOLOGY where ',@GM_mo,'.ONTOLOGY is null;');
SET @sGM_cg = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@GM_cg,' (PRIMARY KEY my_pkey (ONTOLOGY)) select ',@GM_cgko,'.ONTOLOGY from ',@GM_cgko,' left outer join ',@GM_ko,' on ',@GM_cgko,'.ONTOLOGY=',@GM_ko,'.ONTOLOGY where ',@GM_ko,'.ONTOLOGY is null;');


SET @sGM_l = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@GM_l,' (PRIMARY KEY my_pkey (ONTOLOGY)) select ',@GM_lm,'.ONTOLOGY from ',@GM_lm,' left outer join ',@GM_m,' on ',@GM_lm,'.ONTOLOGY=',@GM_m,'.ONTOLOGY where ',@GM_m,'.ONTOLOGY is null;');
SET @sGM_j = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@GM_j,' (PRIMARY KEY my_pkey (ONTOLOGY)) select ',@GM_jk,'.ONTOLOGY from ',@GM_jk,' left outer join ',@GM_k,' on ',@GM_jk,'.ONTOLOGY=',@GM_k,'.ONTOLOGY where ',@GM_k,'.ONTOLOGY is null;');
SET @sGM_i = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@GM_i,' (PRIMARY KEY my_pkey (ONTOLOGY)) select ',@GM_ik,'.ONTOLOGY from ',@GM_ik,' left outer join ',@GM_k,' on ',@GM_ik,'.ONTOLOGY=',@GM_k,'.ONTOLOGY where ',@GM_k,'.ONTOLOGY is null;');
SET @sGM_f = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@GM_f,' (PRIMARY KEY my_pkey (ONTOLOGY)) select ',@GM_fg,'.ONTOLOGY from ',@GM_fg,' left outer join ',@GM_g,' on ',@GM_fg,'.ONTOLOGY=',@GM_g,'.ONTOLOGY where ',@GM_g,'.ONTOLOGY is null;');
SET @sGM_e = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@GM_e,' (PRIMARY KEY my_pkey (ONTOLOGY)) select ',@GM_eg,'.ONTOLOGY from ',@GM_eg,' left outer join ',@GM_g,' on ',@GM_eg,'.ONTOLOGY=',@GM_g,'.ONTOLOGY where ',@GM_g,'.ONTOLOGY is null;');
SET @sGM_c = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@GM_c,' (PRIMARY KEY my_pkey (ONTOLOGY)) select ',@GM_cg,'.ONTOLOGY from ',@GM_cg,' left outer join ',@GM_g,' on ',@GM_cg,'.ONTOLOGY=',@GM_g,'.ONTOLOGY where ',@GM_g,'.ONTOLOGY is null;');


SET @sGM_cegikmo = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@GM_cegikmo,' (PRIMARY KEY my_pkey (ONTOLOGY)) select ',@GM_egmo,'.ONTOLOGY from ',@GM_egmo,', ',@GM_ik,', ',@GM_c,' where ',@GM_egmo,'.ONTOLOGY=',@GM_ik,'.ONTOLOGY and ',@GM_ik,'.ONTOLOGY=',@GM_c,'.ONTOLOGY;');
SET @sGM_cfgjkno = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@GM_cfgjkno,' (PRIMARY KEY my_pkey (ONTOLOGY)) select ',@GM_fgno,'.ONTOLOGY from ',@GM_fgno,', ',@GM_jk,', ',@GM_c,' where ',@GM_fgno,'.ONTOLOGY=',@GM_jk,'.ONTOLOGY and ',@GM_jk,'.ONTOLOGY=',@GM_c,'.ONTOLOGY;');
SET @sGM_ijklmno = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@GM_ijklmno,' (PRIMARY KEY my_pkey (ONTOLOGY)) select ',@GM_lmno,'.ONTOLOGY from ',@GM_lmno,', ',@GM_jk,', ',@GM_i,' where ',@GM_lmno,'.ONTOLOGY=',@GM_jk,'.ONTOLOGY and ',@GM_jk,'.ONTOLOGY=',@GM_i,'.ONTOLOGY;');
SET @sGM_efglmno = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@GM_efglmno,' (PRIMARY KEY my_pkey (ONTOLOGY)) select ',@GM_lmno,'.ONTOLOGY from ',@GM_lmno,', ',@GM_fg,', ',@GM_e,' where ',@GM_lmno,'.ONTOLOGY=',@GM_fg,'.ONTOLOGY and ',@GM_fg,'.ONTOLOGY=',@GM_e,'.ONTOLOGY;');


SET @sGM_a = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@GM_a,' (PRIMARY KEY my_pkey (ONTOLOGY)) select ',@GM_acegikmo,'.ONTOLOGY from ',@GM_acegikmo,' left outer join ',@GM_cegikmo,' on ',@GM_acegikmo,'.ONTOLOGY=',@GM_cegikmo,'.ONTOLOGY where ',@GM_cegikmo,'.ONTOLOGY is null;');
SET @sGM_b = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@GM_b,' (PRIMARY KEY my_pkey (ONTOLOGY)) select ',@GM_bcfgjkno,'.ONTOLOGY from ',@GM_bcfgjkno,' left outer join ',@GM_cfgjkno,' on ',@GM_bcfgjkno,'.ONTOLOGY=',@GM_cfgjkno,'.ONTOLOGY where ',@GM_cfgjkno,'.ONTOLOGY is null;');
SET @sGM_d = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@GM_d,' (PRIMARY KEY my_pkey (ONTOLOGY)) select ',@GM_defglmno,'.ONTOLOGY from ',@GM_defglmno,' left outer join ',@GM_efglmno,' on ',@GM_defglmno,'.ONTOLOGY=',@GM_efglmno,'.ONTOLOGY where ',@GM_efglmno,'.ONTOLOGY is null;');
SET @sGM_h = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@GM_h,' (PRIMARY KEY my_pkey (ONTOLOGY)) select ',@GM_hijklmno,'.ONTOLOGY from ',@GM_hijklmno,' left outer join ',@GM_ijklmno,' on ',@GM_hijklmno,'.ONTOLOGY=',@GM_ijklmno,'.ONTOLOGY where ',@GM_ijklmno,'.ONTOLOGY is null;');


PREPARE stmtGM_hijklmno FROM @sGM_hijklmno;
EXECUTE stmtGM_hijklmno;

PREPARE stmtGM_defglmno FROM @sGM_defglmno;
EXECUTE stmtGM_defglmno;

PREPARE stmtGM_bcfgjkno FROM @sGM_bcfgjkno;
EXECUTE stmtGM_bcfgjkno;

PREPARE stmtGM_acegikmo FROM @sGM_acegikmo;
EXECUTE stmtGM_acegikmo;

PREPARE stmtGM_lmno FROM @sGM_lmno;
EXECUTE stmtGM_lmno;

PREPARE stmtGM_jkno FROM @sGM_jkno;
EXECUTE stmtGM_jkno;

PREPARE stmtGM_ikmo FROM @sGM_ikmo;
EXECUTE stmtGM_ikmo;

PREPARE stmtGM_fgno FROM @sGM_fgno;
EXECUTE stmtGM_fgno;

PREPARE stmtGM_egmo FROM @sGM_egmo;
EXECUTE stmtGM_egmo;

PREPARE stmtGM_cgko FROM @sGM_cgko;
EXECUTE stmtGM_cgko;

PREPARE stmtGM_no FROM @sGM_no;
EXECUTE stmtGM_no;

PREPARE stmtGM_mo FROM @sGM_mo;
EXECUTE stmtGM_mo;

PREPARE stmtGM_ko FROM @sGM_ko;
EXECUTE stmtGM_ko;

PREPARE stmtGM_go FROM @sGM_go;
EXECUTE stmtGM_go;

PREPARE stmtGM_o FROM @sGM_o;
EXECUTE stmtGM_o;

PREPARE stmtGM_n FROM @sGM_n;
EXECUTE stmtGM_n;

PREPARE stmtGM_m FROM @sGM_m;
EXECUTE stmtGM_m;

PREPARE stmtGM_k FROM @sGM_k;
EXECUTE stmtGM_k;

PREPARE stmtGM_g FROM @sGM_g;
EXECUTE stmtGM_g;

PREPARE stmtGM_lm FROM @sGM_lm;
EXECUTE stmtGM_lm;

PREPARE stmtGM_l FROM @sGM_l;
EXECUTE stmtGM_l;

PREPARE stmtGM_jk FROM @sGM_jk;
EXECUTE stmtGM_jk;

PREPARE stmtGM_j FROM @sGM_j;
EXECUTE stmtGM_j;

PREPARE stmtGM_ik FROM @sGM_ik;
EXECUTE stmtGM_ik;

PREPARE stmtGM_i FROM @sGM_i;
EXECUTE stmtGM_i;

PREPARE stmtGM_fg FROM @sGM_fg;
EXECUTE stmtGM_fg;

PREPARE stmtGM_f FROM @sGM_f;
EXECUTE stmtGM_f;

PREPARE stmtGM_eg FROM @sGM_eg;
EXECUTE stmtGM_eg;

PREPARE stmtGM_e FROM @sGM_e;
EXECUTE stmtGM_e;

PREPARE stmtGM_cg FROM @sGM_cg;
EXECUTE stmtGM_cg;

PREPARE stmtGM_c FROM @sGM_c;
EXECUTE stmtGM_c;


PREPARE stmtGM_cegikmo FROM @sGM_cegikmo;
EXECUTE stmtGM_cegikmo;

PREPARE stmtGM_cfgjkno FROM @sGM_cfgjkno;
EXECUTE stmtGM_cfgjkno;

PREPARE stmtGM_ijklmno FROM @sGM_ijklmno;
EXECUTE stmtGM_ijklmno;

PREPARE stmtGM_efglmno FROM @sGM_efglmno;
EXECUTE stmtGM_efglmno;


PREPARE stmtGM_a FROM @sGM_a;
EXECUTE stmtGM_a;

PREPARE stmtGM_b FROM @sGM_b;
EXECUTE stmtGM_b;

PREPARE stmtGM_d FROM @sGM_d;
EXECUTE stmtGM_d;

PREPARE stmtGM_h FROM @sGM_h;
EXECUTE stmtGM_h;

END//
DELIMITER ;

DELIMITER //
DROP PROCEDURE IF EXISTS `GB_4SET`//
CREATE PROCEDURE `GB_4SET` (IN s_id VARCHAR(64))
BEGIN

SET @plist1 = CONCAT('protlist1_',s_id);
SET @plist2 = CONCAT('protlist2_',s_id);
SET @plist3 = CONCAT('protlist3_',s_id);
SET @plist4 = CONCAT('protlist4_',s_id);

SET @GB_hijklmno = CONCAT('GB_hijklmno_',s_id);
SET @GB_defglmno = CONCAT('GB_defglmno_',s_id);
SET @GB_bcfgjkno = CONCAT('GB_bcfgjkno_',s_id);
SET @GB_acegikmo = CONCAT('GB_acegikmo_',s_id);

SET @GB_lmno = CONCAT('GB_lmno_',s_id);
SET @GB_jkno = CONCAT('GB_jkno_',s_id);
SET @GB_ikmo = CONCAT('GB_ikmo_',s_id);
SET @GB_fgno = CONCAT('GB_fgno_',s_id);
SET @GB_egmo = CONCAT('GB_egmo_',s_id);
SET @GB_cgko = CONCAT('GB_cgko_',s_id);

SET @GB_no = CONCAT('GB_no_',s_id);
SET @GB_mo = CONCAT('GB_mo_',s_id);
SET @GB_ko = CONCAT('GB_ko_',s_id);
SET @GB_go = CONCAT('GB_go_',s_id);

SET @GB_o = CONCAT('GB_o_',s_id);
SET @GB_n = CONCAT('GB_n_',s_id);
SET @GB_m = CONCAT('GB_m_',s_id);
SET @GB_k = CONCAT('GB_k_',s_id);
SET @GB_g = CONCAT('GB_g_',s_id);

SET @GB_l = CONCAT('GB_l_',s_ID);
SET @GB_j = CONCAT('GB_j_',s_ID);
SET @GB_i = CONCAT('GB_i_',s_ID);
SET @GB_f = CONCAT('GB_f_',s_ID);
SET @GB_e = CONCAT('GB_e_',s_ID);
SET @GB_c = CONCAT('GB_c_',s_ID);


SET @GB_lm = CONCAT('GB_lm_',s_ID);
SET @GB_jk = CONCAT('GB_jk_',s_ID);
SET @GB_ik = CONCAT('GB_ik_',s_ID);
SET @GB_fg = CONCAT('GB_fg_',s_ID);
SET @GB_eg = CONCAT('GB_eg_',s_ID);
SET @GB_cg = CONCAT('GB_cg_',s_ID);

SET @GB_cegikmo = CONCAT('GB_cegikmo_',s_ID);
SET @GB_cfgjkno = CONCAT('GB_cfgjkno_',s_ID);
SET @GB_efglmno = CONCAT('GB_efglmno_',s_ID);
SET @GB_ijklmno = CONCAT('GB_ijklmno_',s_ID);

SET @GB_a = CONCAT('GB_a_',s_ID);
SET @GB_b = CONCAT('GB_b_',s_ID);
SET @GB_d = CONCAT('GB_d_',s_ID);
SET @GB_h = CONCAT('GB_h_',s_ID);

SET @sGB_hijklmno = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@GB_hijklmno,' (PRIMARY KEY my_pkey (ONTOLOGY)) select DISTINCT ONTOLOGY from PROTEIN_ONTOLOGY, GO_TERMS where PROTEIN_ONTOLOGY.ONTOLOGY=GO_TERMS.TERM_ID AND GO_TERMS.NAMESPACE=0 AND ACCESSION IN (select ACCESSION from ',@plist1,');');
SET @sGB_defglmno = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@GB_defglmno,' (PRIMARY KEY my_pkey (ONTOLOGY)) select DISTINCT ONTOLOGY from PROTEIN_ONTOLOGY, GO_TERMS where PROTEIN_ONTOLOGY.ONTOLOGY=GO_TERMS.TERM_ID AND GO_TERMS.NAMESPACE=0 AND ACCESSION IN (select ACCESSION from ',@plist2,');');
SET @sGB_bcfgjkno = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@GB_bcfgjkno,' (PRIMARY KEY my_pkey (ONTOLOGY)) select DISTINCT ONTOLOGY from PROTEIN_ONTOLOGY, GO_TERMS where PROTEIN_ONTOLOGY.ONTOLOGY=GO_TERMS.TERM_ID AND GO_TERMS.NAMESPACE=0 AND ACCESSION IN (select ACCESSION from ',@plist3,');');
SET @sGB_acegikmo = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@GB_acegikmo,' (PRIMARY KEY my_pkey (ONTOLOGY)) select DISTINCT ONTOLOGY from PROTEIN_ONTOLOGY, GO_TERMS where PROTEIN_ONTOLOGY.ONTOLOGY=GO_TERMS.TERM_ID AND GO_TERMS.NAMESPACE=0 AND ACCESSION IN (select ACCESSION from ',@plist4,');');


SET @sGB_lmno = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@GB_lmno,' (PRIMARY KEY my_pkey (ONTOLOGY)) select ',@GB_hijklmno,'.ONTOLOGY from ',@GB_hijklmno,' join ',@GB_defglmno,' on ',@GB_hijklmno,'.ONTOLOGY=',@GB_defglmno,'.ONTOLOGY;');
SET @sGB_jkno = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@GB_jkno,' (PRIMARY KEY my_pkey (ONTOLOGY)) select ',@GB_hijklmno,'.ONTOLOGY from ',@GB_hijklmno,' join ',@GB_bcfgjkno,' on ',@GB_hijklmno,'.ONTOLOGY=',@GB_bcfgjkno,'.ONTOLOGY;');
SET @sGB_ikmo = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@GB_ikmo,' (PRIMARY KEY my_pkey (ONTOLOGY)) select ',@GB_hijklmno,'.ONTOLOGY from ',@GB_hijklmno,' join ',@GB_acegikmo,' on ',@GB_hijklmno,'.ONTOLOGY=',@GB_acegikmo,'.ONTOLOGY;');
SET @sGB_fgno = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@GB_fgno,' (PRIMARY KEY my_pkey (ONTOLOGY)) select ',@GB_defglmno,'.ONTOLOGY from ',@GB_defglmno,' join ',@GB_bcfgjkno,' on ',@GB_defglmno,'.ONTOLOGY=',@GB_bcfgjkno,'.ONTOLOGY;');
SET @sGB_egmo = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@GB_egmo,' (PRIMARY KEY my_pkey (ONTOLOGY)) select ',@GB_defglmno,'.ONTOLOGY from ',@GB_defglmno,' join ',@GB_acegikmo,' on ',@GB_defglmno,'.ONTOLOGY=',@GB_acegikmo,'.ONTOLOGY;');
SET @sGB_cgko = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@GB_cgko,' (PRIMARY KEY my_pkey (ONTOLOGY)) select ',@GB_bcfgjkno,'.ONTOLOGY from ',@GB_bcfgjkno,' join ',@GB_acegikmo,' on ',@GB_bcfgjkno,'.ONTOLOGY=',@GB_acegikmo,'.ONTOLOGY;');

SET @sGB_no = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@GB_no,' (PRIMARY KEY my_pkey (ONTOLOGY)) select ',@GB_hijklmno,'.ONTOLOGY from ',@GB_hijklmno,' join ',@GB_fgno,' on ',@GB_hijklmno,'.ONTOLOGY=',@GB_fgno,'.ONTOLOGY;');
SET @sGB_mo = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@GB_mo,' (PRIMARY KEY my_pkey (ONTOLOGY)) select ',@GB_hijklmno,'.ONTOLOGY from ',@GB_hijklmno,' join ',@GB_egmo,' on ',@GB_hijklmno,'.ONTOLOGY=',@GB_egmo,'.ONTOLOGY;');
SET @sGB_ko = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@GB_ko,' (PRIMARY KEY my_pkey (ONTOLOGY)) select ',@GB_hijklmno,'.ONTOLOGY from ',@GB_hijklmno,' join ',@GB_cgko,' on ',@GB_hijklmno,'.ONTOLOGY=',@GB_cgko,'.ONTOLOGY;');
SET @sGB_go = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@GB_go,' (PRIMARY KEY my_pkey (ONTOLOGY)) select ',@GB_defglmno,'.ONTOLOGY from ',@GB_defglmno,' join ',@GB_cgko,' on ',@GB_defglmno,'.ONTOLOGY=',@GB_cgko,'.ONTOLOGY;');

SET @sGB_o = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@GB_o,' (PRIMARY KEY my_pkey (ONTOLOGY)) select ',@GB_hijklmno,'.ONTOLOGY from ',@GB_hijklmno,' join ',@GB_go,' on ',@GB_hijklmno,'.ONTOLOGY=',@GB_go,'.ONTOLOGY;');


SET @sGB_n = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@GB_n,' (PRIMARY KEY my_pkey (ONTOLOGY)) select ',@GB_no,'.ONTOLOGY from ',@GB_no,' left outer join ',@GB_o,' on ',@GB_no,'.ONTOLOGY=',@GB_o,'.ONTOLOGY where ',@GB_o,'.ONTOLOGY is null;');
SET @sGB_m = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@GB_m,' (PRIMARY KEY my_pkey (ONTOLOGY)) select ',@GB_mo,'.ONTOLOGY from ',@GB_mo,' left outer join ',@GB_o,' on ',@GB_mo,'.ONTOLOGY=',@GB_o,'.ONTOLOGY where ',@GB_o,'.ONTOLOGY is null;');
SET @sGB_k = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@GB_k,' (PRIMARY KEY my_pkey (ONTOLOGY)) select ',@GB_ko,'.ONTOLOGY from ',@GB_ko,' left outer join ',@GB_o,' on ',@GB_ko,'.ONTOLOGY=',@GB_o,'.ONTOLOGY where ',@GB_o,'.ONTOLOGY is null;');
SET @sGB_g = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@GB_g,' (PRIMARY KEY my_pkey (ONTOLOGY)) select ',@GB_go,'.ONTOLOGY from ',@GB_go,' left outer join ',@GB_o,' on ',@GB_go,'.ONTOLOGY=',@GB_o,'.ONTOLOGY where ',@GB_o,'.ONTOLOGY is null;');

SET @sGB_lm = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@GB_lm,' (PRIMARY KEY my_pkey (ONTOLOGY)) select ',@GB_lmno,'.ONTOLOGY from ',@GB_lmno,' left outer join ',@GB_no,' on ',@GB_lmno,'.ONTOLOGY=',@GB_no,'.ONTOLOGY where ',@GB_no,'.ONTOLOGY is null;');
SET @sGB_jk = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@GB_jk,' (PRIMARY KEY my_pkey (ONTOLOGY)) select ',@GB_jkno,'.ONTOLOGY from ',@GB_jkno,' left outer join ',@GB_no,' on ',@GB_jkno,'.ONTOLOGY=',@GB_no,'.ONTOLOGY where ',@GB_no,'.ONTOLOGY is null;');
SET @sGB_ik = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@GB_ik,' (PRIMARY KEY my_pkey (ONTOLOGY)) select ',@GB_ikmo,'.ONTOLOGY from ',@GB_ikmo,' left outer join ',@GB_mo,' on ',@GB_ikmo,'.ONTOLOGY=',@GB_mo,'.ONTOLOGY where ',@GB_mo,'.ONTOLOGY is null;');
SET @sGB_fg = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@GB_fg,' (PRIMARY KEY my_pkey (ONTOLOGY)) select ',@GB_fgno,'.ONTOLOGY from ',@GB_fgno,' left outer join ',@GB_no,' on ',@GB_fgno,'.ONTOLOGY=',@GB_no,'.ONTOLOGY where ',@GB_no,'.ONTOLOGY is null;');
SET @sGB_eg = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@GB_eg,' (PRIMARY KEY my_pkey (ONTOLOGY)) select ',@GB_egmo,'.ONTOLOGY from ',@GB_egmo,' left outer join ',@GB_mo,' on ',@GB_egmo,'.ONTOLOGY=',@GB_mo,'.ONTOLOGY where ',@GB_mo,'.ONTOLOGY is null;');
SET @sGB_cg = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@GB_cg,' (PRIMARY KEY my_pkey (ONTOLOGY)) select ',@GB_cgko,'.ONTOLOGY from ',@GB_cgko,' left outer join ',@GB_ko,' on ',@GB_cgko,'.ONTOLOGY=',@GB_ko,'.ONTOLOGY where ',@GB_ko,'.ONTOLOGY is null;');


SET @sGB_l = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@GB_l,' (PRIMARY KEY my_pkey (ONTOLOGY)) select ',@GB_lm,'.ONTOLOGY from ',@GB_lm,' left outer join ',@GB_m,' on ',@GB_lm,'.ONTOLOGY=',@GB_m,'.ONTOLOGY where ',@GB_m,'.ONTOLOGY is null;');
SET @sGB_j = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@GB_j,' (PRIMARY KEY my_pkey (ONTOLOGY)) select ',@GB_jk,'.ONTOLOGY from ',@GB_jk,' left outer join ',@GB_k,' on ',@GB_jk,'.ONTOLOGY=',@GB_k,'.ONTOLOGY where ',@GB_k,'.ONTOLOGY is null;');
SET @sGB_i = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@GB_i,' (PRIMARY KEY my_pkey (ONTOLOGY)) select ',@GB_ik,'.ONTOLOGY from ',@GB_ik,' left outer join ',@GB_k,' on ',@GB_ik,'.ONTOLOGY=',@GB_k,'.ONTOLOGY where ',@GB_k,'.ONTOLOGY is null;');
SET @sGB_f = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@GB_f,' (PRIMARY KEY my_pkey (ONTOLOGY)) select ',@GB_fg,'.ONTOLOGY from ',@GB_fg,' left outer join ',@GB_g,' on ',@GB_fg,'.ONTOLOGY=',@GB_g,'.ONTOLOGY where ',@GB_g,'.ONTOLOGY is null;');
SET @sGB_e = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@GB_e,' (PRIMARY KEY my_pkey (ONTOLOGY)) select ',@GB_eg,'.ONTOLOGY from ',@GB_eg,' left outer join ',@GB_g,' on ',@GB_eg,'.ONTOLOGY=',@GB_g,'.ONTOLOGY where ',@GB_g,'.ONTOLOGY is null;');
SET @sGB_c = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@GB_c,' (PRIMARY KEY my_pkey (ONTOLOGY)) select ',@GB_cg,'.ONTOLOGY from ',@GB_cg,' left outer join ',@GB_g,' on ',@GB_cg,'.ONTOLOGY=',@GB_g,'.ONTOLOGY where ',@GB_g,'.ONTOLOGY is null;');


SET @sGB_cegikmo = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@GB_cegikmo,' (PRIMARY KEY my_pkey (ONTOLOGY)) select ',@GB_egmo,'.ONTOLOGY from ',@GB_egmo,', ',@GB_ik,', ',@GB_c,' where ',@GB_egmo,'.ONTOLOGY=',@GB_ik,'.ONTOLOGY and ',@GB_ik,'.ONTOLOGY=',@GB_c,'.ONTOLOGY;');
SET @sGB_cfgjkno = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@GB_cfgjkno,' (PRIMARY KEY my_pkey (ONTOLOGY)) select ',@GB_fgno,'.ONTOLOGY from ',@GB_fgno,', ',@GB_jk,', ',@GB_c,' where ',@GB_fgno,'.ONTOLOGY=',@GB_jk,'.ONTOLOGY and ',@GB_jk,'.ONTOLOGY=',@GB_c,'.ONTOLOGY;');
SET @sGB_ijklmno = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@GB_ijklmno,' (PRIMARY KEY my_pkey (ONTOLOGY)) select ',@GB_lmno,'.ONTOLOGY from ',@GB_lmno,', ',@GB_jk,', ',@GB_i,' where ',@GB_lmno,'.ONTOLOGY=',@GB_jk,'.ONTOLOGY and ',@GB_jk,'.ONTOLOGY=',@GB_i,'.ONTOLOGY;');
SET @sGB_efglmno = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@GB_efglmno,' (PRIMARY KEY my_pkey (ONTOLOGY)) select ',@GB_lmno,'.ONTOLOGY from ',@GB_lmno,', ',@GB_fg,', ',@GB_e,' where ',@GB_lmno,'.ONTOLOGY=',@GB_fg,'.ONTOLOGY and ',@GB_fg,'.ONTOLOGY=',@GB_e,'.ONTOLOGY;');


SET @sGB_a = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@GB_a,' (PRIMARY KEY my_pkey (ONTOLOGY)) select ',@GB_acegikmo,'.ONTOLOGY from ',@GB_acegikmo,' left outer join ',@GB_cegikmo,' on ',@GB_acegikmo,'.ONTOLOGY=',@GB_cegikmo,'.ONTOLOGY where ',@GB_cegikmo,'.ONTOLOGY is null;');
SET @sGB_b = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@GB_b,' (PRIMARY KEY my_pkey (ONTOLOGY)) select ',@GB_bcfgjkno,'.ONTOLOGY from ',@GB_bcfgjkno,' left outer join ',@GB_cfgjkno,' on ',@GB_bcfgjkno,'.ONTOLOGY=',@GB_cfgjkno,'.ONTOLOGY where ',@GB_cfgjkno,'.ONTOLOGY is null;');
SET @sGB_d = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@GB_d,' (PRIMARY KEY my_pkey (ONTOLOGY)) select ',@GB_defglmno,'.ONTOLOGY from ',@GB_defglmno,' left outer join ',@GB_efglmno,' on ',@GB_defglmno,'.ONTOLOGY=',@GB_efglmno,'.ONTOLOGY where ',@GB_efglmno,'.ONTOLOGY is null;');
SET @sGB_h = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@GB_h,' (PRIMARY KEY my_pkey (ONTOLOGY)) select ',@GB_hijklmno,'.ONTOLOGY from ',@GB_hijklmno,' left outer join ',@GB_ijklmno,' on ',@GB_hijklmno,'.ONTOLOGY=',@GB_ijklmno,'.ONTOLOGY where ',@GB_ijklmno,'.ONTOLOGY is null;');


PREPARE stmtGB_hijklmno FROM @sGB_hijklmno;
EXECUTE stmtGB_hijklmno;

PREPARE stmtGB_defglmno FROM @sGB_defglmno;
EXECUTE stmtGB_defglmno;

PREPARE stmtGB_bcfgjkno FROM @sGB_bcfgjkno;
EXECUTE stmtGB_bcfgjkno;

PREPARE stmtGB_acegikmo FROM @sGB_acegikmo;
EXECUTE stmtGB_acegikmo;

PREPARE stmtGB_lmno FROM @sGB_lmno;
EXECUTE stmtGB_lmno;

PREPARE stmtGB_jkno FROM @sGB_jkno;
EXECUTE stmtGB_jkno;

PREPARE stmtGB_ikmo FROM @sGB_ikmo;
EXECUTE stmtGB_ikmo;

PREPARE stmtGB_fgno FROM @sGB_fgno;
EXECUTE stmtGB_fgno;

PREPARE stmtGB_egmo FROM @sGB_egmo;
EXECUTE stmtGB_egmo;

PREPARE stmtGB_cgko FROM @sGB_cgko;
EXECUTE stmtGB_cgko;

PREPARE stmtGB_no FROM @sGB_no;
EXECUTE stmtGB_no;

PREPARE stmtGB_mo FROM @sGB_mo;
EXECUTE stmtGB_mo;

PREPARE stmtGB_ko FROM @sGB_ko;
EXECUTE stmtGB_ko;

PREPARE stmtGB_go FROM @sGB_go;
EXECUTE stmtGB_go;

PREPARE stmtGB_o FROM @sGB_o;
EXECUTE stmtGB_o;

PREPARE stmtGB_n FROM @sGB_n;
EXECUTE stmtGB_n;

PREPARE stmtGB_m FROM @sGB_m;
EXECUTE stmtGB_m;

PREPARE stmtGB_k FROM @sGB_k;
EXECUTE stmtGB_k;

PREPARE stmtGB_g FROM @sGB_g;
EXECUTE stmtGB_g;

PREPARE stmtGB_lm FROM @sGB_lm;
EXECUTE stmtGB_lm;

PREPARE stmtGB_l FROM @sGB_l;
EXECUTE stmtGB_l;

PREPARE stmtGB_jk FROM @sGB_jk;
EXECUTE stmtGB_jk;

PREPARE stmtGB_j FROM @sGB_j;
EXECUTE stmtGB_j;

PREPARE stmtGB_ik FROM @sGB_ik;
EXECUTE stmtGB_ik;

PREPARE stmtGB_i FROM @sGB_i;
EXECUTE stmtGB_i;

PREPARE stmtGB_fg FROM @sGB_fg;
EXECUTE stmtGB_fg;

PREPARE stmtGB_f FROM @sGB_f;
EXECUTE stmtGB_f;

PREPARE stmtGB_eg FROM @sGB_eg;
EXECUTE stmtGB_eg;

PREPARE stmtGB_e FROM @sGB_e;
EXECUTE stmtGB_e;

PREPARE stmtGB_cg FROM @sGB_cg;
EXECUTE stmtGB_cg;

PREPARE stmtGB_c FROM @sGB_c;
EXECUTE stmtGB_c;


PREPARE stmtGB_cegikmo FROM @sGB_cegikmo;
EXECUTE stmtGB_cegikmo;

PREPARE stmtGB_cfgjkno FROM @sGB_cfgjkno;
EXECUTE stmtGB_cfgjkno;

PREPARE stmtGB_efglmno FROM @sGB_efglmno;
EXECUTE stmtGB_efglmno;

PREPARE stmtGB_ijklmno FROM @sGB_ijklmno;
EXECUTE stmtGB_ijklmno;


PREPARE stmtGB_a FROM @sGB_a;
EXECUTE stmtGB_a;

PREPARE stmtGB_b FROM @sGB_b;
EXECUTE stmtGB_b;

PREPARE stmtGB_d FROM @sGB_d;
EXECUTE stmtGB_d;

PREPARE stmtGB_h FROM @sGB_h;
EXECUTE stmtGB_h;


END//
DELIMITER ;


DELIMITER //
DROP PROCEDURE IF EXISTS `PW_4SET`//
CREATE PROCEDURE `PW_4SET` (IN s_id VARCHAR(64))
BEGIN

SET @plist1 = CONCAT('protlist1_',s_id);
SET @plist2 = CONCAT('protlist2_',s_id);
SET @plist3 = CONCAT('protlist3_',s_id);
SET @plist4 = CONCAT('protlist4_',s_id);

SET @PW_hijklmno = CONCAT('PW_hijklmno_',s_id);
SET @PW_defglmno = CONCAT('PW_defglmno_',s_id);
SET @PW_bcfgjkno = CONCAT('PW_bcfgjkno_',s_id);
SET @PW_acegikmo = CONCAT('PW_acegikmo_',s_id);

SET @PW_lmno = CONCAT('PW_lmno_',s_id);
SET @PW_jkno = CONCAT('PW_jkno_',s_id);
SET @PW_ikmo = CONCAT('PW_ikmo_',s_id);
SET @PW_fgno = CONCAT('PW_fgno_',s_id);
SET @PW_egmo = CONCAT('PW_egmo_',s_id);
SET @PW_cgko = CONCAT('PW_cgko_',s_id);

SET @PW_no = CONCAT('PW_no_',s_id);
SET @PW_mo = CONCAT('PW_mo_',s_id);
SET @PW_ko = CONCAT('PW_ko_',s_id);
SET @PW_go = CONCAT('PW_go_',s_id);

SET @PW_o = CONCAT('PW_o_',s_id);
SET @PW_n = CONCAT('PW_n_',s_id);
SET @PW_m = CONCAT('PW_m_',s_id);
SET @PW_k = CONCAT('PW_k_',s_id);
SET @PW_g = CONCAT('PW_g_',s_id);

SET @PW_l = CONCAT('PW_l_',s_ID);
SET @PW_j = CONCAT('PW_j_',s_ID);
SET @PW_i = CONCAT('PW_i_',s_ID);
SET @PW_f = CONCAT('PW_f_',s_ID);
SET @PW_e = CONCAT('PW_e_',s_ID);
SET @PW_c = CONCAT('PW_c_',s_ID);


SET @PW_lm = CONCAT('PW_lm_',s_ID);
SET @PW_jk = CONCAT('PW_jk_',s_ID);
SET @PW_ik = CONCAT('PW_ik_',s_ID);
SET @PW_fg = CONCAT('PW_fg_',s_ID);
SET @PW_eg = CONCAT('PW_eg_',s_ID);
SET @PW_cg = CONCAT('PW_cg_',s_ID);

SET @PW_cegikmo = CONCAT('PW_cegikmo_',s_ID);
SET @PW_cfgjkno = CONCAT('PW_cfgjkno_',s_ID);
SET @PW_efglmno = CONCAT('PW_efglmno_',s_ID);
SET @PW_ijklmno = CONCAT('PW_ijklmno_',s_ID);


SET @PW_a = CONCAT('PW_a_',s_ID);
SET @PW_b = CONCAT('PW_b_',s_ID);
SET @PW_d = CONCAT('PW_d_',s_ID);
SET @PW_h = CONCAT('PW_h_',s_ID);


SET @sPW_hijklmno = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@PW_hijklmno,' (PRIMARY KEY my_pkey (PATHWAY,SPEC)) select DISTINCT PATHWAY,SPEC from PROTEIN_PATHWAY, PATHWAY where PROTEIN_PATHWAY.PATHWAY=PATHWAY.ID AND PROTEIN_PATHWAY.SPEC=PATHWAY.SPECIES AND ACCESSION IN (select ACCESSION from ',@plist1,');');
SET @sPW_defglmno = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@PW_defglmno,' (PRIMARY KEY my_pkey (PATHWAY,SPEC)) select DISTINCT PATHWAY,SPEC from PROTEIN_PATHWAY, PATHWAY where PROTEIN_PATHWAY.PATHWAY=PATHWAY.ID AND PROTEIN_PATHWAY.SPEC=PATHWAY.SPECIES AND ACCESSION IN (select ACCESSION from ',@plist2,');');
SET @sPW_bcfgjkno = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@PW_bcfgjkno,' (PRIMARY KEY my_pkey (PATHWAY,SPEC)) select DISTINCT PATHWAY,SPEC from PROTEIN_PATHWAY, PATHWAY where PROTEIN_PATHWAY.PATHWAY=PATHWAY.ID AND PROTEIN_PATHWAY.SPEC=PATHWAY.SPECIES AND ACCESSION IN (select ACCESSION from ',@plist3,');');
SET @sPW_acegikmo = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@PW_acegikmo,' (PRIMARY KEY my_pkey (PATHWAY,SPEC)) select DISTINCT PATHWAY,SPEC from PROTEIN_PATHWAY, PATHWAY where PROTEIN_PATHWAY.PATHWAY=PATHWAY.ID AND PROTEIN_PATHWAY.SPEC=PATHWAY.SPECIES AND ACCESSION IN (select ACCESSION from ',@plist4,');');


SET @sPW_lmno = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@PW_lmno,' (PRIMARY KEY my_pkey (PATHWAY,SPEC)) select ',@PW_hijklmno,'.PATHWAY,',@PW_hijklmno,'.SPEC from ',@PW_hijklmno,' join ',@PW_defglmno,' on ',@PW_hijklmno,'.PATHWAY=',@PW_defglmno,'.PATHWAY  WHERE ',@PW_hijklmno,'.SPEC=',@PW_defglmno,'.SPEC;;');
SET @sPW_jkno = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@PW_jkno,' (PRIMARY KEY my_pkey (PATHWAY,SPEC)) select ',@PW_hijklmno,'.PATHWAY,',@PW_hijklmno,'.SPEC from ',@PW_hijklmno,' join ',@PW_bcfgjkno,' on ',@PW_hijklmno,'.PATHWAY=',@PW_bcfgjkno,'.PATHWAY  WHERE ',@PW_hijklmno,'.SPEC=',@PW_bcfgjkno,'.SPEC;;');
SET @sPW_ikmo = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@PW_ikmo,' (PRIMARY KEY my_pkey (PATHWAY,SPEC)) select ',@PW_hijklmno,'.PATHWAY,',@PW_hijklmno,'.SPEC from ',@PW_hijklmno,' join ',@PW_acegikmo,' on ',@PW_hijklmno,'.PATHWAY=',@PW_acegikmo,'.PATHWAY  WHERE ',@PW_hijklmno,'.SPEC=',@PW_acegikmo,'.SPEC;;');
SET @sPW_fgno = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@PW_fgno,' (PRIMARY KEY my_pkey (PATHWAY,SPEC)) select ',@PW_defglmno,'.PATHWAY,',@PW_defglmno,'.SPEC from ',@PW_defglmno,' join ',@PW_bcfgjkno,' on ',@PW_defglmno,'.PATHWAY=',@PW_bcfgjkno,'.PATHWAY  WHERE ',@PW_defglmno,'.SPEC=',@PW_bcfgjkno,'.SPEC;;');
SET @sPW_egmo = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@PW_egmo,' (PRIMARY KEY my_pkey (PATHWAY,SPEC)) select ',@PW_defglmno,'.PATHWAY,',@PW_defglmno,'.SPEC from ',@PW_defglmno,' join ',@PW_acegikmo,' on ',@PW_defglmno,'.PATHWAY=',@PW_acegikmo,'.PATHWAY  WHERE ',@PW_defglmno,'.SPEC=',@PW_acegikmo,'.SPEC;;');
SET @sPW_cgko = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@PW_cgko,' (PRIMARY KEY my_pkey (PATHWAY,SPEC)) select ',@PW_bcfgjkno,'.PATHWAY,',@PW_bcfgjkno,'.SPEC from ',@PW_bcfgjkno,' join ',@PW_acegikmo,' on ',@PW_bcfgjkno,'.PATHWAY=',@PW_acegikmo,'.PATHWAY  WHERE ',@PW_bcfgjkno,'.SPEC=',@PW_acegikmo,'.SPEC;;');

SET @sPW_no = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@PW_no,' (PRIMARY KEY my_pkey (PATHWAY,SPEC)) select ',@PW_hijklmno,'.PATHWAY,',@PW_hijklmno,'.SPEC from ',@PW_hijklmno,' join ',@PW_fgno,' on ',@PW_hijklmno,'.PATHWAY=',@PW_fgno,'.PATHWAY  WHERE ',@PW_hijklmno,'.SPEC=',@PW_fgno,'.SPEC;;');
SET @sPW_mo = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@PW_mo,' (PRIMARY KEY my_pkey (PATHWAY,SPEC)) select ',@PW_hijklmno,'.PATHWAY,',@PW_hijklmno,'.SPEC from ',@PW_hijklmno,' join ',@PW_egmo,' on ',@PW_hijklmno,'.PATHWAY=',@PW_egmo,'.PATHWAY  WHERE ',@PW_hijklmno,'.SPEC=',@PW_egmo,'.SPEC;;');
SET @sPW_ko = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@PW_ko,' (PRIMARY KEY my_pkey (PATHWAY,SPEC)) select ',@PW_hijklmno,'.PATHWAY,',@PW_hijklmno,'.SPEC from ',@PW_hijklmno,' join ',@PW_cgko,' on ',@PW_hijklmno,'.PATHWAY=',@PW_cgko,'.PATHWAY  WHERE ',@PW_hijklmno,'.SPEC=',@PW_cgko,'.SPEC;;');
SET @sPW_go = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@PW_go,' (PRIMARY KEY my_pkey (PATHWAY,SPEC)) select ',@PW_defglmno,'.PATHWAY,',@PW_defglmno,'.SPEC from ',@PW_defglmno,' join ',@PW_cgko,' on ',@PW_defglmno,'.PATHWAY=',@PW_cgko,'.PATHWAY  WHERE ',@PW_defglmno,'.SPEC=',@PW_cgko,'.SPEC;;');

SET @sPW_o = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@PW_o,' (PRIMARY KEY my_pkey (PATHWAY,SPEC)) select ',@PW_hijklmno,'.PATHWAY,',@PW_hijklmno,'.SPEC from ',@PW_hijklmno,' join ',@PW_go,' on ',@PW_hijklmno,'.PATHWAY=',@PW_go,'.PATHWAY  WHERE ',@PW_hijklmno,'.SPEC=',@PW_go,'.SPEC;;');


SET @sPW_n = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@PW_n,' (PRIMARY KEY my_pkey (PATHWAY,SPEC)) select ',@PW_no,'.PATHWAY,',@PW_no,'.SPEC from ',@PW_no,' left outer join ',@PW_o,' on ',@PW_no,'.PATHWAY=',@PW_o,'.PATHWAY AND ',@PW_no,'.SPEC=',@PW_o,'.SPEC  where ',@PW_o,'.PATHWAY is null;');
SET @sPW_m = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@PW_m,' (PRIMARY KEY my_pkey (PATHWAY,SPEC)) select ',@PW_mo,'.PATHWAY,',@PW_mo,'.SPEC from ',@PW_mo,' left outer join ',@PW_o,' on ',@PW_mo,'.PATHWAY=',@PW_o,'.PATHWAY AND ',@PW_mo,'.SPEC=',@PW_o,'.SPEC  where ',@PW_o,'.PATHWAY is null;');
SET @sPW_k = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@PW_k,' (PRIMARY KEY my_pkey (PATHWAY,SPEC)) select ',@PW_ko,'.PATHWAY,',@PW_ko,'.SPEC from ',@PW_ko,' left outer join ',@PW_o,' on ',@PW_ko,'.PATHWAY=',@PW_o,'.PATHWAY AND ',@PW_ko,'.SPEC=',@PW_o,'.SPEC where ',@PW_o,'.PATHWAY is null;');
SET @sPW_g = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@PW_g,' (PRIMARY KEY my_pkey (PATHWAY,SPEC)) select ',@PW_go,'.PATHWAY,',@PW_go,'.SPEC from ',@PW_go,' left outer join ',@PW_o,' on ',@PW_go,'.PATHWAY=',@PW_o,'.PATHWAY AND ',@PW_go,'.SPEC=',@PW_o,'.SPEC  where ',@PW_o,'.PATHWAY is null;');

SET @sPW_lm = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@PW_lm,' (PRIMARY KEY my_pkey (PATHWAY,SPEC)) select ',@PW_lmno,'.PATHWAY,',@PW_lmno,'.SPEC from ',@PW_lmno,' left outer join ',@PW_no,' on ',@PW_lmno,'.PATHWAY=',@PW_no,'.PATHWAY AND ',@PW_lmno,'.SPEC=',@PW_no,'.SPEC  where ',@PW_no,'.PATHWAY is null;');
SET @sPW_jk = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@PW_jk,' (PRIMARY KEY my_pkey (PATHWAY,SPEC)) select ',@PW_jkno,'.PATHWAY,',@PW_jkno,'.SPEC from ',@PW_jkno,' left outer join ',@PW_no,' on ',@PW_jkno,'.PATHWAY=',@PW_no,'.PATHWAY AND ',@PW_jkno,'.SPEC=',@PW_no,'.SPEC  where ',@PW_no,'.PATHWAY is null;');
SET @sPW_ik = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@PW_ik,' (PRIMARY KEY my_pkey (PATHWAY,SPEC)) select ',@PW_ikmo,'.PATHWAY,',@PW_ikmo,'.SPEC from ',@PW_ikmo,' left outer join ',@PW_mo,' on ',@PW_ikmo,'.PATHWAY=',@PW_mo,'.PATHWAY AND ',@PW_ikmo,'.SPEC=',@PW_mo,'.SPEC  where ',@PW_mo,'.PATHWAY is null;');
SET @sPW_fg = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@PW_fg,' (PRIMARY KEY my_pkey (PATHWAY,SPEC)) select ',@PW_fgno,'.PATHWAY,',@PW_fgno,'.SPEC from ',@PW_fgno,' left outer join ',@PW_no,' on ',@PW_fgno,'.PATHWAY=',@PW_no,'.PATHWAY AND ',@PW_fgno,'.SPEC=',@PW_no,'.SPEC  where ',@PW_no,'.PATHWAY is null;');
SET @sPW_eg = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@PW_eg,' (PRIMARY KEY my_pkey (PATHWAY,SPEC)) select ',@PW_egmo,'.PATHWAY,',@PW_egmo,'.SPEC from ',@PW_egmo,' left outer join ',@PW_mo,' on ',@PW_egmo,'.PATHWAY=',@PW_mo,'.PATHWAY AND ',@PW_egmo,'.SPEC=',@PW_mo,'.SPEC  where ',@PW_mo,'.PATHWAY is null;');
SET @sPW_cg = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@PW_cg,' (PRIMARY KEY my_pkey (PATHWAY,SPEC)) select ',@PW_cgko,'.PATHWAY,',@PW_cgko,'.SPEC from ',@PW_cgko,' left outer join ',@PW_ko,' on ',@PW_cgko,'.PATHWAY=',@PW_ko,'.PATHWAY AND ',@PW_cgko,'.SPEC=',@PW_ko,'.SPEC  where ',@PW_ko,'.PATHWAY is null;');


SET @sPW_l = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@PW_l,' (PRIMARY KEY my_pkey (PATHWAY,SPEC)) select ',@PW_lm,'.PATHWAY,',@PW_lm,'.SPEC from ',@PW_lm,' left outer join ',@PW_m,' on ',@PW_lm,'.PATHWAY=',@PW_m,'.PATHWAY AND ',@PW_lm,'.SPEC=',@PW_m,'.SPEC  where ',@PW_m,'.PATHWAY is null;');
SET @sPW_j = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@PW_j,' (PRIMARY KEY my_pkey (PATHWAY,SPEC)) select ',@PW_jk,'.PATHWAY,',@PW_jk,'.SPEC from ',@PW_jk,' left outer join ',@PW_k,' on ',@PW_jk,'.PATHWAY=',@PW_k,'.PATHWAY AND ',@PW_jk,'.SPEC=',@PW_k,'.SPEC  where ',@PW_k,'.PATHWAY is null;');
SET @sPW_i = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@PW_i,' (PRIMARY KEY my_pkey (PATHWAY,SPEC)) select ',@PW_ik,'.PATHWAY,',@PW_ik,'.SPEC from ',@PW_ik,' left outer join ',@PW_k,' on ',@PW_ik,'.PATHWAY=',@PW_k,'.PATHWAY AND ',@PW_ik,'.SPEC=',@PW_k,'.SPEC  where ',@PW_k,'.PATHWAY is null;');
SET @sPW_f = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@PW_f,' (PRIMARY KEY my_pkey (PATHWAY,SPEC)) select ',@PW_fg,'.PATHWAY,',@PW_fg,'.SPEC from ',@PW_fg,' left outer join ',@PW_g,' on ',@PW_fg,'.PATHWAY=',@PW_g,'.PATHWAY AND ',@PW_fg,'.SPEC=',@PW_g,'.SPEC  where ',@PW_g,'.PATHWAY is null;');
SET @sPW_e = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@PW_e,' (PRIMARY KEY my_pkey (PATHWAY,SPEC)) select ',@PW_eg,'.PATHWAY,',@PW_eg,'.SPEC from ',@PW_eg,' left outer join ',@PW_g,' on ',@PW_eg,'.PATHWAY=',@PW_g,'.PATHWAY AND ',@PW_eg,'.SPEC=',@PW_g,'.SPEC  where ',@PW_g,'.PATHWAY is null;');
SET @sPW_c = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@PW_c,' (PRIMARY KEY my_pkey (PATHWAY,SPEC)) select ',@PW_cg,'.PATHWAY,',@PW_cg,'.SPEC from ',@PW_cg,' left outer join ',@PW_g,' on ',@PW_cg,'.PATHWAY=',@PW_g,'.PATHWAY AND ',@PW_cg,'.SPEC=',@PW_g,'.SPEC  where ',@PW_g,'.PATHWAY is null;');



SET @sPW_cegikmo = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@PW_cegikmo,' (PRIMARY KEY my_pkey (PATHWAY,SPEC)) select ',@PW_egmo,'.PATHWAY,',@PW_egmo,'.SPEC from ',@PW_egmo,', ',@PW_ik,', ',@PW_c,' where ',@PW_egmo,'.PATHWAY=',@PW_ik,'.PATHWAY and ',@PW_ik,'.PATHWAY=',@PW_c,'.PATHWAY AND ',@PW_egmo,'.SPEC=',@PW_ik,'.SPEC  AND ',@PW_ik,'.SPEC=',@PW_c,'.SPEC ;');
SET @sPW_cfgjkno = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@PW_cfgjkno,' (PRIMARY KEY my_pkey (PATHWAY,SPEC)) select ',@PW_fgno,'.PATHWAY,',@PW_fgno,'.SPEC from ',@PW_fgno,', ',@PW_jk,', ',@PW_c,' where ',@PW_fgno,'.PATHWAY=',@PW_jk,'.PATHWAY and ',@PW_jk,'.PATHWAY=',@PW_c,'.PATHWAY AND ',@PW_fgno,'.SPEC=',@PW_jk,'.SPEC  AND ',@PW_jk,'.SPEC=',@PW_c,'.SPEC ;');
SET @sPW_ijklmno = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@PW_ijklmno,' (PRIMARY KEY my_pkey (PATHWAY,SPEC)) select ',@PW_lmno,'.PATHWAY,',@PW_lmno,'.SPEC from ',@PW_lmno,', ',@PW_jk,', ',@PW_i,' where ',@PW_lmno,'.PATHWAY=',@PW_jk,'.PATHWAY and ',@PW_jk,'.PATHWAY=',@PW_i,'.PATHWAY AND ',@PW_lmno,'.SPEC=',@PW_jk,'.SPEC  AND ',@PW_jk,'.SPEC=',@PW_i,'.SPEC ;');
SET @sPW_efglmno = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@PW_efglmno,' (PRIMARY KEY my_pkey (PATHWAY,SPEC)) select ',@PW_lmno,'.PATHWAY,',@PW_lmno,'.SPEC from ',@PW_lmno,', ',@PW_fg,', ',@PW_e,' where ',@PW_lmno,'.PATHWAY=',@PW_fg,'.PATHWAY and ',@PW_fg,'.PATHWAY=',@PW_e,'.PATHWAY AND ',@PW_lmno,'.SPEC=',@PW_fg,'.SPEC  AND ',@PW_fg,'.SPEC=',@PW_e,'.SPEC ;');


SET @sPW_a = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@PW_a,' (PRIMARY KEY my_pkey (PATHWAY,SPEC)) select ',@PW_acegikmo,'.PATHWAY,',@PW_acegikmo,'.SPEC from ',@PW_acegikmo,' left outer join ',@PW_cegikmo,' on ',@PW_acegikmo,'.PATHWAY=',@PW_cegikmo,'.PATHWAY AND ',@PW_acegikmo,'.SPEC=',@PW_cegikmo,'.SPEC  where ',@PW_cegikmo,'.PATHWAY is null;');
SET @sPW_b = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@PW_b,' (PRIMARY KEY my_pkey (PATHWAY,SPEC)) select ',@PW_bcfgjkno,'.PATHWAY,',@PW_bcfgjkno,'.SPEC from ',@PW_bcfgjkno,' left outer join ',@PW_cfgjkno,' on ',@PW_bcfgjkno,'.PATHWAY=',@PW_cfgjkno,'.PATHWAY AND ',@PW_bcfgjkno,'.SPEC=',@PW_cfgjkno,'.SPEC  where ',@PW_cfgjkno,'.PATHWAY is null;');
SET @sPW_d = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@PW_d,' (PRIMARY KEY my_pkey (PATHWAY,SPEC)) select ',@PW_defglmno,'.PATHWAY,',@PW_defglmno,'.SPEC from ',@PW_defglmno,' left outer join ',@PW_efglmno,' on ',@PW_defglmno,'.PATHWAY=',@PW_efglmno,'.PATHWAY AND ',@PW_defglmno,'.SPEC=',@PW_efglmno,'.SPEC  where ',@PW_efglmno,'.PATHWAY is null;');
SET @sPW_h = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@PW_h,' (PRIMARY KEY my_pkey (PATHWAY,SPEC)) select ',@PW_hijklmno,'.PATHWAY,',@PW_hijklmno,'.SPEC from ',@PW_hijklmno,' left outer join ',@PW_ijklmno,' on ',@PW_hijklmno,'.PATHWAY=',@PW_ijklmno,'.PATHWAY AND ',@PW_hijklmno,'.SPEC=',@PW_ijklmno,'.SPEC  where ',@PW_ijklmno,'.PATHWAY is null;');


PREPARE stmtPW_hijklmno FROM @sPW_hijklmno;
EXECUTE stmtPW_hijklmno;

PREPARE stmtPW_defglmno FROM @sPW_defglmno;
EXECUTE stmtPW_defglmno;

PREPARE stmtPW_bcfgjkno FROM @sPW_bcfgjkno;
EXECUTE stmtPW_bcfgjkno;

PREPARE stmtPW_acegikmo FROM @sPW_acegikmo;
EXECUTE stmtPW_acegikmo;

PREPARE stmtPW_lmno FROM @sPW_lmno;
EXECUTE stmtPW_lmno;

PREPARE stmtPW_jkno FROM @sPW_jkno;
EXECUTE stmtPW_jkno;

PREPARE stmtPW_ikmo FROM @sPW_ikmo;
EXECUTE stmtPW_ikmo;

PREPARE stmtPW_fgno FROM @sPW_fgno;
EXECUTE stmtPW_fgno;

PREPARE stmtPW_egmo FROM @sPW_egmo;
EXECUTE stmtPW_egmo;

PREPARE stmtPW_cgko FROM @sPW_cgko;
EXECUTE stmtPW_cgko;

PREPARE stmtPW_no FROM @sPW_no;
EXECUTE stmtPW_no;

PREPARE stmtPW_mo FROM @sPW_mo;
EXECUTE stmtPW_mo;

PREPARE stmtPW_ko FROM @sPW_ko;
EXECUTE stmtPW_ko;

PREPARE stmtPW_go FROM @sPW_go;
EXECUTE stmtPW_go;

PREPARE stmtPW_o FROM @sPW_o;
EXECUTE stmtPW_o;

PREPARE stmtPW_n FROM @sPW_n;
EXECUTE stmtPW_n;

PREPARE stmtPW_m FROM @sPW_m;
EXECUTE stmtPW_m;

PREPARE stmtPW_k FROM @sPW_k;
EXECUTE stmtPW_k;

PREPARE stmtPW_g FROM @sPW_g;
EXECUTE stmtPW_g;

PREPARE stmtPW_lm FROM @sPW_lm;
EXECUTE stmtPW_lm;

PREPARE stmtPW_l FROM @sPW_l;
EXECUTE stmtPW_l;

PREPARE stmtPW_jk FROM @sPW_jk;
EXECUTE stmtPW_jk;

PREPARE stmtPW_j FROM @sPW_j;
EXECUTE stmtPW_j;

PREPARE stmtPW_ik FROM @sPW_ik;
EXECUTE stmtPW_ik;

PREPARE stmtPW_i FROM @sPW_i;
EXECUTE stmtPW_i;

PREPARE stmtPW_fg FROM @sPW_fg;
EXECUTE stmtPW_fg;

PREPARE stmtPW_f FROM @sPW_f;
EXECUTE stmtPW_f;

PREPARE stmtPW_eg FROM @sPW_eg;
EXECUTE stmtPW_eg;

PREPARE stmtPW_e FROM @sPW_e;
EXECUTE stmtPW_e;

PREPARE stmtPW_cg FROM @sPW_cg;
EXECUTE stmtPW_cg;

PREPARE stmtPW_c FROM @sPW_c;
EXECUTE stmtPW_c;


PREPARE stmtPW_cegikmo FROM @sPW_cegikmo;
EXECUTE stmtPW_cegikmo;

PREPARE stmtPW_cfgjkno FROM @sPW_cfgjkno;
EXECUTE stmtPW_cfgjkno;

PREPARE stmtPW_efglmno FROM @sPW_efglmno;
EXECUTE stmtPW_efglmno;

PREPARE stmtPW_ijklmno FROM @sPW_ijklmno;
EXECUTE stmtPW_ijklmno;


PREPARE stmtPW_a FROM @sPW_a;
EXECUTE stmtPW_a;

PREPARE stmtPW_b FROM @sPW_b;
EXECUTE stmtPW_b;

PREPARE stmtPW_d FROM @sPW_d;
EXECUTE stmtPW_d;

PREPARE stmtPW_h FROM @sPW_h;
EXECUTE stmtPW_h;


END//
DELIMITER ;


DELIMITER //
DROP PROCEDURE IF EXISTS `DM_4SET`//
CREATE PROCEDURE `DM_4SET` (IN s_ID VARCHAR(64))
BEGIN

SET @plist1 = CONCAT('protlist1_',s_ID);
SET @plist2 = CONCAT('protlist2_',s_ID);
SET @plist3 = CONCAT('protlist3_',s_ID);
SET @plist4 = CONCAT('protlist4_',s_ID);

SET @DM_hijklmno = CONCAT('DM_hijklmno_',s_ID);
SET @DM_defglmno = CONCAT('DM_defglmno_',s_ID);
SET @DM_bcfgjkno = CONCAT('DM_bcfgjkno_',s_ID);
SET @DM_acegikmo = CONCAT('DM_acegikmo_',s_ID);

SET @DM_lmno = CONCAT('DM_lmno_',s_ID);
SET @DM_jkno = CONCAT('DM_jkno_',s_ID);
SET @DM_ikmo = CONCAT('DM_ikmo_',s_ID);
SET @DM_fgno = CONCAT('DM_fgno_',s_ID);
SET @DM_egmo = CONCAT('DM_egmo_',s_ID);
SET @DM_cgko = CONCAT('DM_cgko_',s_ID);

SET @DM_no = CONCAT('DM_no_',s_ID);
SET @DM_mo = CONCAT('DM_mo_',s_ID);
SET @DM_ko = CONCAT('DM_ko_',s_ID);
SET @DM_go = CONCAT('DM_go_',s_ID);

SET @DM_lm = CONCAT('DM_lm_',s_ID);
SET @DM_jk = CONCAT('DM_jk_',s_ID);
SET @DM_ik = CONCAT('DM_ik_',s_ID);
SET @DM_fg = CONCAT('DM_fg_',s_ID);
SET @DM_eg = CONCAT('DM_eg_',s_ID);
SET @DM_cg = CONCAT('DM_cg_',s_ID);


SET @DM_o = CONCAT('DM_o_',s_ID);
SET @DM_n = CONCAT('DM_n_',s_ID);
SET @DM_m = CONCAT('DM_m_',s_ID);
SET @DM_k = CONCAT('DM_k_',s_ID);
SET @DM_g = CONCAT('DM_g_',s_ID);

SET @DM_l = CONCAT('DM_l_',s_ID);
SET @DM_j = CONCAT('DM_j_',s_ID);
SET @DM_i = CONCAT('DM_i_',s_ID);
SET @DM_f = CONCAT('DM_f_',s_ID);
SET @DM_e = CONCAT('DM_e_',s_ID);
SET @DM_c = CONCAT('DM_c_',s_ID);


SET @DM_cegikmo = CONCAT('DM_cegikmo_',s_ID);
SET @DM_cfgjkno = CONCAT('DM_cfgjkno_',s_ID);
SET @DM_efglmno = CONCAT('DM_efglmno_',s_ID);
SET @DM_ijklmno = CONCAT('DM_ijklmno_',s_ID);


SET @DM_a = CONCAT('DM_a_',s_ID);
SET @DM_b = CONCAT('DM_b_',s_ID);
SET @DM_d = CONCAT('DM_d_',s_ID);
SET @DM_h = CONCAT('DM_h_',s_ID);

SET @sDM_hijklmno = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@DM_hijklmno,' (PRIMARY KEY my_pkey (DOMAIN)) select DISTINCT DOMAIN from PROTEIN_DOMAIN, DOMAIN where PROTEIN_DOMAIN.DOMAIN=DOMAIN.PFAM AND ACCESSION IN (select ACCESSION from ',@plist1,');');
SET @sDM_defglmno = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@DM_defglmno,' (PRIMARY KEY my_pkey (DOMAIN)) select DISTINCT DOMAIN from PROTEIN_DOMAIN, DOMAIN where PROTEIN_DOMAIN.DOMAIN=DOMAIN.PFAM AND ACCESSION IN (select ACCESSION from ',@plist2,');');
SET @sDM_bcfgjkno = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@DM_bcfgjkno,' (PRIMARY KEY my_pkey (DOMAIN)) select DISTINCT DOMAIN from PROTEIN_DOMAIN, DOMAIN where PROTEIN_DOMAIN.DOMAIN=DOMAIN.PFAM AND ACCESSION IN (select ACCESSION from ',@plist3,');');
SET @sDM_acegikmo = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@DM_acegikmo,' (PRIMARY KEY my_pkey (DOMAIN)) select DISTINCT DOMAIN from PROTEIN_DOMAIN, DOMAIN where PROTEIN_DOMAIN.DOMAIN=DOMAIN.PFAM AND ACCESSION IN (select ACCESSION from ',@plist4,');');


SET @sDM_lmno = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@DM_lmno,' (PRIMARY KEY my_pkey (DOMAIN)) select ',@DM_hijklmno,'.DOMAIN from ',@DM_hijklmno,' join ',@DM_defglmno,' on ',@DM_hijklmno,'.DOMAIN=',@DM_defglmno,'.DOMAIN;');
SET @sDM_jkno = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@DM_jkno,' (PRIMARY KEY my_pkey (DOMAIN)) select ',@DM_hijklmno,'.DOMAIN from ',@DM_hijklmno,' join ',@DM_bcfgjkno,' on ',@DM_hijklmno,'.DOMAIN=',@DM_bcfgjkno,'.DOMAIN;');
SET @sDM_ikmo = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@DM_ikmo,' (PRIMARY KEY my_pkey (DOMAIN)) select ',@DM_hijklmno,'.DOMAIN from ',@DM_hijklmno,' join ',@DM_acegikmo,' on ',@DM_hijklmno,'.DOMAIN=',@DM_acegikmo,'.DOMAIN;');
SET @sDM_fgno = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@DM_fgno,' (PRIMARY KEY my_pkey (DOMAIN)) select ',@DM_defglmno,'.DOMAIN from ',@DM_defglmno,' join ',@DM_bcfgjkno,' on ',@DM_defglmno,'.DOMAIN=',@DM_bcfgjkno,'.DOMAIN;');
SET @sDM_egmo = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@DM_egmo,' (PRIMARY KEY my_pkey (DOMAIN)) select ',@DM_defglmno,'.DOMAIN from ',@DM_defglmno,' join ',@DM_acegikmo,' on ',@DM_defglmno,'.DOMAIN=',@DM_acegikmo,'.DOMAIN;');
SET @sDM_cgko = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@DM_cgko,' (PRIMARY KEY my_pkey (DOMAIN)) select ',@DM_bcfgjkno,'.DOMAIN from ',@DM_bcfgjkno,' join ',@DM_acegikmo,' on ',@DM_bcfgjkno,'.DOMAIN=',@DM_acegikmo,'.DOMAIN;');

SET @sDM_no = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@DM_no,' (PRIMARY KEY my_pkey (DOMAIN)) select ',@DM_hijklmno,'.DOMAIN from ',@DM_hijklmno,' join ',@DM_fgno,' on ',@DM_hijklmno,'.DOMAIN=',@DM_fgno,'.DOMAIN;');
SET @sDM_mo = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@DM_mo,' (PRIMARY KEY my_pkey (DOMAIN)) select ',@DM_hijklmno,'.DOMAIN from ',@DM_hijklmno,' join ',@DM_egmo,' on ',@DM_hijklmno,'.DOMAIN=',@DM_egmo,'.DOMAIN;');
SET @sDM_ko = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@DM_ko,' (PRIMARY KEY my_pkey (DOMAIN)) select ',@DM_hijklmno,'.DOMAIN from ',@DM_hijklmno,' join ',@DM_cgko,' on ',@DM_hijklmno,'.DOMAIN=',@DM_cgko,'.DOMAIN;');
SET @sDM_go = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@DM_go,' (PRIMARY KEY my_pkey (DOMAIN)) select ',@DM_defglmno,'.DOMAIN from ',@DM_defglmno,' join ',@DM_cgko,' on ',@DM_defglmno,'.DOMAIN=',@DM_cgko,'.DOMAIN;');

SET @sDM_o = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@DM_o,' (PRIMARY KEY my_pkey (DOMAIN)) select ',@DM_hijklmno,'.DOMAIN from ',@DM_hijklmno,' join ',@DM_go,' on ',@DM_hijklmno,'.DOMAIN=',@DM_go,'.DOMAIN;');

SET @sDM_n = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@DM_n,' (PRIMARY KEY my_pkey (DOMAIN)) select ',@DM_no,'.DOMAIN from ',@DM_no,' left outer join ',@DM_o,' on ',@DM_no,'.DOMAIN=',@DM_o,'.DOMAIN where ',@DM_o,'.DOMAIN is null;');
SET @sDM_m = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@DM_m,' (PRIMARY KEY my_pkey (DOMAIN)) select ',@DM_mo,'.DOMAIN from ',@DM_mo,' left outer join ',@DM_o,' on ',@DM_mo,'.DOMAIN=',@DM_o,'.DOMAIN where ',@DM_o,'.DOMAIN is null;');
SET @sDM_k = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@DM_k,' (PRIMARY KEY my_pkey (DOMAIN)) select ',@DM_ko,'.DOMAIN from ',@DM_ko,' left outer join ',@DM_o,' on ',@DM_ko,'.DOMAIN=',@DM_o,'.DOMAIN where ',@DM_o,'.DOMAIN is null;');
SET @sDM_g = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@DM_g,' (PRIMARY KEY my_pkey (DOMAIN)) select ',@DM_go,'.DOMAIN from ',@DM_go,' left outer join ',@DM_o,' on ',@DM_go,'.DOMAIN=',@DM_o,'.DOMAIN where ',@DM_o,'.DOMAIN is null;');


SET @sDM_lm = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@DM_lm,' (PRIMARY KEY my_pkey (DOMAIN)) select ',@DM_lmno,'.DOMAIN from ',@DM_lmno,' left outer join ',@DM_no,' on ',@DM_lmno,'.DOMAIN=',@DM_no,'.DOMAIN where ',@DM_no,'.DOMAIN is null;');
SET @sDM_jk = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@DM_jk,' (PRIMARY KEY my_pkey (DOMAIN)) select ',@DM_jkno,'.DOMAIN from ',@DM_jkno,' left outer join ',@DM_no,' on ',@DM_jkno,'.DOMAIN=',@DM_no,'.DOMAIN where ',@DM_no,'.DOMAIN is null;');
SET @sDM_ik = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@DM_ik,' (PRIMARY KEY my_pkey (DOMAIN)) select ',@DM_ikmo,'.DOMAIN from ',@DM_ikmo,' left outer join ',@DM_mo,' on ',@DM_ikmo,'.DOMAIN=',@DM_mo,'.DOMAIN where ',@DM_mo,'.DOMAIN is null;');
SET @sDM_fg = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@DM_fg,' (PRIMARY KEY my_pkey (DOMAIN)) select ',@DM_fgno,'.DOMAIN from ',@DM_fgno,' left outer join ',@DM_no,' on ',@DM_fgno,'.DOMAIN=',@DM_no,'.DOMAIN where ',@DM_no,'.DOMAIN is null;');
SET @sDM_eg = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@DM_eg,' (PRIMARY KEY my_pkey (DOMAIN)) select ',@DM_egmo,'.DOMAIN from ',@DM_egmo,' left outer join ',@DM_mo,' on ',@DM_egmo,'.DOMAIN=',@DM_mo,'.DOMAIN where ',@DM_mo,'.DOMAIN is null;');
SET @sDM_cg = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@DM_cg,' (PRIMARY KEY my_pkey (DOMAIN)) select ',@DM_cgko,'.DOMAIN from ',@DM_cgko,' left outer join ',@DM_ko,' on ',@DM_cgko,'.DOMAIN=',@DM_ko,'.DOMAIN where ',@DM_ko,'.DOMAIN is null;');


SET @sDM_l = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@DM_l,' (PRIMARY KEY my_pkey (DOMAIN)) select ',@DM_lm,'.DOMAIN from ',@DM_lm,' left outer join ',@DM_m,' on ',@DM_lm,'.DOMAIN=',@DM_m,'.DOMAIN where ',@DM_m,'.DOMAIN is null;');
SET @sDM_j = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@DM_j,' (PRIMARY KEY my_pkey (DOMAIN)) select ',@DM_jk,'.DOMAIN from ',@DM_jk,' left outer join ',@DM_k,' on ',@DM_jk,'.DOMAIN=',@DM_k,'.DOMAIN where ',@DM_k,'.DOMAIN is null;');
SET @sDM_i = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@DM_i,' (PRIMARY KEY my_pkey (DOMAIN)) select ',@DM_ik,'.DOMAIN from ',@DM_ik,' left outer join ',@DM_k,' on ',@DM_ik,'.DOMAIN=',@DM_k,'.DOMAIN where ',@DM_k,'.DOMAIN is null;');
SET @sDM_f = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@DM_f,' (PRIMARY KEY my_pkey (DOMAIN)) select ',@DM_fg,'.DOMAIN from ',@DM_fg,' left outer join ',@DM_g,' on ',@DM_fg,'.DOMAIN=',@DM_g,'.DOMAIN where ',@DM_g,'.DOMAIN is null;');
SET @sDM_e = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@DM_e,' (PRIMARY KEY my_pkey (DOMAIN)) select ',@DM_eg,'.DOMAIN from ',@DM_eg,' left outer join ',@DM_g,' on ',@DM_eg,'.DOMAIN=',@DM_g,'.DOMAIN where ',@DM_g,'.DOMAIN is null;');
SET @sDM_c = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@DM_c,' (PRIMARY KEY my_pkey (DOMAIN)) select ',@DM_cg,'.DOMAIN from ',@DM_cg,' left outer join ',@DM_g,' on ',@DM_cg,'.DOMAIN=',@DM_g,'.DOMAIN where ',@DM_g,'.DOMAIN is null;');


SET @sDM_cegikmo = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@DM_cegikmo,' (PRIMARY KEY my_pkey (DOMAIN)) select ',@DM_egmo,'.DOMAIN from ',@DM_egmo,', ',@DM_ik,', ',@DM_c,' where ',@DM_egmo,'.DOMAIN=',@DM_ik,'.DOMAIN and ',@DM_ik,'.DOMAIN=',@DM_c,'.DOMAIN;');
SET @sDM_cfgjkno = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@DM_cfgjkno,' (PRIMARY KEY my_pkey (DOMAIN)) select ',@DM_fgno,'.DOMAIN from ',@DM_fgno,', ',@DM_jk,', ',@DM_c,' where ',@DM_fgno,'.DOMAIN=',@DM_jk,'.DOMAIN and ',@DM_jk,'.DOMAIN=',@DM_c,'.DOMAIN;');
SET @sDM_ijklmno = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@DM_ijklmno,' (PRIMARY KEY my_pkey (DOMAIN)) select ',@DM_lmno,'.DOMAIN from ',@DM_lmno,', ',@DM_jk,', ',@DM_i,' where ',@DM_lmno,'.DOMAIN=',@DM_jk,'.DOMAIN and ',@DM_jk,'.DOMAIN=',@DM_i,'.DOMAIN;');
SET @sDM_efglmno = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@DM_efglmno,' (PRIMARY KEY my_pkey (DOMAIN)) select ',@DM_lmno,'.DOMAIN from ',@DM_lmno,', ',@DM_fg,', ',@DM_e,' where ',@DM_lmno,'.DOMAIN=',@DM_fg,'.DOMAIN and ',@DM_fg,'.DOMAIN=',@DM_e,'.DOMAIN;');


SET @sDM_a = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@DM_a,' (PRIMARY KEY my_pkey (DOMAIN)) select ',@DM_acegikmo,'.DOMAIN from ',@DM_acegikmo,' left outer join ',@DM_cegikmo,' on ',@DM_acegikmo,'.DOMAIN=',@DM_cegikmo,'.DOMAIN where ',@DM_cegikmo,'.DOMAIN is null;');
SET @sDM_b = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@DM_b,' (PRIMARY KEY my_pkey (DOMAIN)) select ',@DM_bcfgjkno,'.DOMAIN from ',@DM_bcfgjkno,' left outer join ',@DM_cfgjkno,' on ',@DM_bcfgjkno,'.DOMAIN=',@DM_cfgjkno,'.DOMAIN where ',@DM_cfgjkno,'.DOMAIN is null;');
SET @sDM_d = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@DM_d,' (PRIMARY KEY my_pkey (DOMAIN)) select ',@DM_defglmno,'.DOMAIN from ',@DM_defglmno,' left outer join ',@DM_efglmno,' on ',@DM_defglmno,'.DOMAIN=',@DM_efglmno,'.DOMAIN where ',@DM_efglmno,'.DOMAIN is null;');
SET @sDM_h = CONCAT('CREATE TEMPORARY TABLE IF NOT EXISTS ',@DM_h,' (PRIMARY KEY my_pkey (DOMAIN)) select ',@DM_hijklmno,'.DOMAIN from ',@DM_hijklmno,' left outer join ',@DM_ijklmno,' on ',@DM_hijklmno,'.DOMAIN=',@DM_ijklmno,'.DOMAIN where ',@DM_ijklmno,'.DOMAIN is null;');



PREPARE stmtDM_hijklmno FROM @sDM_hijklmno;
EXECUTE stmtDM_hijklmno;

PREPARE stmtDM_defglmno FROM @sDM_defglmno;
EXECUTE stmtDM_defglmno;

PREPARE stmtDM_bcfgjkno FROM @sDM_bcfgjkno;
EXECUTE stmtDM_bcfgjkno;

PREPARE stmtDM_acegikmo FROM @sDM_acegikmo;
EXECUTE stmtDM_acegikmo;

PREPARE stmtDM_lmno FROM @sDM_lmno;
EXECUTE stmtDM_lmno;

PREPARE stmtDM_jkno FROM @sDM_jkno;
EXECUTE stmtDM_jkno;

PREPARE stmtDM_ikmo FROM @sDM_ikmo;
EXECUTE stmtDM_ikmo;

PREPARE stmtDM_fgno FROM @sDM_fgno;
EXECUTE stmtDM_fgno;

PREPARE stmtDM_egmo FROM @sDM_egmo;
EXECUTE stmtDM_egmo;

PREPARE stmtDM_cgko FROM @sDM_cgko;
EXECUTE stmtDM_cgko;

PREPARE stmtDM_no FROM @sDM_no;
EXECUTE stmtDM_no;

PREPARE stmtDM_mo FROM @sDM_mo;
EXECUTE stmtDM_mo;

PREPARE stmtDM_ko FROM @sDM_ko;
EXECUTE stmtDM_ko;

PREPARE stmtDM_go FROM @sDM_go;
EXECUTE stmtDM_go;


PREPARE stmtDM_o FROM @sDM_o;
EXECUTE stmtDM_o;

PREPARE stmtDM_n FROM @sDM_n;
EXECUTE stmtDM_n;

PREPARE stmtDM_m FROM @sDM_m;
EXECUTE stmtDM_m;

PREPARE stmtDM_k FROM @sDM_k;
EXECUTE stmtDM_k;

PREPARE stmtDM_g FROM @sDM_g;
EXECUTE stmtDM_g;



PREPARE stmtDM_lm FROM @sDM_lm;
EXECUTE stmtDM_lm;

PREPARE stmtDM_l FROM @sDM_l;
EXECUTE stmtDM_l;

PREPARE stmtDM_jk FROM @sDM_jk;
EXECUTE stmtDM_jk;

PREPARE stmtDM_j FROM @sDM_j;
EXECUTE stmtDM_j;

PREPARE stmtDM_ik FROM @sDM_ik;
EXECUTE stmtDM_ik;

PREPARE stmtDM_i FROM @sDM_i;
EXECUTE stmtDM_i;

PREPARE stmtDM_fg FROM @sDM_fg;
EXECUTE stmtDM_fg;

PREPARE stmtDM_f FROM @sDM_f;
EXECUTE stmtDM_f;

PREPARE stmtDM_eg FROM @sDM_eg;
EXECUTE stmtDM_eg;

PREPARE stmtDM_e FROM @sDM_e;
EXECUTE stmtDM_e;

PREPARE stmtDM_cg FROM @sDM_cg;
EXECUTE stmtDM_cg;

PREPARE stmtDM_c FROM @sDM_c;
EXECUTE stmtDM_c;

PREPARE stmtDM_cegikmo FROM @sDM_cegikmo;
EXECUTE stmtDM_cegikmo;

PREPARE stmtDM_cfgjkno FROM @sDM_cfgjkno;
EXECUTE stmtDM_cfgjkno;

PREPARE stmtDM_efglmno FROM @sDM_efglmno;
EXECUTE stmtDM_efglmno;

PREPARE stmtDM_ijklmno FROM @sDM_ijklmno;
EXECUTE stmtDM_ijklmno;


PREPARE stmtDM_a FROM @sDM_a;
EXECUTE stmtDM_a;

PREPARE stmtDM_b FROM @sDM_b;
EXECUTE stmtDM_b;

PREPARE stmtDM_d FROM @sDM_d;
EXECUTE stmtDM_d;

PREPARE stmtDM_h FROM @sDM_h;
EXECUTE stmtDM_h;



END//
DELIMITER ;


DELIMITER //
DROP PROCEDURE IF EXISTS `1SET_P_a_`//
CREATE PROCEDURE `1SET_P_a_` (IN s_id VARCHAR(64))
BEGIN

SET @P = CONCAT('P_a_',s_id);
SET @sP = CONCAT('SELECT PROT.ACCESSION,NAME,TAXON_ID,TAXON_NAME,IS_REVIEWED FROM PROT INNER JOIN ',@P,' ON PROT.ACC=',@P,'.ACCESSION;');

PREPARE stmtP FROM @sP;
EXECUTE stmtP;

END//
DELIMITER ;


DELIMITER //
DROP PROCEDURE IF EXISTS `2SET_P_a_`//
CREATE PROCEDURE `2SET_P_a_` (IN s_id VARCHAR(64))
BEGIN

SET @P = CONCAT('P_a_',s_id);
SET @sP = CONCAT('SELECT PROT.ACCESSION,NAME,TAXON_ID,TAXON_NAME,IS_REVIEWED FROM PROT INNER JOIN ',@P,' ON PROT.ACC=',@P,'.ACCESSION;');

PREPARE stmtP FROM @sP;
EXECUTE stmtP;


END//
DELIMITER ;



DELIMITER //
DROP PROCEDURE IF EXISTS `2SET_P_b_`//
CREATE PROCEDURE `2SET_P_b_` (IN s_id VARCHAR(64))
BEGIN

SET @P = CONCAT('P_b_',s_id);
SET @sP = CONCAT('SELECT PROT.ACCESSION,NAME,TAXON_ID,TAXON_NAME,IS_REVIEWED FROM PROT INNER JOIN ',@P,' ON PROT.ACC=',@P,'.ACCESSION;');

PREPARE stmtP FROM @sP;
EXECUTE stmtP;


END//
DELIMITER ;


DELIMITER //
DROP PROCEDURE IF EXISTS `2SET_P_c_`//
CREATE PROCEDURE `2SET_P_c_` (IN s_id VARCHAR(64))
BEGIN

SET @P = CONCAT('P_c_',s_id);
SET @sP = CONCAT('SELECT PROT.ACCESSION,NAME,TAXON_ID,TAXON_NAME,IS_REVIEWED FROM PROT INNER JOIN ',@P,' ON PROT.ACC=',@P,'.ACCESSION;');

PREPARE stmtP FROM @sP;
EXECUTE stmtP;
END//
DELIMITER ;




DELIMITER //
DROP PROCEDURE IF EXISTS `3SET_P_a_`//
CREATE PROCEDURE `3SET_P_a_` (IN s_id VARCHAR(64))
BEGIN


SET @P = CONCAT('P_a_',s_id);
SET @sP = CONCAT('SELECT PROT.ACCESSION,NAME,TAXON_ID,TAXON_NAME,IS_REVIEWED FROM PROT INNER JOIN ',@P,' ON PROT.ACC=',@P,'.ACCESSION;');

PREPARE stmtP FROM @sP;
EXECUTE stmtP;

 
END//
DELIMITER ;


DELIMITER //
DROP PROCEDURE IF EXISTS `3SET_P_b_`//
CREATE PROCEDURE `3SET_P_b_` (IN s_id VARCHAR(64))
BEGIN

SET @P = CONCAT('P_b_',s_id);
SET @sP = CONCAT('SELECT PROT.ACCESSION,NAME,TAXON_ID,TAXON_NAME,IS_REVIEWED FROM PROT INNER JOIN ',@P,' ON PROT.ACC=',@P,'.ACCESSION;');

PREPARE stmtP FROM @sP;
EXECUTE stmtP;

END//
DELIMITER ;


DELIMITER //
DROP PROCEDURE IF EXISTS `3SET_P_c_`//
CREATE PROCEDURE `3SET_P_c_` (IN s_id VARCHAR(64))
BEGIN

SET @P = CONCAT('P_c_',s_id);
SET @sP = CONCAT('SELECT PROT.ACCESSION,NAME,TAXON_ID,TAXON_NAME,IS_REVIEWED FROM PROT INNER JOIN ',@P,' ON PROT.ACC=',@P,'.ACCESSION;');

PREPARE stmtP FROM @sP;
EXECUTE stmtP;


END//
DELIMITER ;


DELIMITER //
DROP PROCEDURE IF EXISTS `3SET_P_d_`//
CREATE PROCEDURE `3SET_P_d_` (IN s_id VARCHAR(64))
BEGIN

SET @P = CONCAT('P_d_',s_id);
SET @sP = CONCAT('SELECT PROT.ACCESSION,NAME,TAXON_ID,TAXON_NAME,IS_REVIEWED FROM PROT INNER JOIN ',@P,' ON PROT.ACC=',@P,'.ACCESSION;');

PREPARE stmtP FROM @sP;
EXECUTE stmtP;

 
 

END//
DELIMITER ;



DELIMITER //
DROP PROCEDURE IF EXISTS `3SET_P_e_`//
CREATE PROCEDURE `3SET_P_e_` (IN s_id VARCHAR(64))
BEGIN

SET @P = CONCAT('P_e_',s_id);
SET @sP = CONCAT('SELECT PROT.ACCESSION,NAME,TAXON_ID,TAXON_NAME,IS_REVIEWED FROM PROT INNER JOIN ',@P,' ON PROT.ACC=',@P,'.ACCESSION;');

PREPARE stmtP FROM @sP;
EXECUTE stmtP;

 
 

END//
DELIMITER ;



DELIMITER //
DROP PROCEDURE IF EXISTS `3SET_P_f_`//
CREATE PROCEDURE `3SET_P_f_` (IN s_id VARCHAR(64))
BEGIN

SET @P = CONCAT('P_f_',s_id);
SET @sP = CONCAT('SELECT PROT.ACCESSION,NAME,TAXON_ID,TAXON_NAME,IS_REVIEWED FROM PROT INNER JOIN ',@P,' ON PROT.ACC=',@P,'.ACCESSION;');

PREPARE stmtP FROM @sP;
EXECUTE stmtP;

 
 

END//
DELIMITER ;




DELIMITER //
DROP PROCEDURE IF EXISTS `3SET_P_g_`//
CREATE PROCEDURE `3SET_P_g_` (IN s_id VARCHAR(64))
BEGIN

SET @P = CONCAT('P_g_',s_id);
SET @sP = CONCAT('SELECT PROT.ACCESSION,NAME,TAXON_ID,TAXON_NAME,IS_REVIEWED FROM PROT INNER JOIN ',@P,' ON PROT.ACC=',@P,'.ACCESSION;');

PREPARE stmtP FROM @sP;
EXECUTE stmtP;

 

END//
DELIMITER ;



DELIMITER //
DROP PROCEDURE IF EXISTS `4SET_P_a_`//
CREATE PROCEDURE `4SET_P_a_` (IN s_id VARCHAR(64))
BEGIN

SET @P = CONCAT('P_a_',s_id);
SET @sP = CONCAT('SELECT PROT.ACCESSION,NAME,TAXON_ID,TAXON_NAME,IS_REVIEWED FROM PROT INNER JOIN ',@P,' ON PROT.ACC=',@P,'.ACCESSION;');

PREPARE stmtP FROM @sP;
EXECUTE stmtP;

 
 

END//
DELIMITER ;



DELIMITER //
DROP PROCEDURE IF EXISTS `4SET_P_b_`//
CREATE PROCEDURE `4SET_P_b_` (IN s_id VARCHAR(64))
BEGIN

SET @P = CONCAT('P_b_',s_id);
SET @sP = CONCAT('SELECT PROT.ACCESSION,NAME,TAXON_ID,TAXON_NAME,IS_REVIEWED FROM PROT INNER JOIN ',@P,' ON PROT.ACC=',@P,'.ACCESSION;');

PREPARE stmtP FROM @sP;
EXECUTE stmtP;

 
 

END//
DELIMITER ;



DELIMITER //
DROP PROCEDURE IF EXISTS `4SET_P_c_`//
CREATE PROCEDURE `4SET_P_c_` (IN s_id VARCHAR(64))
BEGIN

SET @P = CONCAT('P_c_',s_id);
SET @sP = CONCAT('SELECT PROT.ACCESSION,NAME,TAXON_ID,TAXON_NAME,IS_REVIEWED FROM PROT INNER JOIN ',@P,' ON PROT.ACC=',@P,'.ACCESSION;');

PREPARE stmtP FROM @sP;
EXECUTE stmtP;

 
 

END//
DELIMITER ;



DELIMITER //
DROP PROCEDURE IF EXISTS `4SET_P_d_`//
CREATE PROCEDURE `4SET_P_d_` (IN s_id VARCHAR(64))
BEGIN

SET @P = CONCAT('P_d_',s_id);
SET @sP = CONCAT('SELECT PROT.ACCESSION,NAME,TAXON_ID,TAXON_NAME,IS_REVIEWED FROM PROT INNER JOIN ',@P,' ON PROT.ACC=',@P,'.ACCESSION;');

PREPARE stmtP FROM @sP;
EXECUTE stmtP;

 
 

END//
DELIMITER ;



DELIMITER //
DROP PROCEDURE IF EXISTS `4SET_P_e_`//
CREATE PROCEDURE `4SET_P_e_` (IN s_id VARCHAR(64))
BEGIN

SET @P = CONCAT('P_e_',s_id);
SET @sP = CONCAT('SELECT PROT.ACCESSION,NAME,TAXON_ID,TAXON_NAME,IS_REVIEWED FROM PROT INNER JOIN ',@P,' ON PROT.ACC=',@P,'.ACCESSION;');

PREPARE stmtP FROM @sP;
EXECUTE stmtP;

 
 

END//
DELIMITER ;



DELIMITER //
DROP PROCEDURE IF EXISTS `4SET_P_f_`//
CREATE PROCEDURE `4SET_P_f_` (IN s_id VARCHAR(64))
BEGIN

SET @P = CONCAT('P_f_',s_id);
SET @sP = CONCAT('SELECT PROT.ACCESSION,NAME,TAXON_ID,TAXON_NAME,IS_REVIEWED FROM PROT INNER JOIN ',@P,' ON PROT.ACC=',@P,'.ACCESSION;');

PREPARE stmtP FROM @sP;
EXECUTE stmtP;

 
 

END//
DELIMITER ;


DELIMITER //
DROP PROCEDURE IF EXISTS `4SET_P_g_`//
CREATE PROCEDURE `4SET_P_g_` (IN s_id VARCHAR(64))
BEGIN

SET @P = CONCAT('P_g_',s_id);
SET @sP = CONCAT('SELECT PROT.ACCESSION,NAME,TAXON_ID,TAXON_NAME,IS_REVIEWED FROM PROT INNER JOIN ',@P,' ON PROT.ACC=',@P,'.ACCESSION;');

PREPARE stmtP FROM @sP;
EXECUTE stmtP;

 
 

END//
DELIMITER ;



DELIMITER //
DROP PROCEDURE IF EXISTS `4SET_P_h_`//
CREATE PROCEDURE `4SET_P_h_` (IN s_id VARCHAR(64))
BEGIN

SET @P = CONCAT('P_h_',s_id);
SET @sP = CONCAT('SELECT PROT.ACCESSION,NAME,TAXON_ID,TAXON_NAME,IS_REVIEWED FROM PROT INNER JOIN ',@P,' ON PROT.ACC=',@P,'.ACCESSION;');

PREPARE stmtP FROM @sP;
EXECUTE stmtP;

 
 

END//
DELIMITER ;


DELIMITER //
DROP PROCEDURE IF EXISTS `4SET_P_i_`//
CREATE PROCEDURE `4SET_P_i_` (IN s_id VARCHAR(64))
BEGIN

SET @P = CONCAT('P_i_',s_id);
SET @sP = CONCAT('SELECT PROT.ACCESSION,NAME,TAXON_ID,TAXON_NAME,IS_REVIEWED FROM PROT INNER JOIN ',@P,' ON PROT.ACC=',@P,'.ACCESSION;');

PREPARE stmtP FROM @sP;
EXECUTE stmtP;

 
 

END//
DELIMITER ;


DELIMITER //
DROP PROCEDURE IF EXISTS `4SET_P_j_`//
CREATE PROCEDURE `4SET_P_j_` (IN s_id VARCHAR(64))
BEGIN

SET @P = CONCAT('P_j_',s_id);
SET @sP = CONCAT('SELECT PROT.ACCESSION,NAME,TAXON_ID,TAXON_NAME,IS_REVIEWED FROM PROT INNER JOIN ',@P,' ON PROT.ACC=',@P,'.ACCESSION;');

PREPARE stmtP FROM @sP;
EXECUTE stmtP;

 
 

END//
DELIMITER ;


DELIMITER //
DROP PROCEDURE IF EXISTS `4SET_P_k_`//
CREATE PROCEDURE `4SET_P_k_` (IN s_id VARCHAR(64))
BEGIN

SET @P = CONCAT('P_k_',s_id);
SET @sP = CONCAT('SELECT PROT.ACCESSION,NAME,TAXON_ID,TAXON_NAME,IS_REVIEWED FROM PROT INNER JOIN ',@P,' ON PROT.ACC=',@P,'.ACCESSION;');

PREPARE stmtP FROM @sP;
EXECUTE stmtP;

 
 

END//
DELIMITER ;


DELIMITER //
DROP PROCEDURE IF EXISTS `4SET_P_l_`//
CREATE PROCEDURE `4SET_P_l_` (IN s_id VARCHAR(64))
BEGIN

SET @P = CONCAT('P_l_',s_id);
SET @sP = CONCAT('SELECT PROT.ACCESSION,NAME,TAXON_ID,TAXON_NAME,IS_REVIEWED FROM PROT INNER JOIN ',@P,' ON PROT.ACC=',@P,'.ACCESSION;');

PREPARE stmtP FROM @sP;
EXECUTE stmtP;

 
 

END//
DELIMITER ;


DELIMITER //
DROP PROCEDURE IF EXISTS `4SET_P_m_`//
CREATE PROCEDURE `4SET_P_m_` (IN s_id VARCHAR(64))
BEGIN

SET @P = CONCAT('P_m_',s_id);
SET @sP = CONCAT('SELECT PROT.ACCESSION,NAME,TAXON_ID,TAXON_NAME,IS_REVIEWED FROM PROT INNER JOIN ',@P,' ON PROT.ACC=',@P,'.ACCESSION;');

PREPARE stmtP FROM @sP;
EXECUTE stmtP;

 
 

END//
DELIMITER ;


DELIMITER //
DROP PROCEDURE IF EXISTS `4SET_P_n_`//
CREATE PROCEDURE `4SET_P_n_` (IN s_id VARCHAR(64))
BEGIN

SET @P = CONCAT('P_n_',s_id);
SET @sP = CONCAT('SELECT PROT.ACCESSION,NAME,TAXON_ID,TAXON_NAME,IS_REVIEWED FROM PROT INNER JOIN ',@P,' ON PROT.ACC=',@P,'.ACCESSION;');

PREPARE stmtP FROM @sP;
EXECUTE stmtP;

 
 

END//
DELIMITER ;


DELIMITER //
DROP PROCEDURE IF EXISTS `4SET_P_o_`//
CREATE PROCEDURE `4SET_P_o_` (IN s_id VARCHAR(64))
BEGIN

SET @P = CONCAT('P_o_',s_id);
SET @sP = CONCAT('SELECT PROT.ACCESSION,NAME,TAXON_ID,TAXON_NAME,IS_REVIEWED FROM PROT INNER JOIN ',@P,' ON PROT.ACC=',@P,'.ACCESSION;');

PREPARE stmtP FROM @sP;
EXECUTE stmtP;

 
END//
DELIMITER ;




DELIMITER //
DROP PROCEDURE IF EXISTS `1SET_PW_a_`//
CREATE PROCEDURE `1SET_PW_a_` (IN s_id VARCHAR(64))
BEGIN

SET @PW = CONCAT('PW_a_',s_id);
SET @sPW = CONCAT('SELECT IPR_ID,NAME,PARENTS FROM REACTOME INNER JOIN ',@PW,' ON REACTOME.ID=',@PW,'.PATHWAY AND REACTOME.SPEC=',@PW,'.SPEC;');

PREPARE stmtPW FROM @sPW;
EXECUTE stmtPW;

END//
DELIMITER ;



DELIMITER //
DROP PROCEDURE IF EXISTS `1SET_DM_a_`//
CREATE PROCEDURE `1SET_DM_a_` (IN s_id VARCHAR(64))
BEGIN

SET @DM = CONCAT('DM_a_',s_id);
SET @sDM = CONCAT('SELECT IPR,NAME,PARENTS FROM PFAM INNER JOIN ',@DM,' ON PFAM.PFAM_ID=',@DM,'.DOMAIN;');

PREPARE stmtDM FROM @sDM;
EXECUTE stmtDM;


END//
DELIMITER ;




DELIMITER //
DROP PROCEDURE IF EXISTS `1SET_GM_a_`//
CREATE PROCEDURE `1SET_GM_a_` (IN s_id VARCHAR(64))
BEGIN

SET @GM = CONCAT('GM_a_',s_id);
SET @sGM = CONCAT('SELECT GO_ID,NAME,PARENTS,DEPTH FROM MOLFUNC INNER JOIN ',@GM,' ON MOLFUNC.GO_MOLFUNC=',@GM,'.ONTOLOGY;');


PREPARE stmtGM FROM @sGM ;
EXECUTE stmtGM;

END//
DELIMITER ;



DELIMITER //
DROP PROCEDURE IF EXISTS `1SET_GB_a_`//
CREATE PROCEDURE `1SET_GB_a_` (IN s_id VARCHAR(64))
BEGIN

SET @GB = CONCAT('GB_a_',s_id);
SET @sGB = CONCAT('SELECT GO_ID,NAME,PARENTS,DEPTH FROM BIOPROC INNER JOIN ',@GB,' ON BIOPROC.GO_BIOPROC=',@GB,'.ONTOLOGY;');

PREPARE stmtGB FROM @sGB;
EXECUTE stmtGB;


END//
DELIMITER ;


DELIMITER //
DROP PROCEDURE IF EXISTS `2SET_PW_a_`//
CREATE PROCEDURE `2SET_PW_a_` (IN s_id VARCHAR(64))
BEGIN

SET @PW = CONCAT('PW_a_',s_id);
SET @sPW = CONCAT('SELECT IPR_ID,NAME,PARENTS FROM REACTOME INNER JOIN ',@PW,' ON REACTOME.ID=',@PW,'.PATHWAY AND REACTOME.SPEC=',@PW,'.SPEC;');

PREPARE stmtPW FROM @sPW;
EXECUTE stmtPW;


END//
DELIMITER ;


DELIMITER //
DROP PROCEDURE IF EXISTS `2SET_PW_b_`//
CREATE PROCEDURE `2SET_PW_b_` (IN s_id VARCHAR(64))
BEGIN

SET @PW = CONCAT('PW_b_',s_id);
SET @sPW = CONCAT('SELECT IPR_ID,NAME,PARENTS FROM REACTOME INNER JOIN ',@PW,' ON REACTOME.ID=',@PW,'.PATHWAY AND REACTOME.SPEC=',@PW,'.SPEC;');

PREPARE stmtPW FROM @sPW;
EXECUTE stmtPW;


END//
DELIMITER ;



DELIMITER //
DROP PROCEDURE IF EXISTS `2SET_PW_c_`//
CREATE PROCEDURE `2SET_PW_c_` (IN s_id VARCHAR(64))
BEGIN

SET @PW = CONCAT('PW_c_',s_id);
SET @sPW = CONCAT('SELECT IPR_ID,NAME,PARENTS FROM REACTOME INNER JOIN ',@PW,' ON REACTOME.ID=',@PW,'.PATHWAY AND REACTOME.SPEC=',@PW,'.SPEC;');

PREPARE stmtPW FROM @sPW;
EXECUTE stmtPW;


END//
DELIMITER ;



DELIMITER //
DROP PROCEDURE IF EXISTS `2SET_DM_a_`//
CREATE PROCEDURE `2SET_DM_a_` (IN s_id VARCHAR(64))
BEGIN

SET @DM = CONCAT('DM_a_',s_id);
SET @sDM = CONCAT('SELECT IPR,NAME,PARENTS FROM PFAM INNER JOIN ',@DM,' ON PFAM.PFAM_ID=',@DM,'.DOMAIN;');

PREPARE stmtDM FROM @sDM;
EXECUTE stmtDM;

END//
DELIMITER ;



DELIMITER //
DROP PROCEDURE IF EXISTS `2SET_DM_b_`//
CREATE PROCEDURE `2SET_DM_b_` (IN s_id VARCHAR(64))
BEGIN

SET @DM = CONCAT('DM_b_',s_id);
SET @sDM = CONCAT('SELECT IPR,NAME,PARENTS FROM PFAM INNER JOIN ',@DM,' ON PFAM.PFAM_ID=',@DM,'.DOMAIN;');

PREPARE stmtDM FROM @sDM;
EXECUTE stmtDM;


END//
DELIMITER ;



DELIMITER //
DROP PROCEDURE IF EXISTS `2SET_DM_c_`//
CREATE PROCEDURE `2SET_DM_c_` (IN s_id VARCHAR(64))
BEGIN

SET @DM = CONCAT('DM_c_',s_id);
SET @sDM = CONCAT('SELECT IPR,NAME,PARENTS FROM PFAM INNER JOIN ',@DM,' ON PFAM.PFAM_ID=',@DM,'.DOMAIN;');

PREPARE stmtDM FROM @sDM;
EXECUTE stmtDM;


END//
DELIMITER ;



DELIMITER //
DROP PROCEDURE IF EXISTS `2SET_GM_a_`//
CREATE PROCEDURE `2SET_GM_a_` (IN s_id VARCHAR(64))
BEGIN

SET @GM = CONCAT('GM_a_',s_id);
SET @sGM = CONCAT('SELECT GO_ID,NAME,PARENTS,DEPTH FROM MOLFUNC INNER JOIN ',@GM,' ON MOLFUNC.GO_MOLFUNC=',@GM,'.ONTOLOGY;');

PREPARE stmtGM FROM @sGM;
EXECUTE stmtGM;


END//
DELIMITER ;



DELIMITER //
DROP PROCEDURE IF EXISTS `2SET_GM_b_`//
CREATE PROCEDURE `2SET_GM_b_` (IN s_id VARCHAR(64))
BEGIN

SET @GM = CONCAT('GM_b_',s_id);
SET @sGM = CONCAT('SELECT GO_ID,NAME,PARENTS,DEPTH FROM MOLFUNC INNER JOIN ',@GM,' ON MOLFUNC.GO_MOLFUNC=',@GM,'.ONTOLOGY;');

PREPARE stmtGM FROM @sGM;
EXECUTE stmtGM;



END//
DELIMITER ;



DELIMITER //
DROP PROCEDURE IF EXISTS `2SET_GM_c_`//
CREATE PROCEDURE `2SET_GM_c_` (IN s_id VARCHAR(64))
BEGIN

SET @GM = CONCAT('GM_c_',s_id);
SET @sGM = CONCAT('SELECT GO_ID,NAME,PARENTS,DEPTH FROM MOLFUNC INNER JOIN ',@GM,' ON MOLFUNC.GO_MOLFUNC=',@GM,'.ONTOLOGY;');

PREPARE stmtGM FROM @sGM;
EXECUTE stmtGM;

END//
DELIMITER ;




DELIMITER //
DROP PROCEDURE IF EXISTS `2SET_GB_a_`//
CREATE PROCEDURE `2SET_GB_a_` (IN s_id VARCHAR(64))
BEGIN

SET @GB = CONCAT('GB_a_',s_id);
SET @sGB = CONCAT('SELECT GO_ID,NAME,PARENTS,DEPTH FROM BIOPROC INNER JOIN ',@GB,' ON BIOPROC.GO_BIOPROC=',@GB,'.ONTOLOGY;');

PREPARE stmtGB FROM @sGB;
EXECUTE stmtGB;


END//
DELIMITER ;




DELIMITER //
DROP PROCEDURE IF EXISTS `2SET_GB_b_`//
CREATE PROCEDURE `2SET_GB_b_` (IN s_id VARCHAR(64))
BEGIN

SET @GB = CONCAT('GB_b_',s_id);
SET @sGB = CONCAT('SELECT GO_ID,NAME,PARENTS,DEPTH FROM BIOPROC INNER JOIN ',@GB,' ON BIOPROC.GO_BIOPROC=',@GB,'.ONTOLOGY;');

PREPARE stmtGB FROM @sGB;
EXECUTE stmtGB;



END//
DELIMITER ;




DELIMITER //
DROP PROCEDURE IF EXISTS `2SET_GB_c_`//
CREATE PROCEDURE `2SET_GB_c_` (IN s_id VARCHAR(64))
BEGIN

SET @GB = CONCAT('GB_c_',s_id);
SET @sGB = CONCAT('SELECT GO_ID,NAME,PARENTS,DEPTH FROM BIOPROC INNER JOIN ',@GB,' ON BIOPROC.GO_BIOPROC=',@GB,'.ONTOLOGY;');

PREPARE stmtGB FROM @sGB;
EXECUTE stmtGB;



END//
DELIMITER ;



DELIMITER //
DROP PROCEDURE IF EXISTS `3SET_PW_a_`//
CREATE PROCEDURE `3SET_PW_a_` (IN s_id VARCHAR(64))
BEGIN

SET @PW = CONCAT('PW_a_',s_id);
SET @sPW = CONCAT('SELECT IPR_ID,NAME,PARENTS FROM REACTOME INNER JOIN ',@PW,' ON REACTOME.ID=',@PW,'.PATHWAY AND REACTOME.SPEC=',@PW,'.SPEC;');

PREPARE stmtPW FROM @sPW;
EXECUTE stmtPW;

 
 

END//
DELIMITER ;




DELIMITER //
DROP PROCEDURE IF EXISTS `3SET_PW_b_`//
CREATE PROCEDURE `3SET_PW_b_` (IN s_id VARCHAR(64))
BEGIN

SET @PW = CONCAT('PW_b_',s_id);
SET @sPW = CONCAT('SELECT IPR_ID,NAME,PARENTS FROM REACTOME INNER JOIN ',@PW,' ON REACTOME.ID=',@PW,'.PATHWAY AND REACTOME.SPEC=',@PW,'.SPEC;');

PREPARE stmtPW FROM @sPW;
EXECUTE stmtPW;

 
 

END//
DELIMITER ;



DELIMITER //
DROP PROCEDURE IF EXISTS `3SET_PW_c_`//
CREATE PROCEDURE `3SET_PW_c_` (IN s_id VARCHAR(64))
BEGIN

SET @PW = CONCAT('PW_c_',s_id);
SET @sPW = CONCAT('SELECT IPR_ID,NAME,PARENTS FROM REACTOME INNER JOIN ',@PW,' ON REACTOME.ID=',@PW,'.PATHWAY AND REACTOME.SPEC=',@PW,'.SPEC;');

PREPARE stmtPW FROM @sPW;
EXECUTE stmtPW;

 
 

END//
DELIMITER ;



DELIMITER //
DROP PROCEDURE IF EXISTS `3SET_PW_d_`//
CREATE PROCEDURE `3SET_PW_d_` (IN s_id VARCHAR(64))
BEGIN

SET @PW = CONCAT('PW_d_',s_id);
SET @sPW = CONCAT('SELECT IPR_ID,NAME,PARENTS FROM REACTOME INNER JOIN ',@PW,' ON REACTOME.ID=',@PW,'.PATHWAY AND REACTOME.SPEC=',@PW,'.SPEC;');

PREPARE stmtPW FROM @sPW;
EXECUTE stmtPW;

 
 

END//
DELIMITER ;



DELIMITER //
DROP PROCEDURE IF EXISTS `3SET_PW_e_`//
CREATE PROCEDURE `3SET_PW_e_` (IN s_id VARCHAR(64))
BEGIN

SET @PW = CONCAT('PW_e_',s_id);
SET @sPW = CONCAT('SELECT IPR_ID,NAME,PARENTS FROM REACTOME INNER JOIN ',@PW,' ON REACTOME.ID=',@PW,'.PATHWAY AND REACTOME.SPEC=',@PW,'.SPEC;');

PREPARE stmtPW FROM @sPW;
EXECUTE stmtPW;

 
 

END//
DELIMITER ;



DELIMITER //
DROP PROCEDURE IF EXISTS `3SET_PW_f_`//
CREATE PROCEDURE `3SET_PW_f_` (IN s_id VARCHAR(64))
BEGIN

SET @PW = CONCAT('PW_f_',s_id);
SET @sPW = CONCAT('SELECT IPR_ID,NAME,PARENTS FROM REACTOME INNER JOIN ',@PW,' ON REACTOME.ID=',@PW,'.PATHWAY AND REACTOME.SPEC=',@PW,'.SPEC;');

PREPARE stmtPW FROM @sPW;
EXECUTE stmtPW;

 
 

END//
DELIMITER ;



DELIMITER //
DROP PROCEDURE IF EXISTS `3SET_PW_g_`//
CREATE PROCEDURE `3SET_PW_g_` (IN s_id VARCHAR(64))
BEGIN

SET @PW = CONCAT('PW_g_',s_id);
SET @sPW = CONCAT('SELECT IPR_ID,NAME,PARENTS FROM REACTOME INNER JOIN ',@PW,' ON REACTOME.ID=',@PW,'.PATHWAY AND REACTOME.SPEC=',@PW,'.SPEC;');

PREPARE stmtPW FROM @sPW;
EXECUTE stmtPW;

 
 

END//
DELIMITER ;




DELIMITER //
DROP PROCEDURE IF EXISTS `3SET_DM_a_`//
CREATE PROCEDURE `3SET_DM_a_` (IN s_id VARCHAR(64))
BEGIN

SET @DM = CONCAT('DM_a_',s_id);
SET @sDM = CONCAT('SELECT IPR,NAME,PARENTS FROM PFAM INNER JOIN ',@DM,' ON PFAM.PFAM_ID=',@DM,'.DOMAIN;');

PREPARE stmtDM FROM @sDM;
EXECUTE stmtDM;

 
 

END//
DELIMITER ;



DELIMITER //
DROP PROCEDURE IF EXISTS `3SET_DM_b_`//
CREATE PROCEDURE `3SET_DM_b_` (IN s_id VARCHAR(64))
BEGIN

SET @DM = CONCAT('DM_b_',s_id);
SET @sDM = CONCAT('SELECT IPR,NAME,PARENTS FROM PFAM INNER JOIN ',@DM,' ON PFAM.PFAM_ID=',@DM,'.DOMAIN;');

PREPARE stmtDM FROM @sDM;
EXECUTE stmtDM;

 
 

END//
DELIMITER ;



DELIMITER //
DROP PROCEDURE IF EXISTS `3SET_DM_c_`//
CREATE PROCEDURE `3SET_DM_c_` (IN s_id VARCHAR(64))
BEGIN

SET @DM = CONCAT('DM_c_',s_id);
SET @sDM = CONCAT('SELECT IPR,NAME,PARENTS FROM PFAM INNER JOIN ',@DM,' ON PFAM.PFAM_ID=',@DM,'.DOMAIN;');

PREPARE stmtDM FROM @sDM;
EXECUTE stmtDM;

 
 

END//
DELIMITER ;



DELIMITER //
DROP PROCEDURE IF EXISTS `3SET_DM_d_`//
CREATE PROCEDURE `3SET_DM_d_` (IN s_id VARCHAR(64))
BEGIN

SET @DM = CONCAT('DM_d_',s_id);
SET @sDM = CONCAT('SELECT IPR,NAME,PARENTS FROM PFAM INNER JOIN ',@DM,' ON PFAM.PFAM_ID=',@DM,'.DOMAIN;');

PREPARE stmtDM FROM @sDM;
EXECUTE stmtDM;

 
 

END//
DELIMITER ;



DELIMITER //
DROP PROCEDURE IF EXISTS `3SET_DM_e_`//
CREATE PROCEDURE `3SET_DM_e_` (IN s_id VARCHAR(64))
BEGIN

SET @DM = CONCAT('DM_e_',s_id);
SET @sDM = CONCAT('SELECT IPR,NAME,PARENTS FROM PFAM INNER JOIN ',@DM,' ON PFAM.PFAM_ID=',@DM,'.DOMAIN;');

PREPARE stmtDM FROM @sDM;
EXECUTE stmtDM;

 
 

END//
DELIMITER ;



DELIMITER //
DROP PROCEDURE IF EXISTS `3SET_DM_f_`//
CREATE PROCEDURE `3SET_DM_f_` (IN s_id VARCHAR(64))
BEGIN

SET @DM = CONCAT('DM_f_',s_id);
SET @sDM = CONCAT('SELECT IPR,NAME,PARENTS FROM PFAM INNER JOIN ',@DM,' ON PFAM.PFAM_ID=',@DM,'.DOMAIN;');

PREPARE stmtDM FROM @sDM;
EXECUTE stmtDM;

 
 

END//
DELIMITER ;




DELIMITER //
DROP PROCEDURE IF EXISTS `3SET_DM_g_`//
CREATE PROCEDURE `3SET_DM_g_` (IN s_id VARCHAR(64))
BEGIN

SET @DM = CONCAT('DM_g_',s_id);
SET @sDM = CONCAT('SELECT IPR,NAME,PARENTS FROM PFAM INNER JOIN ',@DM,' ON PFAM.PFAM_ID=',@DM,'.DOMAIN;');

PREPARE stmtDM FROM @sDM;
EXECUTE stmtDM;

 
 

END//
DELIMITER ;




DELIMITER //
DROP PROCEDURE IF EXISTS `3SET_GM_a_`//
CREATE PROCEDURE `3SET_GM_a_` (IN s_id VARCHAR(64))
BEGIN

SET @GM = CONCAT('GM_a_',s_id);
SET @sGM = CONCAT('SELECT GO_ID,NAME,PARENTS,DEPTH FROM MOLFUNC INNER JOIN ',@GM,' ON MOLFUNC.GO_MOLFUNC=',@GM,'.ONTOLOGY;');

PREPARE stmtGM FROM @sGM;
EXECUTE stmtGM;

 
 

END//
DELIMITER ;



DELIMITER //
DROP PROCEDURE IF EXISTS `3SET_GM_b_`//
CREATE PROCEDURE `3SET_GM_b_` (IN s_id VARCHAR(64))
BEGIN

SET @GM = CONCAT('GM_b_',s_id);
SET @sGM = CONCAT('SELECT GO_ID,NAME,PARENTS,DEPTH FROM MOLFUNC INNER JOIN ',@GM,' ON MOLFUNC.GO_MOLFUNC=',@GM,'.ONTOLOGY;');

PREPARE stmtGM FROM @sGM;
EXECUTE stmtGM;

 
 

END//
DELIMITER ;



DELIMITER //
DROP PROCEDURE IF EXISTS `3SET_GM_c_`//
CREATE PROCEDURE `3SET_GM_c_` (IN s_id VARCHAR(64))
BEGIN

SET @GM = CONCAT('GM_c_',s_id);
SET @sGM = CONCAT('SELECT GO_ID,NAME,PARENTS,DEPTH FROM MOLFUNC INNER JOIN ',@GM,' ON MOLFUNC.GO_MOLFUNC=',@GM,'.ONTOLOGY;');

PREPARE stmtGM FROM @sGM;
EXECUTE stmtGM;

 
 

END//
DELIMITER ;



DELIMITER //
DROP PROCEDURE IF EXISTS `3SET_GM_d_`//
CREATE PROCEDURE `3SET_GM_d_` (IN s_id VARCHAR(64))
BEGIN

SET @GM = CONCAT('GM_d_',s_id);
SET @sGM = CONCAT('SELECT GO_ID,NAME,PARENTS,DEPTH FROM MOLFUNC INNER JOIN ',@GM,' ON MOLFUNC.GO_MOLFUNC=',@GM,'.ONTOLOGY;');

PREPARE stmtGM FROM @sGM;
EXECUTE stmtGM;

 
 

END//
DELIMITER ;



DELIMITER //
DROP PROCEDURE IF EXISTS `3SET_GM_e_`//
CREATE PROCEDURE `3SET_GM_e_` (IN s_id VARCHAR(64))
BEGIN

SET @GM = CONCAT('GM_e_',s_id);
SET @sGM = CONCAT('SELECT GO_ID,NAME,PARENTS,DEPTH FROM MOLFUNC INNER JOIN ',@GM,' ON MOLFUNC.GO_MOLFUNC=',@GM,'.ONTOLOGY;');

PREPARE stmtGM FROM @sGM;
EXECUTE stmtGM;

 
 

END//
DELIMITER ;




DELIMITER //
DROP PROCEDURE IF EXISTS `3SET_GM_f_`//
CREATE PROCEDURE `3SET_GM_f_` (IN s_id VARCHAR(64))
BEGIN

SET @GM = CONCAT('GM_f_',s_id);
SET @sGM = CONCAT('SELECT GO_ID,NAME,PARENTS,DEPTH FROM MOLFUNC INNER JOIN ',@GM,' ON MOLFUNC.GO_MOLFUNC=',@GM,'.ONTOLOGY;');

PREPARE stmtGM FROM @sGM;
EXECUTE stmtGM;

 
 

END//
DELIMITER ;



DELIMITER //
DROP PROCEDURE IF EXISTS `3SET_GM_g_`//
CREATE PROCEDURE `3SET_GM_g_` (IN s_id VARCHAR(64))
BEGIN

SET @GM = CONCAT('GM_g_',s_id);
SET @sGM = CONCAT('SELECT GO_ID,NAME,PARENTS,DEPTH FROM MOLFUNC INNER JOIN ',@GM,' ON MOLFUNC.GO_MOLFUNC=',@GM,'.ONTOLOGY;');

PREPARE stmtGM FROM @sGM;
EXECUTE stmtGM;

 
 

END//
DELIMITER ;




DELIMITER //
DROP PROCEDURE IF EXISTS `3SET_GB_a_`//
CREATE PROCEDURE `3SET_GB_a_` (IN s_id VARCHAR(64))
BEGIN

SET @GB = CONCAT('GB_a_',s_id);
SET @sGB = CONCAT('SELECT GO_ID,NAME,PARENTS,DEPTH FROM BIOPROC INNER JOIN ',@GB,' ON BIOPROC.GO_BIOPROC=',@GB,'.ONTOLOGY;');

PREPARE stmtGB FROM @sGB;
EXECUTE stmtGB;

 
 

END//
DELIMITER ;



DELIMITER //
DROP PROCEDURE IF EXISTS `3SET_GB_b_`//
CREATE PROCEDURE `3SET_GB_b_` (IN s_id VARCHAR(64))
BEGIN

SET @GB = CONCAT('GB_b_',s_id);
SET @sGB = CONCAT('SELECT GO_ID,NAME,PARENTS,DEPTH FROM BIOPROC INNER JOIN ',@GB,' ON BIOPROC.GO_BIOPROC=',@GB,'.ONTOLOGY;');

PREPARE stmtGB FROM @sGB;
EXECUTE stmtGB;

 
 

END//
DELIMITER ;





DELIMITER //
DROP PROCEDURE IF EXISTS `3SET_GB_c_`//
CREATE PROCEDURE `3SET_GB_c_` (IN s_id VARCHAR(64))
BEGIN

SET @GB = CONCAT('GB_c_',s_id);
SET @sGB = CONCAT('SELECT GO_ID,NAME,PARENTS,DEPTH FROM BIOPROC INNER JOIN ',@GB,' ON BIOPROC.GO_BIOPROC=',@GB,'.ONTOLOGY;');

PREPARE stmtGB FROM @sGB;
EXECUTE stmtGB;

 
 

END//
DELIMITER ;




DELIMITER //
DROP PROCEDURE IF EXISTS `3SET_GB_d_`//
CREATE PROCEDURE `3SET_GB_d_` (IN s_id VARCHAR(64))
BEGIN

SET @GB = CONCAT('GB_d_',s_id);
SET @sGB = CONCAT('SELECT GO_ID,NAME,PARENTS,DEPTH FROM BIOPROC INNER JOIN ',@GB,' ON BIOPROC.GO_BIOPROC=',@GB,'.ONTOLOGY;');

PREPARE stmtGB FROM @sGB;
EXECUTE stmtGB;

 
 

END//
DELIMITER ;



DELIMITER //
DROP PROCEDURE IF EXISTS `3SET_GB_e_`//
CREATE PROCEDURE `3SET_GB_e_` (IN s_id VARCHAR(64))
BEGIN

SET @GB = CONCAT('GB_e_',s_id);
SET @sGB = CONCAT('SELECT GO_ID,NAME,PARENTS,DEPTH FROM BIOPROC INNER JOIN ',@GB,' ON BIOPROC.GO_BIOPROC=',@GB,'.ONTOLOGY;');

PREPARE stmtGB FROM @sGB;
EXECUTE stmtGB;

 
 

END//
DELIMITER ;




DELIMITER //
DROP PROCEDURE IF EXISTS `3SET_GB_f_`//
CREATE PROCEDURE `3SET_GB_f_` (IN s_id VARCHAR(64))
BEGIN

SET @GB = CONCAT('GB_f_',s_id);
SET @sGB = CONCAT('SELECT GO_ID,NAME,PARENTS,DEPTH FROM BIOPROC INNER JOIN ',@GB,' ON BIOPROC.GO_BIOPROC=',@GB,'.ONTOLOGY;');

PREPARE stmtGB FROM @sGB;
EXECUTE stmtGB;

 
 

END//
DELIMITER ;




DELIMITER //
DROP PROCEDURE IF EXISTS `3SET_GB_g_`//
CREATE PROCEDURE `3SET_GB_g_` (IN s_id VARCHAR(64))
BEGIN

SET @GB = CONCAT('GB_g_',s_id);
SET @sGB = CONCAT('SELECT GO_ID,NAME,PARENTS,DEPTH FROM BIOPROC INNER JOIN ',@GB,' ON BIOPROC.GO_BIOPROC=',@GB,'.ONTOLOGY;');

PREPARE stmtGB FROM @sGB;
EXECUTE stmtGB;

 
 

END//
DELIMITER ;




DELIMITER //
DROP PROCEDURE IF EXISTS `4SET_PW_a_`//
CREATE PROCEDURE `4SET_PW_a_` (IN s_id VARCHAR(64))
BEGIN

SET @PW = CONCAT('PW_a_',s_id);
SET @sPW = CONCAT('SELECT IPR_ID,NAME,PARENTS FROM REACTOME INNER JOIN ',@PW,' ON REACTOME.ID=',@PW,'.PATHWAY AND REACTOME.SPEC=',@PW,'.SPEC;');

PREPARE stmtPW FROM @sPW;
EXECUTE stmtPW;

 
 

END//
DELIMITER ;



DELIMITER //
DROP PROCEDURE IF EXISTS `4SET_PW_b_`//
CREATE PROCEDURE `4SET_PW_b_` (IN s_id VARCHAR(64))
BEGIN

SET @PW = CONCAT('PW_b_',s_id);
SET @sPW = CONCAT('SELECT IPR_ID,NAME,PARENTS FROM REACTOME INNER JOIN ',@PW,' ON REACTOME.ID=',@PW,'.PATHWAY AND REACTOME.SPEC=',@PW,'.SPEC;');

PREPARE stmtPW FROM @sPW;
EXECUTE stmtPW;

 
 

END//
DELIMITER ;



DELIMITER //
DROP PROCEDURE IF EXISTS `4SET_PW_c_`//
CREATE PROCEDURE `4SET_PW_c_` (IN s_id VARCHAR(64))
BEGIN

SET @PW = CONCAT('PW_c_',s_id);
SET @sPW = CONCAT('SELECT IPR_ID,NAME,PARENTS FROM REACTOME INNER JOIN ',@PW,' ON REACTOME.ID=',@PW,'.PATHWAY AND REACTOME.SPEC=',@PW,'.SPEC;');

PREPARE stmtPW FROM @sPW;
EXECUTE stmtPW;

 
 

END//
DELIMITER ;



DELIMITER //
DROP PROCEDURE IF EXISTS `4SET_PW_d_`//
CREATE PROCEDURE `4SET_PW_d_` (IN s_id VARCHAR(64))
BEGIN

SET @PW = CONCAT('PW_d_',s_id);
SET @sPW = CONCAT('SELECT IPR_ID,NAME,PARENTS FROM REACTOME INNER JOIN ',@PW,' ON REACTOME.ID=',@PW,'.PATHWAY AND REACTOME.SPEC=',@PW,'.SPEC;');

PREPARE stmtPW FROM @sPW;
EXECUTE stmtPW;

 
 

END//
DELIMITER ;


DELIMITER //
DROP PROCEDURE IF EXISTS `4SET_PW_e_`//
CREATE PROCEDURE `4SET_PW_e_` (IN s_id VARCHAR(64))
BEGIN

SET @PW = CONCAT('PW_e_',s_id);
SET @sPW = CONCAT('SELECT IPR_ID,NAME,PARENTS FROM REACTOME INNER JOIN ',@PW,' ON REACTOME.ID=',@PW,'.PATHWAY AND REACTOME.SPEC=',@PW,'.SPEC;');

PREPARE stmtPW FROM @sPW;
EXECUTE stmtPW;

 
 

END//
DELIMITER ;



DELIMITER //
DROP PROCEDURE IF EXISTS `4SET_PW_f_`//
CREATE PROCEDURE `4SET_PW_f_` (IN s_id VARCHAR(64))
BEGIN

SET @PW = CONCAT('PW_f_',s_id);
SET @sPW = CONCAT('SELECT IPR_ID,NAME,PARENTS FROM REACTOME INNER JOIN ',@PW,' ON REACTOME.ID=',@PW,'.PATHWAY AND REACTOME.SPEC=',@PW,'.SPEC;');

PREPARE stmtPW FROM @sPW;
EXECUTE stmtPW;

 
 

END//
DELIMITER ;



DELIMITER //
DROP PROCEDURE IF EXISTS `4SET_PW_g_`//
CREATE PROCEDURE `4SET_PW_g_` (IN s_id VARCHAR(64))
BEGIN

SET @PW = CONCAT('PW_g_',s_id);
SET @sPW = CONCAT('SELECT IPR_ID,NAME,PARENTS FROM REACTOME INNER JOIN ',@PW,' ON REACTOME.ID=',@PW,'.PATHWAY AND REACTOME.SPEC=',@PW,'.SPEC;');

PREPARE stmtPW FROM @sPW;
EXECUTE stmtPW;

 
 

END//
DELIMITER ;



DELIMITER //
DROP PROCEDURE IF EXISTS `4SET_PW_h_`//
CREATE PROCEDURE `4SET_PW_h_` (IN s_id VARCHAR(64))
BEGIN

SET @PW = CONCAT('PW_h_',s_id);
SET @sPW = CONCAT('SELECT IPR_ID,NAME,PARENTS FROM REACTOME INNER JOIN ',@PW,' ON REACTOME.ID=',@PW,'.PATHWAY AND REACTOME.SPEC=',@PW,'.SPEC;');

PREPARE stmtPW FROM @sPW;
EXECUTE stmtPW;

 
 

END//
DELIMITER ;




DELIMITER //
DROP PROCEDURE IF EXISTS `4SET_PW_i_`//
CREATE PROCEDURE `4SET_PW_i_` (IN s_id VARCHAR(64))
BEGIN

SET @PW = CONCAT('PW_i_',s_id);
SET @sPW = CONCAT('SELECT IPR_ID,NAME,PARENTS FROM REACTOME INNER JOIN ',@PW,' ON REACTOME.ID=',@PW,'.PATHWAY AND REACTOME.SPEC=',@PW,'.SPEC;');

PREPARE stmtPW FROM @sPW;
EXECUTE stmtPW;

 
 

END//
DELIMITER ;



DELIMITER //
DROP PROCEDURE IF EXISTS `4SET_PW_j_`//
CREATE PROCEDURE `4SET_PW_j_` (IN s_id VARCHAR(64))
BEGIN

SET @PW = CONCAT('PW_j_',s_id);
SET @sPW = CONCAT('SELECT IPR_ID,NAME,PARENTS FROM REACTOME INNER JOIN ',@PW,' ON REACTOME.ID=',@PW,'.PATHWAY AND REACTOME.SPEC=',@PW,'.SPEC;');

PREPARE stmtPW FROM @sPW;
EXECUTE stmtPW;

 
 

END//
DELIMITER ;



DELIMITER //
DROP PROCEDURE IF EXISTS `4SET_PW_k_`//
CREATE PROCEDURE `4SET_PW_k_` (IN s_id VARCHAR(64))
BEGIN

SET @PW = CONCAT('PW_k_',s_id);
SET @sPW = CONCAT('SELECT IPR_ID,NAME,PARENTS FROM REACTOME INNER JOIN ',@PW,' ON REACTOME.ID=',@PW,'.PATHWAY AND REACTOME.SPEC=',@PW,'.SPEC;');

PREPARE stmtPW FROM @sPW;
EXECUTE stmtPW;

 
 

END//
DELIMITER ;



DELIMITER //
DROP PROCEDURE IF EXISTS `4SET_PW_l_`//
CREATE PROCEDURE `4SET_PW_l_` (IN s_id VARCHAR(64))
BEGIN

SET @PW = CONCAT('PW_l_',s_id);
SET @sPW = CONCAT('SELECT IPR_ID,NAME,PARENTS FROM REACTOME INNER JOIN ',@PW,' ON REACTOME.ID=',@PW,'.PATHWAY AND REACTOME.SPEC=',@PW,'.SPEC;');

PREPARE stmtPW FROM @sPW;
EXECUTE stmtPW;

 
 

END//
DELIMITER ;



DELIMITER //
DROP PROCEDURE IF EXISTS `4SET_PW_m_`//
CREATE PROCEDURE `4SET_PW_m_` (IN s_id VARCHAR(64))
BEGIN

SET @PW = CONCAT('PW_m_',s_id);
SET @sPW = CONCAT('SELECT IPR_ID,NAME,PARENTS FROM REACTOME INNER JOIN ',@PW,' ON REACTOME.ID=',@PW,'.PATHWAY AND REACTOME.SPEC=',@PW,'.SPEC;');

PREPARE stmtPW FROM @sPW;
EXECUTE stmtPW;

 
 

END//
DELIMITER ;


DELIMITER //
DROP PROCEDURE IF EXISTS `4SET_PW_n_`//
CREATE PROCEDURE `4SET_PW_n_` (IN s_id VARCHAR(64))
BEGIN

SET @PW = CONCAT('PW_n_',s_id);
SET @sPW = CONCAT('SELECT IPR_ID,NAME,PARENTS FROM REACTOME INNER JOIN ',@PW,' ON REACTOME.ID=',@PW,'.PATHWAY AND REACTOME.SPEC=',@PW,'.SPEC;');

PREPARE stmtPW FROM @sPW;
EXECUTE stmtPW;

 
 

END//
DELIMITER ;


DELIMITER //
DROP PROCEDURE IF EXISTS `4SET_PW_o_`//
CREATE PROCEDURE `4SET_PW_o_` (IN s_id VARCHAR(64))
BEGIN

SET @PW = CONCAT('PW_o_',s_id);
SET @sPW = CONCAT('SELECT IPR_ID,NAME,PARENTS FROM REACTOME INNER JOIN ',@PW,' ON REACTOME.ID=',@PW,'.PATHWAY AND REACTOME.SPEC=',@PW,'.SPEC;');

PREPARE stmtPW FROM @sPW;
EXECUTE stmtPW;

 
 

END//
DELIMITER ;




DELIMITER //
DROP PROCEDURE IF EXISTS `4SET_DM_a_`//
CREATE PROCEDURE `4SET_DM_a_` (IN s_id VARCHAR(64))
BEGIN

SET @DM = CONCAT('DM_a_',s_id);
SET @sDM = CONCAT('SELECT IPR,NAME,PARENTS FROM PFAM INNER JOIN ',@DM,' ON PFAM.PFAM_ID=',@DM,'.DOMAIN;');

PREPARE stmtDM FROM @sDM;
EXECUTE stmtDM;

 
 

END//
DELIMITER ;



DELIMITER //
DROP PROCEDURE IF EXISTS `4SET_DM_b_`//
CREATE PROCEDURE `4SET_DM_b_` (IN s_id VARCHAR(64))
BEGIN

SET @DM = CONCAT('DM_b_',s_id);
SET @sDM = CONCAT('SELECT IPR,NAME,PARENTS FROM PFAM INNER JOIN ',@DM,' ON PFAM.PFAM_ID=',@DM,'.DOMAIN;');

PREPARE stmtDM FROM @sDM;
EXECUTE stmtDM;

 
 

END//
DELIMITER ;



DELIMITER //
DROP PROCEDURE IF EXISTS `4SET_DM_c_`//
CREATE PROCEDURE `4SET_DM_c_` (IN s_id VARCHAR(64))
BEGIN

SET @DM = CONCAT('DM_c_',s_id);
SET @sDM = CONCAT('SELECT IPR,NAME,PARENTS FROM PFAM INNER JOIN ',@DM,' ON PFAM.PFAM_ID=',@DM,'.DOMAIN;');

PREPARE stmtDM FROM @sDM;
EXECUTE stmtDM;

 
 

END//
DELIMITER ;



DELIMITER //
DROP PROCEDURE IF EXISTS `4SET_DM_d_`//
CREATE PROCEDURE `4SET_DM_d_` (IN s_id VARCHAR(64))
BEGIN

SET @DM = CONCAT('DM_d_',s_id);
SET @sDM = CONCAT('SELECT IPR,NAME,PARENTS FROM PFAM INNER JOIN ',@DM,' ON PFAM.PFAM_ID=',@DM,'.DOMAIN;');

PREPARE stmtDM FROM @sDM;
EXECUTE stmtDM;

 
 

END//
DELIMITER ;



DELIMITER //
DROP PROCEDURE IF EXISTS `4SET_DM_e_`//
CREATE PROCEDURE `4SET_DM_e_` (IN s_id VARCHAR(64))
BEGIN

SET @DM = CONCAT('DM_e_',s_id);
SET @sDM = CONCAT('SELECT IPR,NAME,PARENTS FROM PFAM INNER JOIN ',@DM,' ON PFAM.PFAM_ID=',@DM,'.DOMAIN;');

PREPARE stmtDM FROM @sDM;
EXECUTE stmtDM;

 
 

END//
DELIMITER ;



DELIMITER //
DROP PROCEDURE IF EXISTS `4SET_DM_f_`//
CREATE PROCEDURE `4SET_DM_f_` (IN s_id VARCHAR(64))
BEGIN

SET @DM = CONCAT('DM_f_',s_id);
SET @sDM = CONCAT('SELECT IPR,NAME,PARENTS FROM PFAM INNER JOIN ',@DM,' ON PFAM.PFAM_ID=',@DM,'.DOMAIN;');

PREPARE stmtDM FROM @sDM;
EXECUTE stmtDM;

 
 

END//
DELIMITER ;


DELIMITER //
DROP PROCEDURE IF EXISTS `4SET_DM_g_`//
CREATE PROCEDURE `4SET_DM_g_` (IN s_id VARCHAR(64))
BEGIN

SET @DM = CONCAT('DM_g_',s_id);
SET @sDM = CONCAT('SELECT IPR,NAME,PARENTS FROM PFAM INNER JOIN ',@DM,' ON PFAM.PFAM_ID=',@DM,'.DOMAIN;');

PREPARE stmtDM FROM @sDM;
EXECUTE stmtDM;

 
 

END//
DELIMITER ;



DELIMITER //
DROP PROCEDURE IF EXISTS `4SET_DM_h_`//
CREATE PROCEDURE `4SET_DM_h_` (IN s_id VARCHAR(64))
BEGIN

SET @DM = CONCAT('DM_h_',s_id);
SET @sDM = CONCAT('SELECT IPR,NAME,PARENTS FROM PFAM INNER JOIN ',@DM,' ON PFAM.PFAM_ID=',@DM,'.DOMAIN;');

PREPARE stmtDM FROM @sDM;
EXECUTE stmtDM;

 
 

END//
DELIMITER ;


DELIMITER //
DROP PROCEDURE IF EXISTS `4SET_DM_i_`//
CREATE PROCEDURE `4SET_DM_i_` (IN s_id VARCHAR(64))
BEGIN

SET @DM = CONCAT('DM_i_',s_id);
SET @sDM = CONCAT('SELECT IPR,NAME,PARENTS FROM PFAM INNER JOIN ',@DM,' ON PFAM.PFAM_ID=',@DM,'.DOMAIN;');

PREPARE stmtDM FROM @sDM;
EXECUTE stmtDM;

 
 

END//
DELIMITER ;


DELIMITER //
DROP PROCEDURE IF EXISTS `4SET_DM_j_`//
CREATE PROCEDURE `4SET_DM_j_` (IN s_id VARCHAR(64))
BEGIN

SET @DM = CONCAT('DM_j_',s_id);
SET @sDM = CONCAT('SELECT IPR,NAME,PARENTS FROM PFAM INNER JOIN ',@DM,' ON PFAM.PFAM_ID=',@DM,'.DOMAIN;');

PREPARE stmtDM FROM @sDM;
EXECUTE stmtDM;

 
 

END//
DELIMITER ;


DELIMITER //
DROP PROCEDURE IF EXISTS `4SET_DM_k_`//
CREATE PROCEDURE `4SET_DM_k_` (IN s_id VARCHAR(64))
BEGIN

SET @DM = CONCAT('DM_k_',s_id);
SET @sDM = CONCAT('SELECT IPR,NAME,PARENTS FROM PFAM INNER JOIN ',@DM,' ON PFAM.PFAM_ID=',@DM,'.DOMAIN;');

PREPARE stmtDM FROM @sDM;
EXECUTE stmtDM;

 
 

END//
DELIMITER ;


DELIMITER //
DROP PROCEDURE IF EXISTS `4SET_DM_l_`//
CREATE PROCEDURE `4SET_DM_l_` (IN s_id VARCHAR(64))
BEGIN

SET @DM = CONCAT('DM_l_',s_id);
SET @sDM = CONCAT('SELECT IPR,NAME,PARENTS FROM PFAM INNER JOIN ',@DM,' ON PFAM.PFAM_ID=',@DM,'.DOMAIN;');

PREPARE stmtDM FROM @sDM;
EXECUTE stmtDM;

 
 

END//
DELIMITER ;


DELIMITER //
DROP PROCEDURE IF EXISTS `4SET_DM_m_`//
CREATE PROCEDURE `4SET_DM_m_` (IN s_id VARCHAR(64))
BEGIN

SET @DM = CONCAT('DM_m_',s_id);
SET @sDM = CONCAT('SELECT IPR,NAME,PARENTS FROM PFAM INNER JOIN ',@DM,' ON PFAM.PFAM_ID=',@DM,'.DOMAIN;');

PREPARE stmtDM FROM @sDM;
EXECUTE stmtDM;

 
 

END//
DELIMITER ;


DELIMITER //
DROP PROCEDURE IF EXISTS `4SET_DM_n_`//
CREATE PROCEDURE `4SET_DM_n_` (IN s_id VARCHAR(64))
BEGIN

SET @DM = CONCAT('DM_n_',s_id);
SET @sDM = CONCAT('SELECT IPR,NAME,PARENTS FROM PFAM INNER JOIN ',@DM,' ON PFAM.PFAM_ID=',@DM,'.DOMAIN;');

PREPARE stmtDM FROM @sDM;
EXECUTE stmtDM;

 
 

END//
DELIMITER ;


DELIMITER //
DROP PROCEDURE IF EXISTS `4SET_DM_o_`//
CREATE PROCEDURE `4SET_DM_o_` (IN s_id VARCHAR(64))
BEGIN

SET @DM = CONCAT('DM_o_',s_id);
SET @sDM = CONCAT('SELECT IPR,NAME,PARENTS FROM PFAM INNER JOIN ',@DM,' ON PFAM.PFAM_ID=',@DM,'.DOMAIN;');

PREPARE stmtDM FROM @sDM;
EXECUTE stmtDM;

 
 

END//
DELIMITER ;




DELIMITER //
DROP PROCEDURE IF EXISTS `4SET_GM_a_`//
CREATE PROCEDURE `4SET_GM_a_` (IN s_id VARCHAR(64))
BEGIN

SET @GM = CONCAT('GM_a_',s_id);
SET @sGM = CONCAT('SELECT GO_ID,NAME,PARENTS,DEPTH FROM MOLFUNC INNER JOIN ',@GM,' ON MOLFUNC.GO_MOLFUNC=',@GM,'.ONTOLOGY;');

PREPARE stmtGM FROM @sGM;
EXECUTE stmtGM;

 
 

END//
DELIMITER ;




DELIMITER //
DROP PROCEDURE IF EXISTS `4SET_GM_b_`//
CREATE PROCEDURE `4SET_GM_b_` (IN s_id VARCHAR(64))
BEGIN

SET @GM = CONCAT('GM_b_',s_id);
SET @sGM = CONCAT('SELECT GO_ID,NAME,PARENTS,DEPTH FROM MOLFUNC INNER JOIN ',@GM,' ON MOLFUNC.GO_MOLFUNC=',@GM,'.ONTOLOGY;');

PREPARE stmtGM FROM @sGM;
EXECUTE stmtGM;

 
 

END//
DELIMITER ;



DELIMITER //
DROP PROCEDURE IF EXISTS `4SET_GM_c_`//
CREATE PROCEDURE `4SET_GM_c_` (IN s_id VARCHAR(64))
BEGIN

SET @GM = CONCAT('GM_c_',s_id);
SET @sGM = CONCAT('SELECT GO_ID,NAME,PARENTS,DEPTH FROM MOLFUNC INNER JOIN ',@GM,' ON MOLFUNC.GO_MOLFUNC=',@GM,'.ONTOLOGY;');

PREPARE stmtGM FROM @sGM;
EXECUTE stmtGM;

 
 

END//
DELIMITER ;


DELIMITER //
DROP PROCEDURE IF EXISTS `4SET_GM_d_`//
CREATE PROCEDURE `4SET_GM_d_` (IN s_id VARCHAR(64))
BEGIN

SET @GM = CONCAT('GM_d_',s_id);
SET @sGM = CONCAT('SELECT GO_ID,NAME,PARENTS,DEPTH FROM MOLFUNC INNER JOIN ',@GM,' ON MOLFUNC.GO_MOLFUNC=',@GM,'.ONTOLOGY;');

PREPARE stmtGM FROM @sGM;
EXECUTE stmtGM;

 
 

END//
DELIMITER ;


DELIMITER //
DROP PROCEDURE IF EXISTS `4SET_GM_e_`//
CREATE PROCEDURE `4SET_GM_e_` (IN s_id VARCHAR(64))
BEGIN

SET @GM = CONCAT('GM_e_',s_id);
SET @sGM = CONCAT('SELECT GO_ID,NAME,PARENTS,DEPTH FROM MOLFUNC INNER JOIN ',@GM,' ON MOLFUNC.GO_MOLFUNC=',@GM,'.ONTOLOGY;');

PREPARE stmtGM FROM @sGM;
EXECUTE stmtGM;

 
 

END//
DELIMITER ;



DELIMITER //
DROP PROCEDURE IF EXISTS `4SET_GM_f_`//
CREATE PROCEDURE `4SET_GM_f_` (IN s_id VARCHAR(64))
BEGIN

SET @GM = CONCAT('GM_f_',s_id);
SET @sGM = CONCAT('SELECT GO_ID,NAME,PARENTS,DEPTH FROM MOLFUNC INNER JOIN ',@GM,' ON MOLFUNC.GO_MOLFUNC=',@GM,'.ONTOLOGY;');

PREPARE stmtGM FROM @sGM;
EXECUTE stmtGM;

 
 

END//
DELIMITER ;


DELIMITER //
DROP PROCEDURE IF EXISTS `4SET_GM_g_`//
CREATE PROCEDURE `4SET_GM_g_` (IN s_id VARCHAR(64))
BEGIN

SET @GM = CONCAT('GM_g_',s_id);
SET @sGM = CONCAT('SELECT GO_ID,NAME,PARENTS,DEPTH FROM MOLFUNC INNER JOIN ',@GM,' ON MOLFUNC.GO_MOLFUNC=',@GM,'.ONTOLOGY;');

PREPARE stmtGM FROM @sGM;
EXECUTE stmtGM;

 
 

END//
DELIMITER ;


DELIMITER //
DROP PROCEDURE IF EXISTS `4SET_GM_h_`//
CREATE PROCEDURE `4SET_GM_h_` (IN s_id VARCHAR(64))
BEGIN

SET @GM = CONCAT('GM_h_',s_id);
SET @sGM = CONCAT('SELECT GO_ID,NAME,PARENTS,DEPTH FROM MOLFUNC INNER JOIN ',@GM,' ON MOLFUNC.GO_MOLFUNC=',@GM,'.ONTOLOGY;');

PREPARE stmtGM FROM @sGM;
EXECUTE stmtGM;

 
 

END//
DELIMITER ;


DELIMITER //
DROP PROCEDURE IF EXISTS `4SET_GM_i_`//
CREATE PROCEDURE `4SET_GM_i_` (IN s_id VARCHAR(64))
BEGIN

SET @GM = CONCAT('GM_i_',s_id);
SET @sGM = CONCAT('SELECT GO_ID,NAME,PARENTS,DEPTH FROM MOLFUNC INNER JOIN ',@GM,' ON MOLFUNC.GO_MOLFUNC=',@GM,'.ONTOLOGY;');

PREPARE stmtGM FROM @sGM;
EXECUTE stmtGM;

 
 

END//
DELIMITER ;


DELIMITER //
DROP PROCEDURE IF EXISTS `4SET_GM_j_`//
CREATE PROCEDURE `4SET_GM_j_` (IN s_id VARCHAR(64))
BEGIN

SET @GM = CONCAT('GM_j_',s_id);
SET @sGM = CONCAT('SELECT GO_ID,NAME,PARENTS,DEPTH FROM MOLFUNC INNER JOIN ',@GM,' ON MOLFUNC.GO_MOLFUNC=',@GM,'.ONTOLOGY;');

PREPARE stmtGM FROM @sGM;
EXECUTE stmtGM;

 
 

END//
DELIMITER ;


DELIMITER //
DROP PROCEDURE IF EXISTS `4SET_GM_k_`//
CREATE PROCEDURE `4SET_GM_k_` (IN s_id VARCHAR(64))
BEGIN

SET @GM = CONCAT('GM_k_',s_id);
SET @sGM = CONCAT('SELECT GO_ID,NAME,PARENTS,DEPTH FROM MOLFUNC INNER JOIN ',@GM,' ON MOLFUNC.GO_MOLFUNC=',@GM,'.ONTOLOGY;');

PREPARE stmtGM FROM @sGM;
EXECUTE stmtGM;

 
 

END//
DELIMITER ;


DELIMITER //
DROP PROCEDURE IF EXISTS `4SET_GM_l_`//
CREATE PROCEDURE `4SET_GM_l_` (IN s_id VARCHAR(64))
BEGIN

SET @GM = CONCAT('GM_l_',s_id);
SET @sGM = CONCAT('SELECT GO_ID,NAME,PARENTS,DEPTH FROM MOLFUNC INNER JOIN ',@GM,' ON MOLFUNC.GO_MOLFUNC=',@GM,'.ONTOLOGY;');

PREPARE stmtGM FROM @sGM;
EXECUTE stmtGM;

 
 

END//
DELIMITER ;


DELIMITER //
DROP PROCEDURE IF EXISTS `4SET_GM_m_`//
CREATE PROCEDURE `4SET_GM_m_` (IN s_id VARCHAR(64))
BEGIN

SET @GM = CONCAT('GM_m_',s_id);
SET @sGM = CONCAT('SELECT GO_ID,NAME,PARENTS,DEPTH FROM MOLFUNC INNER JOIN ',@GM,' ON MOLFUNC.GO_MOLFUNC=',@GM,'.ONTOLOGY;');

PREPARE stmtGM FROM @sGM;
EXECUTE stmtGM;

 
 

END//
DELIMITER ;


DELIMITER //
DROP PROCEDURE IF EXISTS `4SET_GM_n_`//
CREATE PROCEDURE `4SET_GM_n_` (IN s_id VARCHAR(64))
BEGIN

SET @GM = CONCAT('GM_n_',s_id);
SET @sGM = CONCAT('SELECT GO_ID,NAME,PARENTS,DEPTH FROM MOLFUNC INNER JOIN ',@GM,' ON MOLFUNC.GO_MOLFUNC=',@GM,'.ONTOLOGY;');

PREPARE stmtGM FROM @sGM;
EXECUTE stmtGM;

 
 

END//
DELIMITER ;


DELIMITER //
DROP PROCEDURE IF EXISTS `4SET_GM_o_`//
CREATE PROCEDURE `4SET_GM_o_` (IN s_id VARCHAR(64))
BEGIN

SET @GM = CONCAT('GM_o_',s_id);
SET @sGM = CONCAT('SELECT GO_ID,NAME,PARENTS,DEPTH FROM MOLFUNC INNER JOIN ',@GM,' ON MOLFUNC.GO_MOLFUNC=',@GM,'.ONTOLOGY;');

PREPARE stmtGM FROM @sGM;
EXECUTE stmtGM;

 
 

END//
DELIMITER ;



DELIMITER //
DROP PROCEDURE IF EXISTS `4SET_GB_a_`//
CREATE PROCEDURE `4SET_GB_a_` (IN s_id VARCHAR(64))
BEGIN

SET @GB = CONCAT('GB_a_',s_id);
SET @sGB = CONCAT('SELECT GO_ID,NAME,PARENTS,DEPTH FROM BIOPROC INNER JOIN ',@GB,' ON BIOPROC.GO_BIOPROC=',@GB,'.ONTOLOGY;');

PREPARE stmtGB FROM @sGB;
EXECUTE stmtGB;

 
 

END//
DELIMITER ;



DELIMITER //
DROP PROCEDURE IF EXISTS `4SET_GB_b_`//
CREATE PROCEDURE `4SET_GB_b_` (IN s_id VARCHAR(64))
BEGIN

SET @GB = CONCAT('GB_b_',s_id);
SET @sGB = CONCAT('SELECT GO_ID,NAME,PARENTS,DEPTH FROM BIOPROC INNER JOIN ',@GB,' ON BIOPROC.GO_BIOPROC=',@GB,'.ONTOLOGY;');

PREPARE stmtGB FROM @sGB;
EXECUTE stmtGB;

 
 

END//
DELIMITER ;



DELIMITER //
DROP PROCEDURE IF EXISTS `4SET_GB_c_`//
CREATE PROCEDURE `4SET_GB_c_` (IN s_id VARCHAR(64))
BEGIN

SET @GB = CONCAT('GB_c_',s_id);
SET @sGB = CONCAT('SELECT GO_ID,NAME,PARENTS,DEPTH FROM BIOPROC INNER JOIN ',@GB,' ON BIOPROC.GO_BIOPROC=',@GB,'.ONTOLOGY;');

PREPARE stmtGB FROM @sGB;
EXECUTE stmtGB;

 
 

END//
DELIMITER ;


DELIMITER //
DROP PROCEDURE IF EXISTS `4SET_GB_d_`//
CREATE PROCEDURE `4SET_GB_d_` (IN s_id VARCHAR(64))
BEGIN

SET @GB = CONCAT('GB_d_',s_id);
SET @sGB = CONCAT('SELECT GO_ID,NAME,PARENTS,DEPTH FROM BIOPROC INNER JOIN ',@GB,' ON BIOPROC.GO_BIOPROC=',@GB,'.ONTOLOGY;');

PREPARE stmtGB FROM @sGB;
EXECUTE stmtGB;

 
 

END//
DELIMITER ;


DELIMITER //
DROP PROCEDURE IF EXISTS `4SET_GB_e_`//
CREATE PROCEDURE `4SET_GB_e_` (IN s_id VARCHAR(64))
BEGIN

SET @GB = CONCAT('GB_e_',s_id);
SET @sGB = CONCAT('SELECT GO_ID,NAME,PARENTS,DEPTH FROM BIOPROC INNER JOIN ',@GB,' ON BIOPROC.GO_BIOPROC=',@GB,'.ONTOLOGY;');

PREPARE stmtGB FROM @sGB;
EXECUTE stmtGB;

 
 

END//
DELIMITER ;


DELIMITER //
DROP PROCEDURE IF EXISTS `4SET_GB_f_`//
CREATE PROCEDURE `4SET_GB_f_` (IN s_id VARCHAR(64))
BEGIN

SET @GB = CONCAT('GB_f_',s_id);
SET @sGB = CONCAT('SELECT GO_ID,NAME,PARENTS,DEPTH FROM BIOPROC INNER JOIN ',@GB,' ON BIOPROC.GO_BIOPROC=',@GB,'.ONTOLOGY;');

PREPARE stmtGB FROM @sGB;
EXECUTE stmtGB;

 
 

END//
DELIMITER ;


DELIMITER //
DROP PROCEDURE IF EXISTS `4SET_GB_g_`//
CREATE PROCEDURE `4SET_GB_g_` (IN s_id VARCHAR(64))
BEGIN

SET @GB = CONCAT('GB_g_',s_id);
SET @sGB = CONCAT('SELECT GO_ID,NAME,PARENTS,DEPTH FROM BIOPROC INNER JOIN ',@GB,' ON BIOPROC.GO_BIOPROC=',@GB,'.ONTOLOGY;');

PREPARE stmtGB FROM @sGB;
EXECUTE stmtGB;

 
 

END//
DELIMITER ;


DELIMITER //
DROP PROCEDURE IF EXISTS `4SET_GB_h_`//
CREATE PROCEDURE `4SET_GB_h_` (IN s_id VARCHAR(64))
BEGIN

SET @GB = CONCAT('GB_h_',s_id);
SET @sGB = CONCAT('SELECT GO_ID,NAME,PARENTS,DEPTH FROM BIOPROC INNER JOIN ',@GB,' ON BIOPROC.GO_BIOPROC=',@GB,'.ONTOLOGY;');

PREPARE stmtGB FROM @sGB;
EXECUTE stmtGB;

 
 

END//
DELIMITER ;


DELIMITER //
DROP PROCEDURE IF EXISTS `4SET_GB_i_`//
CREATE PROCEDURE `4SET_GB_i_` (IN s_id VARCHAR(64))
BEGIN

SET @GB = CONCAT('GB_i_',s_id);
SET @sGB = CONCAT('SELECT GO_ID,NAME,PARENTS,DEPTH FROM BIOPROC INNER JOIN ',@GB,' ON BIOPROC.GO_BIOPROC=',@GB,'.ONTOLOGY;');

PREPARE stmtGB FROM @sGB;
EXECUTE stmtGB;

 
 

END//
DELIMITER ;


DELIMITER //
DROP PROCEDURE IF EXISTS `4SET_GB_j_`//
CREATE PROCEDURE `4SET_GB_j_` (IN s_id VARCHAR(64))
BEGIN

SET @GB = CONCAT('GB_j_',s_id);
SET @sGB = CONCAT('SELECT GO_ID,NAME,PARENTS,DEPTH FROM BIOPROC INNER JOIN ',@GB,' ON BIOPROC.GO_BIOPROC=',@GB,'.ONTOLOGY;');

PREPARE stmtGB FROM @sGB;
EXECUTE stmtGB;

 
 

END//
DELIMITER ;


DELIMITER //
DROP PROCEDURE IF EXISTS `4SET_GB_k_`//
CREATE PROCEDURE `4SET_GB_k_` (IN s_id VARCHAR(64))
BEGIN

SET @GB = CONCAT('GB_k_',s_id);
SET @sGB = CONCAT('SELECT GO_ID,NAME,PARENTS,DEPTH FROM BIOPROC INNER JOIN ',@GB,' ON BIOPROC.GO_BIOPROC=',@GB,'.ONTOLOGY;');

PREPARE stmtGB FROM @sGB;
EXECUTE stmtGB;

 
 

END//
DELIMITER ;


DELIMITER //
DROP PROCEDURE IF EXISTS `4SET_GB_l_`//
CREATE PROCEDURE `4SET_GB_l_` (IN s_id VARCHAR(64))
BEGIN

SET @GB = CONCAT('GB_l_',s_id);
SET @sGB = CONCAT('SELECT GO_ID,NAME,PARENTS,DEPTH FROM BIOPROC INNER JOIN ',@GB,' ON BIOPROC.GO_BIOPROC=',@GB,'.ONTOLOGY;');

PREPARE stmtGB FROM @sGB;
EXECUTE stmtGB;

 
 

END//
DELIMITER ;


DELIMITER //
DROP PROCEDURE IF EXISTS `4SET_GB_m_`//
CREATE PROCEDURE `4SET_GB_m_` (IN s_id VARCHAR(64))
BEGIN

SET @GB = CONCAT('GB_m_',s_id);
SET @sGB = CONCAT('SELECT GO_ID,NAME,PARENTS,DEPTH FROM BIOPROC INNER JOIN ',@GB,' ON BIOPROC.GO_BIOPROC=',@GB,'.ONTOLOGY;');

PREPARE stmtGB FROM @sGB;
EXECUTE stmtGB;

 
 

END//
DELIMITER ;


DELIMITER //
DROP PROCEDURE IF EXISTS `4SET_GB_n_`//
CREATE PROCEDURE `4SET_GB_n_` (IN s_id VARCHAR(64))
BEGIN

SET @GB = CONCAT('GB_n_',s_id);
SET @sGB = CONCAT('SELECT GO_ID,NAME,PARENTS,DEPTH FROM BIOPROC INNER JOIN ',@GB,' ON BIOPROC.GO_BIOPROC=',@GB,'.ONTOLOGY;');

PREPARE stmtGB FROM @sGB;
EXECUTE stmtGB;

 
 

END//
DELIMITER ;


DELIMITER //
DROP PROCEDURE IF EXISTS `4SET_GB_o_`//
CREATE PROCEDURE `4SET_GB_o_` (IN s_id VARCHAR(64))
BEGIN

SET @GB = CONCAT('GB_o_',s_id);
SET @sGB = CONCAT('SELECT GO_ID,NAME,PARENTS,DEPTH FROM BIOPROC INNER JOIN ',@GB,' ON BIOPROC.GO_BIOPROC=',@GB,'.ONTOLOGY;');

PREPARE stmtGB FROM @sGB;
EXECUTE stmtGB;

 
 

END//
DELIMITER ;



