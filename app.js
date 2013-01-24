
/**
 * Module dependencies.
 */
var config = require('./config');

var express = require('express')
  , routes = require('./routes')
  , user = require('./routes/user')
  , http = require('http')
  , pg = require('pg')
  , path = require('path')
  , moment = require('moment');


var app = express();

app.configure(function(){
  app.set('port', process.env.PORT || 3000);
  app.set('views', __dirname + '/views');
  app.set('view engine', 'jade');
  app.use(express.favicon());
  app.use(express.logger('dev'));
  app.use(express.bodyParser());
  app.use(function(req, res, next) {
    res.header("Access-Control-Allow-Origin", "*");
    res.header("Access-Control-Allow-Headers", "X-Requested-With");
    next();
  });
  app.use(express.compress());
  app.use(express.methodOverride());
  app.use(app.router);
  app.use(express.static(path.join(__dirname, 'public')));
});

app.configure('development', function(){
  app.use(express.errorHandler());
});

var client = new pg.Client(config.pg.conString);
client.connect();

app.get('/', routes.index);

// API definitions
app.get('/api/v1/filters', {},
function(req, res){

  var parameters, locations;
  var sql = "SELECT * FROM filter";


  // TODO: This needs a little rethinking: what if both parameters and locations are GET'ed? 
  // Better build the SQL query a bit more dynamically here:
  if (req.query.parameters) {
    parameters = req.query.parameters.split(",");
  }
  if (req.query.locations) {
    locations = req.query.locations.split(",");
    sql = "SELECT *, ST_AsGeoJSON(location) as location_geojson \
          FROM filter AS f \
          INNER JOIN filter_location AS fl \
          ON fl.filter_id = f.filter_id \
          WHERE fl.filter_id = any ( array["+locations+"])";
  }

  console.log('Parameters: ', parameters);
  console.log('Locations: ', locations);
  
  var query = client.query(sql, function(err, result) {
    if(result) {
      var json = result.rows;
      console.log(json);
      res.json(json);
    } else {
      res.json({});
    }
  });
  query.on('error', function(error) {
    console.log(error);
  });
});

app.get('/api/v1/filters/:filter_id', {},
function(req, res){

  var sql = "SELECT * FROM filter WHERE filter_id = " + req.params.filter_id;
  var query = client.query(sql, function(err, result) {
    if(result) {
      var json = result.rows;
      console.log(json);
      res.json(json);
    } else {
      res.json({});
    }
  });
  query.on('error', function(error) {
    console.log(error);
  });
});




app.get('/api/v1/locations', {},
function(req, res){

  var parameters, filters;
  var sql = "SELECT *, ST_AsGeoJSON(location) as location_geojson FROM location";

  if (req.query.filters) {
    filters = req.query.filters.split(",");
    sql = "SELECT *, ST_AsGeoJSON(location) as location_geojson \
          FROM location AS l \
          INNER JOIN filter_location AS fl \
          ON fl.location_id = l.location_id \
          WHERE fl.filter_id = any ( array["+filters+"])";
  }
  if (req.query.parameters) {
    parameters = req.query.parameters.split(",");
    sql = "SELECT *, ST_AsGeoJSON(location) as location_geojson \
          FROM location AS l \
          INNER JOIN location_parameter AS lp \
          ON lp.location_id = l.location_id \
          WHERE lp.location_id = any ( array["+parameters+"])";
  }

  // console.log(filters);
  // console.log(parameters);
  
  var query = client.query(sql, function(err, result) {
    if(result) {
      var json = result.rows;
      console.log(json);
      res.json(json);
    } else {
      res.json({});
    }
  });
  query.on('error', function(error) {
    console.log(error);
  });
});

app.get('/api/v1/locations/:location_id', {},
function(req, res){

  var sql = "SELECT *, ST_AsGeoJSON(location) as location_geojson FROM location WHERE location_id = " + req.params.location_id;
  var query = client.query(sql, function(err, result) {
    if(result) {
      var json = result.rows;
      console.log(json);
      res.json(json);
    } else {
      res.json({});
    }
  });
  query.on('error', function(error) {
    console.log(error);
  });
});









app.get('/api/v1/parameters', {},
function(req, res){

  // TODO: Add the join sql's

  var filters, locations;
  var sql = "SELECT * FROM parameter";

  if (req.query.filters) {
    filters = req.query.filters.split(",");
  }
  if (req.query.locations) {
    locations = req.query.locations.split(",");
    sql = "SELECT * \
          FROM parameter AS p \
          INNER JOIN location_parameter AS lp \
          ON lp.location_id = p.parameter_id \
          WHERE lp.location_id = any ( array["+locations+"])";    
  }

  // console.log(filters);
  // console.log(locations);
  
  var query = client.query(sql, function(err, result) {
    if(result) {
      var json = result.rows;
      console.log(json);
      res.json(json);
    } else {
      res.json({});
    }
  });
  query.on('error', function(error) {
    console.log(error);
  });
});


app.get('/api/v1/parameters/:parameter_id', {},
function(req, res){

  var sql = "SELECT * FROM parameter WHERE parameter_id = " + req.params.parameter_id;
  var query = client.query(sql, function(err, result) {
    if(result) {
      var json = result.rows;
      console.log(json);
      res.json(json);
    } else {
      res.json({});
    }
  });
  query.on('error', function(error) {
    console.log(error);
  });
});


http.createServer(app).listen(app.get('port'), function(){
  console.log("Express server listening on port " + app.get('port'));
});


