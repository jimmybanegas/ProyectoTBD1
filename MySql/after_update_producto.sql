CREATE DEFINER=`root`@`localhost` TRIGGER `farmacia`.`productos_AFTER_UPDATE` AFTER UPDATE ON `productos` FOR EACH ROW
    BEGIN
      DECLARE e_o_s varchar(1);
      
      if(new.existencia < old.existencia) then
		set e_o_s = 'S';
      else
		set e_o_s = 'E';
      END IF;
      
      IF(NEW.EXISTENCIA <> OLD.EXISTENCIA) 
      then
		CALL sp_ins_kardex(abs(new.existencia-old.existencia),new.costo,old.existencia,
          new.existencia,now(),'JIMMY',OLD.precio_consumi,new.cod_prod,e_o_s);
      END IF;
      
    END