DROP procedure person_insert;

create procedure person_insert(
       p_persnr CHAR(12),
       p_namn VARCHAR)
	RETURNING
	INTEGER;	
-- Felrutin
DEFINE sql_err integer;
DEFINE isam_err integer;
DEFINE error_info char(70);

ON exception set sql_err, isam_err, error_info
	call error_log(sql_err, isam_err, error_info,'datakalla_minnesgudstjanstins',5001);
	return       5001; -- SQL fel i datakalla_minnesgudstjanst_insert.	
	raise exception sql_err, isam_err, error_info;
END exception;

SET ISOLATION TO DIRTY READ;
SET LOCK MODE TO WAIT 10;

LET p_recordnr=0;

 -- FOREACH

--	EXECUTE PROCEDURE datakalla_anvandarebehorigheter(p_rapportbestallningsid,
--       		p_enhetsid)
--	INTO    p_svar,			
--		p_enhetsid,	          
--		p_enhetsnamn,	  
--		p_persnr,	  
--		p_fnamn,	  
--		p_anamn,	  
--		p_enamn,	  
--		p_mnamn,	  
--		p_tilltalsnamn,	  
--		p_coadress, 	  
--		p_adress1, 	  
--		p_adress2, 	  
--		p_adress3, 	  
--		p_postnummer, 	  
--		p_postort, 	  
--		p_land, 	  
--		p_adresstyp,	  
--		p_userid,	  
--		p_pwdate,	  
--		p_andraddatum,	  
--	    p_andradav,	  
--		p_skapaddatum,	  
--		p_skapadav,	  
--		p_beh_enhetsid,   
--		p_kortnamn,	  
-- 		p_beh_enhetnamn,  
--		p_anvkatid,	  
--		p_anvkatnamn,
--		p_enhetsstatus	

--		
--	LET p_recordnr = p_recordnr + 1;
	
--	IF (p_svar !=0) THEN
--		RETURN p_svar;
--	END IF
		
	INSERT INTO tperson(persnr, namn)	                
	VALUES (persnr, namn);
		
-- END FOREACH;

--IF (p_recordnr = 0) THEN
--	RETURN 5002; --Ingen träff i datakalla_anvandarebehorigheter_insert	
--END IF;

RETURN	p_svar;	


END PROCEDURE;
