var sample = require("sampleLib");

describe("do stuff", function(){
  
  describe("when thing happens", function(){
    var output;

    beforeEach(function(){
      output = sample.foo();
    });

    it("should do stuff", function(){
      expect(output).toBe("bar");
    })

  });
});
