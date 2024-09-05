package com.human.Handler;

import org.apache.ibatis.type.BaseTypeHandler;
import org.apache.ibatis.type.JdbcType;

import java.io.StringReader;
import java.sql.*;

public class ClobTypeHandler extends BaseTypeHandler<String> {

    @Override
    public void setNonNullParameter(PreparedStatement ps, int i, String parameter, JdbcType jdbcType) throws SQLException {
        StringReader reader = new StringReader(parameter);
        ps.setCharacterStream(i, reader, parameter.length());
    }

    @Override
    public String getNullableResult(ResultSet rs, String columnName) throws SQLException {
        Clob clob = rs.getClob(columnName);
        return clob != null ? clob.getSubString(1, (int) clob.length()) : null;
    }

    @Override
    public String getNullableResult(ResultSet rs, int columnIndex) throws SQLException {
        Clob clob = rs.getClob(columnIndex);
        return clob != null ? clob.getSubString(1, (int) clob.length()) : null;
    }

    @Override
    public String getNullableResult(CallableStatement cs, int columnIndex) throws SQLException {
        Clob clob = cs.getClob(columnIndex);
        return clob != null ? clob.getSubString(1, (int) clob.length()) : null;
    }
}

