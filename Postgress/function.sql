-- Table: usuario.usuario

-- DROP TABLE usuario.usuario;

CREATE OR REPLACE FUNCTION usuario.f_login(
	_user_name text,
	_clave text)
	RETURNS SETOF usuario.v_login
	LANGUAGE 'plpgsql'
	
	COST 100
	VOLATILE
	ROWS 1000
AS $BODY$
	BEGIN
		RETURN QUERY
		SELECT
			uu.id AS user_id,
			uu.nombre || ' ' || uu.apellido AS nombre,
			ur.id AS rol_id,
			ur.nombre AS rol_nombre
		
		FROM 
			usuario.usuario uu JOIN usuario.rol ur ON ur.id = uu.rol_id
		WHERE
			uu.user_name = _user_name
		AND
			uu.clave = _clave;
		END;
	$BODY$;
	
	ALTER FUNCTION usuario.f_login(text, text)
			
	OWNER TO postgress;