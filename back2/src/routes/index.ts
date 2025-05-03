import type { FastifyInstance } from 'fastify';

const routes = async (server: FastifyInstance) => {
  server.get('/', {}, (_req, reply) => {
    reply.code(200).send({ dataSentFromBack2: 2 });
  });

  return server;
};

export default routes;
