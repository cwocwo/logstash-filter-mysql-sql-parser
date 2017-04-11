# encoding: utf-8
require_relative '../spec_helper'
require "logstash/filters/mysql-sql-parser"

describe LogStash::Filters::MysqlSqlParser do
  describe "Set to Hello World" do
    let(:config) do <<-CONFIG
      filter {
        mysql_sql_parser {
          message => "Hello World"
        }
      }
    CONFIG
    end

    sample("message" => "some text") do
      expect(subject).to include("message")
      expect(subject.get('message')).to eq('Hello World')
    end
  end
end
