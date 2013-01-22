// Define schemas
var FilterSchema = new Schema({
  name: {
    type: String,
    required: true
  },
  description: {
    type: String,
    required: false
  },
  _id: {
      type: mongoose.Schema.ObjectId
  }
});

var LocationSchema = new Schema({
    name: {
        type: String,
        required: true
    },
    geo: {
        type: [Number], 
        index: '2d'
    },
    description: {
        type: String,
        required: false
    },
    date: {
        type: Date,
        default: Date.now
    },
    _id: {
        type: mongoose.Schema.ObjectId
    }
});

var ParameterSchema = new Schema({
    name: {
        type: String,
        required: true
    },    
    description: {
        type: String,
        required: false
    },
    date: {
        type: Date,
        default: Date.now
    },
    _id: {
        type: mongoose.Schema.ObjectId
    }
});

var Filter = mongoose.model('Filter', FilterSchema);
var Location = mongoose.model('Location', LocationSchema);
var Parameter = mongoose.model('Parameter', ParameterSchema);