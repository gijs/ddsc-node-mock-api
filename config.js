var config = {};


config.pg = {};
config.pg.conString = "tcp://ddsc:ddsc@localhost/ddsc";

config.mongodb = {};
config.mongodb.db = "ddsc";
config.mongodb.hostname = "localhost";
config.mongodb.conn_string = "mongodb://localhost/ddsc";
config.mongodb.safe = true;
config.mongodb.secret = "SoMe L1XaRd AtE <ah Cat22";
config.mongodb.auto_reconnect = true;

module.exports = config;