package utils;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.DriverManagerDataSource;

public class JdbcHelper {
    private static final JdbcTemplate jdbcTemplate;

    static {
        DriverManagerDataSource dataSource = new DriverManagerDataSource();
        dataSource.setDriverClassName("org.postgresql.Driver");
        dataSource.setUrl("jdbc:postgresql://localhost:5432/your_db_name");
        dataSource.setUsername("postgres");
        dataSource.setPassword("password");
        jdbcTemplate = new JdbcTemplate(dataSource);
    }

    public static boolean isUserExists(String username) {
        Integer count = jdbcTemplate.queryForObject(
                "SELECT count(*) FROM users WHERE username = ?", Integer.class, username);
        return count != null && count > 0;
    }
}