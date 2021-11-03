package com.csis3275.model_computingcooker;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class MenuRowMapper_computingcooker implements RowMapper<Menu_model>{

	@Override
	public Menu_model mapRow(ResultSet rs, int rowNum) throws SQLException {
		// TODO Auto-generated method stub
		Menu_model menu = new Menu_model();
		
		menu.setMenuID(rs.getInt("MenuID"));
		menu.setMenuTitle(rs.getString("MenuTitle"));
		menu.setDescription(rs.getString("Description"));
		;
		return menu;
	}

}
