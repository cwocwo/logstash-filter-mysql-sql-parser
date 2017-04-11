require "./lib/jars/druid-1.0.18.jar"

java_import java.lang.StringBuilder
java_import com.alibaba.druid.util.JdbcConstants
java_import com.alibaba.druid.sql.SQLUtils
java_import com.alibaba.druid.sql.dialect.mysql.visitor.MySqlParameterizedOutputVisitor


parse_sql=StringBuilder.new()
sql = "select this_.id as id92_0_,this_.card_id as card2_92_0_,this_.name as name92_0_ from druid_test this_ where id=1"
db_type = JdbcConstants::MYSQL
stmts = SQLUtils.parseStatements(sql, db_type)
stmts.each {|i| 
	parsed_sql = StringBuilder.new(); 
	visitor = MySqlParameterizedOutputVisitor.new(parsed_sql);
	visitor.setPrettyFormat(false);
	i.accept(visitor);
	puts parsed_sql.to_s
}




