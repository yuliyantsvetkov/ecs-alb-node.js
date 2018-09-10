const Hapi = require("hapi");

const server = Hapi.server({
  port: 80,
  host: "0.0.0.0"
});

server.route({
  method: "GET",
  path: "/",
  handler: () => "Coding challenge accomplished 🎉."
});

server.route({
  method: "GET",
  path: "/health",
  handler: () => ({
    status: "ok",
    version: {
      node: process.version,
      hapi: server.version
    }
  })
});

const init = async () => {
  await server.start();
  console.log(`Server running at: ${server.info.uri}`);
};

process.on("unhandledRejection", err => {
  console.log(err);
  process.exit(1);
});

init();
