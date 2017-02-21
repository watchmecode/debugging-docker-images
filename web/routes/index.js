var express = require('express');
var router = express.Router();

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('index', { title: 'Docker Express IS THE COOLEST' });
});

router.get("/:name", function(req, res, next){ 
  var pageName = "pages/" + req.params.name;
  res.render(pageName);
});

module.exports = router;
