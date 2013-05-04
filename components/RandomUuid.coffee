noflo = require("noflo")
uuid = require("node-uuid")

class RandomUuid extends noflo.Component

  description: "Generate a random UUID token"

  constructor: ->
    @inPorts =
      in: new noflo.Port
    @outPorts =
      out: new noflo.Port

    @inPorts.in.on "disconnect", =>
      token = uuid.v4()
      @outPorts.out.send(token)
      @outPorts.out.disconnect()

exports.getComponent = -> new RandomUuid
