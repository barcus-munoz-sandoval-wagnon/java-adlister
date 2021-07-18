package com.codeup.adlister.dao;
import com.codeup.adlister.models.Category;
import com.mysql.cj.jdbc.Driver;
import java.sql.*;


public class MySQLCategoriesDao implements Categories{
    private Connection connection;

    public MySQLCategoriesDao(Config config) {
        try {
            DriverManager.registerDriver(new Driver());
            connection = DriverManager.getConnection(
                    config.getUrl(),
                    config.getUser(),
                    config.getPassword()
            );
        } catch (SQLException e) {
            throw new RuntimeException("Error connecting to the database!", e);
        }
    }

   @Override
    public Category getOne(long id) {
        String sql = "SELECT * FROM categories WHERE id = ?;";
        try {
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setLong(1, id);
            ResultSet rs = stmt.executeQuery();
            rs.next();
            return extractCategory(rs);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return new Category();
    }

    @Override
    public Category findByCategoryId(Long id) {
        String query = "SELECT * FROM categories WHERE id = ? LIMIT 1";
        try {
            PreparedStatement stmt = connection.prepareStatement(query);
            stmt.setLong(1, id);
            return extractCategory(stmt.executeQuery());
        } catch (SQLException e) {
            throw new RuntimeException("Error finding a user by username", e);
        }
    }

    private Category extractCategory(ResultSet rs) throws SQLException {
        return new Category(
                rs.getLong("id"),
                rs.getLong("ad_id"),
                rs.getString("name")
        );
    }


}
