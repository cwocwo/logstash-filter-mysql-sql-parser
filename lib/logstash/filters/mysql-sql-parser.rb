# encoding: utf-8
require "logstash/filters/base"
require "logstash/namespace"
require "./jars/druid-1.0.18.jar"

java_import java.lang.StringBuilder
java_import com.alibaba.druid.util.JdbcConstants
java_import com.alibaba.druid.sql.SQLUtils
java_import com.alibaba.druid.sql.dialect.mysql.visitor.MySqlParameterizedOutputVisitor

# This  filter will replace the contents of the default 
# message field with whatever you specify in the configuration.
#
# It is only intended to be used as an .
class LogStash::Filters::MysqlSqlParser < LogStash::Filters::Base

  # Setting the config_name here is required. This is how you
  # configure this filter from your Logstash config.
  #
  # filter {
  #    {
  #     message => "My message..."
  #   }
  # }
  #
  config_name "mysql_sql_parser"
  
  # Replace the message with this value.
  config :pretty_format, :validate => :boolean, :default => false
  config :to_lowercase, :validate => :boolean, :default => true
  

  public
  def register
    # Add instance variables 
  end # def register

  public
  def filter(event)
	sql = event.get("sql")
	db_type = JdbcConstants::MYSQL
	stmts = SQLUtils.parseStatements(sql, db_type)
	stmts.each {|i| 
		parsed_sql = StringBuilder.new(); 
		visitor = MySqlParameterizedOutputVisitor.new(parsed_sql);
		visitor.setPrettyFormat(@pretty_format);
		i.accept(visitor);
		event.set("sql_tpl", @to_lowercase ? parsed_sql.to_s.downcase : parsed_sql.to_s)
	}
    # filter_matched should go in the last line of our successful code
    filter_matched(event)
  end # def filter
end # class LogStash::Filters::MysqlSqlParser
